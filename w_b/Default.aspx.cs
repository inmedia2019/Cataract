using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using General;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    public string p = DNTRequest.GetString("p");
    protected void Page_Load(object sender, EventArgs e)
    {
       //if(Request.UrlReferrer==null)  
       //{
       //   Response.Write("非法请求");
       //   return;
       //}
       //string[] temp = Base64Decode(p).Split('&');
       //string cwid = temp[1].Split('=')[1];
       ////Response.Write(cwid);
       //this.Session["cwid"] = cwid;
       //Response.Redirect("~/w_b/main.aspx");
    }

    public string Base64Decode(string Message)
    {
        byte[] bytes = Convert.FromBase64String(Message);
        return Encoding.Default.GetString(bytes);
    }  
}