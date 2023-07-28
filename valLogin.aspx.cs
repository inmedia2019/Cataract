using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class valLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string password = Request.Form["password"];

        Response.Write(GetMessage(password));
        Response.End();
    }

    private string GetMessage(string password)
    {
        DataTable dt = new memberInfoDAL().GetList(" passCode='" + password.Replace("'", "") + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            Session["mid"] = dt.Rows[0]["Id"].ToString();
            Session["passCode"] = dt.Rows[0]["passCode"].ToString();
            return "1";
        }
        return "0";
    }
}