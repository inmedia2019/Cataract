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
    public int tid = DNTRequest.GetInt("tid", 0);
    public string areaInfo = "";
    public string oid = DNTRequest.GetString("oid");
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (oid.Length == 0)
        //{
           // Response.Redirect("https://wx.linkmed.cn/icataract_s/authorization/?backUrl=" + Base64Code(Request.Url.ToString()));
          //  return;
       // }

        if (!IsPostBack)
        {
           
            BindData();
        }
    }

    private void BindData()
    {
        DataTable tb = new ztypeInfoDAL().GetList(" state<>3 order by cast(moreCol as int) desc").Tables[0];
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            areaInfo += "<option value=" + tb.Rows[i]["Id"].ToString() + ">" + tb.Rows[i]["sname"].ToString() + "</option>";
        }

        string tbName = "(select productInfo.*,clickNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=0),"+
        "dNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=1),code=(select cast(descript as varchar) from ztypeInfo where productInfo.areaId=Id)) as tb";
        string tbName = "productInfo";
        int count = 0;
        string sqlWhere = "";
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, MyPager.Pagesize, MyPager.Pageindex + 1, sqlWhere, out count);
    }

    #region 返回代码
    public string GetCode(string productId, string code)
    {
        if (productId.Length == 1)
            return code + "000" + productId;
        else if (productId.Length == 2)
            return code + "00" + productId;
        else if (productId.Length == 3)
            return code + "0" + productId;
        else if (productId.Length == 4)
            return code+ productId;
        return "";
    }
    #endregion

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