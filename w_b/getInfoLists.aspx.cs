using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_getInfoLists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string key = Request.Form["key"];

        string page = Request.Form["page"];
      
        Response.Write(GetMessage(key, page));
        Response.End();
    }

    private string GetMessage(string key, string page)
    {
        int count = 0;
        string sqlWhere = " and state=1 and areaId=0";

        if (key.Length > 0)
            sqlWhere += " and title like '%" + key + "%'";

        string tbName = "productInfo";
        DataTable dt = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, MyPager.Pagesize, Utils.ToInt(page), sqlWhere, out count);

        string sbStr = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sbStr += "<li> <label> <input type=\"checkbox\" name=\"check\" t=\"" + dt.Rows[i]["title"].ToString().Replace("\"", "\\\"") + "\" value=\"" + dt.Rows[i]["Id"].ToString() + "\" />  " + dt.Rows[i]["title"].ToString().Replace("\"", "\\\"") + "_" + dt.Rows[i]["trueName"].ToString().Replace("\"", "\\\"") + "</label></li>";
        }

        sbStr += "|||" + count.ToString();
        return sbStr;
    }

    protected void MyPager_PageIndexChange(object sender, EventArgs e)
    {

    }

}
