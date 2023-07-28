using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using General;

public partial class main : UserPage
{
    public int id = DNTRequest.GetInt("id", 0);
    public string isShow = "style='display:none;'";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["YYadmin"]["Id"].ToString() == "1")
            {
                isShow = "";
            }
        }
    }

    protected void lbExit_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie cookie = Request.Cookies["YYadmin"];
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("~/w_b/w_b_l.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("~/w_b/w_b_l.aspx");
        }
    }
}
