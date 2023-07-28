using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
public partial class videoDetail : WebPages
{
    public int id = DNTRequest.GetInt("id", 0);
    public string videoId = "";
    public string areaInfo = "暂未分配区域";
    public string codeInfo = "暂无编号";
    public int clickNum = 0;
    public int dNum = 0;
    public string descriptInfo = "";
    public int isDZ = 0;
    public string pptContent = "";
    public string oid = DNTRequest.GetString("oid");
    public string imgsSrc = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (oid.Length == 0)
       // {
           // Response.Redirect("https://wx.linkmed.cn/icataract_s/authorization/?backUrl=" + Base64Code(Request.Url.ToString()));
           // return;
      //  }
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DataTable dt = new memberInfoDAL().GetList(" openId='" + Oid + "'").Tables[0];
        userActionInfo uinfo = new userActionInfo();
        uinfo.mid = Utils.ToInt(dt.Rows[0]["Id"]);
        uinfo.tid = 0;
        uinfo.infoId = id;
        uinfo.createDate = DateTime.Now;
        uinfo.descript = "";
        uinfo.state = 0;
        uinfo.moreCol = "";
        uinfo.moreCol1 = "";
        new userActionInfoDAL().Add(uinfo);

        productInfo info = new productInfoDAL().GetModel(id);
        videoId = info.videoId;
        descriptInfo = info.descript;
        pptContent = info.pptContent;
        string[] tempInfo = GetHtmlImageUrlList(pptContent).Split(',');
        for (int i = 0; i < tempInfo.Length; i++)
        {
            if (tempInfo[i].Trim().Length > 0)
                imgsSrc += "\"https://wx.linkmed.cn" + tempInfo[i] + "\",";
        }
        if (imgsSrc.Length > 0)
            imgsSrc = imgsSrc.Substring(0, imgsSrc.Length - 1);
        ztypeInfo zinfo=new ztypeInfoDAL().GetModel(info.areaId);
        try
        {
            if (info.areaId > 0)
            {
                areaInfo = zinfo.sname;

                if (info.Id.ToString().Length == 1)
                    codeInfo = zinfo.descript + "000" + info.Id.ToString();
                else if (info.Id.ToString().Length == 2)
                    codeInfo = zinfo.descript + "00" + info.Id.ToString();
                else if (info.Id.ToString().Length == 3)
                    codeInfo = zinfo.descript + "0" + info.Id.ToString();
                else if (info.Id.ToString().Length == 4)
                    codeInfo = zinfo.descript + info.Id.ToString();
            }

            clickNum = new userActionInfoDAL().GetRecordCount(" infoId=" + info.Id + " and tid=0");
            dNum = new userActionInfoDAL().GetRecordCount(" infoId=" + info.Id + " and tid=1");
            isDZ = new userActionInfoDAL().GetRecordCount(" infoId=" + info.Id + " and tid=1 and mid=" + Utils.ToInt(dt.Rows[0]["Id"]));
        }
        catch (Exception)
        {

          
        }
        

        
    }

    /// <summary>
    /// 取得HTML中所有图片的 URL。
    /// </summary>
    /// <param name="sHtmlText">HTML代码</param>
    /// <returns>图片的URL列表</returns>
    public static string GetHtmlImageUrlList(string sHtmlText)
    {
        Regex re = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

        MatchCollection matches = re.Matches(sHtmlText);
        string sUrlList = "";
        int i = 0;
        foreach (Match mh in matches)
        {
            sUrlList += mh.Groups[1].Value + ",";
        }

        return sUrlList;
    }

    /// <summary>  
    /// Base64加密  
    /// </summary>  
    /// <param name="Message"></param>  
    /// <returns></returns>  
    public string Base64Code(string Message)
    {
        byte[] bytes = System.Text.Encoding.Default.GetBytes(Message);
        return Convert.ToBase64String(bytes);
    }  
   
}