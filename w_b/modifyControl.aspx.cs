using bsc.DAL;
using bsc.Model;
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_modifyControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          y_admin info = new y_adminDAL().GetModel(3);
          if(info.state==1)
            ckInfo.Checked=true;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        y_admin info = new y_adminDAL().GetModel(3);
        if(ckInfo.Checked==true)
          info.state = 1;
        else
          info.state = 0;
        bool result = new y_adminDAL().Update(info);
        if (result == true)
        {
           
            Response.Write("<script>alert('操作成功!');</script>");
        }
    }
}