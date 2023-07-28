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
using System.Collections.Generic;
using Newtonsoft.Json;

public partial class w_b_l : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.HttpMethod.Equals("post", StringComparison.CurrentCultureIgnoreCase))
        //{
          // if (Request.Form["AppSubscriptionID"] != null && Request.Form["PlatformUserAccount"] != null)
          //  {
             //   BackboneUser user = new BackboneUser()
             //   {
                  //  SID = Guid.Parse(Request.Form["AppSubscriptionID"].ToString()),
                  //  PlatformUserAccount = Request.Form["PlatformUserAccount"].ToString(),
                  //  Permissions = JsonConvert.DeserializeObject<List<string>>(Request.Form["AppPermission"].ToString())
                //};
               // this.Session["Backbone_User"] = user;
           // }
       // }
        //else
       // {
          //  if (this.Session["Backbone_User"] == null)
          //  {

             //   Response.Redirect("error.aspx");
           // }

           // if (this.Request.QueryString["type"] != null && this.Request.QueryString["type"].ToLower() == "noright")
           // {

                //Response.Redirect("error.aspx");
           // }
       // }
        
       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
      
        string loginName = txtLoginName.Text.Trim();
        string loginPwd = new SymmetricMethod().Encrypto(txtPwd.Text.Trim());
        y_admin loginUser = new y_adminDAL().GetUserInfo(loginName, loginPwd);
        if (loginUser == null)
        {
            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('用户名或密码错误!');", true);
        }
        else
        {
            HttpCookie cookie = new HttpCookie("YYadmin");
            cookie["adminName"] = Server.UrlEncode(loginUser.username);
            cookie["S_pwd"] = loginUser.pwd;
            cookie["Id"] = loginUser.userid.ToString();
            Response.Cookies.Add(cookie);

            Response.Redirect("~/w_b/main.aspx");
        }
    }
}
