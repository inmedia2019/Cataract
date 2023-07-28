using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class modifyPhoneInfo : System.Web.UI.Page
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
       
        //memberInfo minfo = new memberInfoDAL().GetModel(Session["b_signOid"].ToString());
       // minfo.phone = tel;
        string sql = "update memberInfo set phone='" + tel.Replace("'", "") + "' where openId='" + Session["b_signOid"].ToString() + "'";
        int result = DbHelper.ExecuteSql(sql);
       // bool result = new memberInfoDAL().Update(minfo);
        if (result > 0)
        {
            HttpCookie cookie = new HttpCookie("userPhone");
            cookie.Value = tel.Replace("'", "");
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);

            return "1";
        }
        //DataTable dt = new teacherAccoutDAL().GetList(" accoutInfo='" + tel.Replace("'", "") + "'").Tables[0];
        //if (dt.Rows.Count > 0)
        //{
        //    Session["areaId"] = dt.Rows[0]["Id"].ToString();
        //    Session["tName"] = tel.Replace("'", "");
        //    HttpCookie cookie = new HttpCookie("phone");
        //    cookie.Value = tel.Replace("'", "");
        //    cookie.Expires = DateTime.Now.AddDays(365);
        //    Response.Cookies.Add(cookie);

        //    HttpCookie cookies = new HttpCookie("areaId");
        //    cookies.Value = dt.Rows[0]["Id"].ToString();
        //    cookies.Expires = DateTime.Now.AddDays(365);
        //    Response.Cookies.Add(cookies);
        //    return "1";
        //}



        return "0";
    }
}