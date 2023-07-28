using bsc.DAL;
using bsc.Model;
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_modifyPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        y_admin info = new y_adminDAL().GetModel(1);
        info.pwd = new SymmetricMethod().Encrypto(txtQPwd.Text.Trim());
        bool result = new y_adminDAL().Update(info);
        if (result == true)
        {
            try
            {
                HttpCookie cookie = Request.Cookies["YYadmin"];
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
              
            }
            catch (Exception)
            {
               
            }
            Response.Write("<script>alert('操作成功!');window.parent.location.href='w_b_l.aspx';</script>");
        }
    }
}