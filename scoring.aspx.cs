using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Dm.Model.V20151123;
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
public partial class scoring : TeacherPage
{
    public string videoId = "";
    public string areaInfo = "";
    public string codeInfo = "";
  
    public string descriptInfo = "";
    public int id = DNTRequest.GetInt("id", 0);
    public string in1 = "";
    public string in2 = "";
    public string in3 = "";
    public string in4 = "";
    public string in5 = "";
    public int tid = 0;
    public int isSelf = 1;
    public string pptContent = "";
    public int N = DNTRequest.GetInt("t", 0);
    public int sumScore = 0;
    public string py = "";
    public string yearInfo = "暂无信息";
    public int counts1 = 0;
    public int counts2 = 0;
    public int counts3 = 0;
    public int isTj = 0;
    public string imgsSrc = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
         isTj = new FormInfoDAL().GetRecordCount(" phone=" + Session["tName"].ToString() + " and state<>3");
        counts1 = new userActionInfoDAL().GetRecordCount(" moreCol='" + Session["tName"].ToString() + "' and tid=2"); //当前专家已经评分了10个视频
        counts2 = new userActionInfoDAL().GetRecordCount(" moreCol='" + Session["tName"].ToString() + "' and tid=2 and infoId=" + id); //当前专家已经评分了10个视频是否包含了当前视频
        counts3 = new userActionInfoDAL().GetRecordCount(" tid=2 and infoId=" + id); //该视频是否被平满 
        if (counts2 > 0)
            counts1 = 0;

        productInfo info = new productInfoDAL().GetModel(id);
        videoId = info.videoId;
        tid = info.areaId;
        pptContent = info.pptContent;
        string[] tempInfo = GetHtmlImageUrlList(pptContent).Split(',');
        for (int i = 0; i < tempInfo.Length; i++)
        {
            if (tempInfo[i].Trim().Length > 0)
                imgsSrc += "\"https://wx.linkmed.cn" + tempInfo[i] + "\",";
        }
        if (imgsSrc.Length > 0)
            imgsSrc = imgsSrc.Substring(0, imgsSrc.Length - 1);

       // teacherAccout teacherInfo = new teacherAccoutDAL().GetModel(Utils.ToInt(Session["areaId"]));
        DataTable dtTeacher = new teacherAccoutDAL().GetList(" accoutInfo='" + Session["tName"].ToString() + "'").Tables[0];
        for (int i = 0; i < dtTeacher.Rows.Count; i++)
        {
            if (Utils.ToInt(dtTeacher.Rows[i]["areaId"]) == tid)
            {
                isSelf = 0;
            }
        }
        

        ztypeInfo zinfo = new ztypeInfoDAL().GetModel(info.areaId);
        try
        {

            string sqlTemp = "select moreCol1 from memberInfo where passCode='" + info.moreCol1 + "'";
            string tempStr = Utils.ToString(DbHelper.ExecuteScalar(CommandType.Text, sqlTemp, null));

            if (tempStr.Length > 0)
            {
                yearInfo = "超声乳化手术经验 " + tempStr.Split('|')[0] + "年<br />屈光性白内障手术总量 " + tempStr.Split('|')[1] + "例";
            }

            descriptInfo = info.descript;
           
            try
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
            catch (Exception)
            {
                if (info.Id.ToString().Length == 1)
                    codeInfo = "000" + info.Id.ToString();
                else if (info.Id.ToString().Length == 2)
                    codeInfo = "00" + info.Id.ToString();
                else if (info.Id.ToString().Length == 3)
                    codeInfo =  "0" + info.Id.ToString();
                else if (info.Id.ToString().Length == 4)
                    codeInfo =  info.Id.ToString();
               
            }
         
            

           
           
            string sql = "select moreCol1 from userActionInfo where infoId=" + id + " and moreCol='" + Session["tName"].ToString() + "'";
            string temp = Utils.ToString(DbHelper.ExecuteScalar(CommandType.Text, sql, null));
            if (temp.Length > 0)
            {
                in1 = temp.Split('|')[0];
                in2 = temp.Split('|')[1];
                in3 = temp.Split('|')[2];
                in4 = temp.Split('|')[3];
                in5 = temp.Split('|')[4];
            }


            string sqls = "select descript from userActionInfo where infoId=" + id + " and moreCol='" + Session["tName"].ToString() + "'";
            string temps = Utils.ToString(DbHelper.ExecuteScalar(CommandType.Text, sqls, null));
            if (temps.Length > 0)
            {
                py = temps;
            }
            sumScore = Utils.ToInt(in1) + Utils.ToInt(in2) + Utils.ToInt(in3) + Utils.ToInt(in4) + Utils.ToInt(in5);

         
         
        }
        catch (Exception ex)
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
        string sUrlList="";
        int i = 0;
        foreach (Match mh in matches)
        {
            sUrlList += mh.Groups[1].Value + ",";
        }

        return sUrlList;
    }

    
}