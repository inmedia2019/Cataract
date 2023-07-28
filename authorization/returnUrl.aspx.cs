using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class authorization_returnUrl : System.Web.UI.Page
{
    public string openId = DNTRequest.GetString("openId");
    public string backUrl = DNTRequest.GetString("returnUrl");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (openId.Length == 0)
        {
            HttpCookie cookie = new HttpCookie("returnUrl");
            cookie.Value = backUrl;
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);

            string url = Base64Code(Request.Url.ToString());
            Response.Redirect("~/authorization/AuthorizationPage.aspx?backUrl=" + url);
            return;
        }
        else
        {
            Session["b_signOid"] = openId;

         

            string returnUrl = Request.Cookies["returnUrl"].Value;
            Response.Redirect(Base64Decode(returnUrl));
        }
    }

    /// <summary>  
    /// Base64解密  
    /// </summary>  
    /// <param name="Message"></param>  
    /// <returns></returns>  
    public string Base64Decode(string Message)
    {
        byte[] bytes = Convert.FromBase64String(Message);
        return Encoding.Default.GetString(bytes);
    }  

    /// <summary>  
    /// Base64加密  
    /// </summary>  
    /// <param name="Message"></param>  
    /// <returns></returns>  
    public string Base64Code(string Message)
    {
        byte[] bytes = Encoding.Default.GetBytes(Message);
        return Convert.ToBase64String(bytes);
    }  
}