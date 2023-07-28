using System;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Web;
using System.Linq;
using System.Net;
using System.IO;
using System.Text;
using General;
public partial class AuthorizationPage : System.Web.UI.Page
{
    public string OpenId = DNTRequest.GetString("openId");

    public string backUrl = DNTRequest.GetString("backUrl");
    protected void Page_Load(object sender, EventArgs e)
    {

        string authorizer_appid = "6B599D2AD7460362B64C19BAFC4C08ACA7707C458076D0AB";
        authorizer_appid = Levox.Common.DEncrypt.DESEncrypt.Decrypt(authorizer_appid);

        if (string.IsNullOrEmpty(Request.QueryString["openid"]))
        {
            HttpCookie cookie = new HttpCookie("backUrl");
            cookie.Value = backUrl;
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);

            Response.Redirect("http://h5.atline.cn/server/userauthorize/userauthorize_jm.aspx?authorizer_appid=6B599D2AD7460362B64C19BAFC4C08ACA7707C458076D0AB&backUrl=http://jjsv.atline.cn/iCataract_line/authorization/AuthorizationPage.aspx");
        }
        else
        {
            string toUrl = Base64Decode(Request.Cookies["backUrl"].Value);

            if (toUrl.IndexOf("?") >= 0)
                toUrl = toUrl + "&openId=" + OpenId;
            else
                toUrl = toUrl + "?openId=" + OpenId;
            Response.Redirect(toUrl);

        }

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
    /// 获取当前URL  排除参数 code
    /// </summary>
    /// <returns></returns>
    public string GetCurrFullUrl()
    {
        string UPath = HttpContext.Current.Request.Url.AbsoluteUri;
        if (UPath.IndexOf('?') > 0)
        {
            UPath = UPath.Substring(0, UPath.IndexOf('?'));
        }

        string qs = HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
        if (qs == "")
        {
            return UPath;
        }
        else
        {
            string[] arrPara = qs.Split('&');
            string NewPara = "";
            foreach (string item in arrPara)
            {
                if (item.Length >= 5 && item.ToLower().Substring(0, 5) == "code=")
                {

                }
                else
                {
                    NewPara += item + "&";
                }
            }
            if (NewPara != "")
            {
                NewPara = NewPara.Substring(0, NewPara.Length - 1);
                UPath += "?" + NewPara;
            }
        }
        return HttpUtility.HtmlEncode(UPath);
    }
}