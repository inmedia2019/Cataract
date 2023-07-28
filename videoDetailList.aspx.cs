using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class videoDetailList : WebPages
{
    public string areaInfo = "";
    public int tid = DNTRequest.GetInt("tid", 0);
    public string oid = DNTRequest.GetString("oid");
    public string sName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (oid.Length == 0)
       // {
          //  Response.Redirect("https://wx.linkmed.cn/icataract_s/authorization/?backUrl=" + Base64Code(Request.Url.ToString()));
          //  return;
      //  }
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DataTable dt = new ztypeInfoDAL().GetList(" state<>3 order by cast(moreCol as int) desc").Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            areaInfo += "<option value=\"" + dt.Rows[i]["Id"].ToString() + "\">" + dt.Rows[i]["sname"].ToString() + "</option>";
        }

        sName = new ztypeInfoDAL().GetModel(tid).sname;

        string tbName = "(select productInfo.*,clickNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=0)," +
                        "dNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=1)," +
                        "code=(select cast(descript as varchar) from ztypeInfo where areaId=ztypeInfo.Id) from productInfo) as tb";
        string sqlWhere = " and state=1 and areaId=" + tid;
        int count = 0;
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, 30, 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
    }

    public string GetCode(string productId, string codeInfo)
    {
        if (productId.Length == 1)
        {
            return codeInfo + "000" + productId;
        }
        else if (productId.Length == 2)
        {
            return codeInfo + "00" + productId;
        }
        else if (productId.Length == 3)
        {
            return codeInfo + "0" + productId;
        }
        else if (productId.Length == 4)
        {
            return codeInfo +  productId;
        }
        return "";
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