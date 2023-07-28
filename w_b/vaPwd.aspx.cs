using bsc.DAL;
using bsc.Model;
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_vaPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string txtOldPwd = Request.Form["txtOldPwd"];
        Response.Write(GetMessage(txtOldPwd));
        Response.End();
    }

    private string GetMessage(string txtOldPwd)
    {
        y_admin info = new y_adminDAL().GetModel(1);
        txtOldPwd = new SymmetricMethod().Encrypto(txtOldPwd);
        if (info.pwd == txtOldPwd)
            return "1";
        return "0";
    }
}