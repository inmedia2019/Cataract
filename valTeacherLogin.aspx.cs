using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class valTeacherLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string tel = Request.Form["tel"];
     
        Response.Write(GetMessage(tel));
        Response.End();
    }

    private string GetMessage(string tel)
    {

        DataTable dt = new teacherAccoutDAL().GetList(" accoutInfo='" + tel.Replace("'", "") + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            Session["areaId"] = dt.Rows[0]["Id"].ToString();
            Session["tName"] = tel.Replace("'", "");
            HttpCookie cookie = new HttpCookie("phone");
            cookie.Value = tel.Replace("'", "");
            cookie.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(cookie);

            HttpCookie cookies = new HttpCookie("areaId");
            cookies.Value = dt.Rows[0]["Id"].ToString();
            cookies.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(cookies);
            return "1";
        }
        return "0";
    }
}