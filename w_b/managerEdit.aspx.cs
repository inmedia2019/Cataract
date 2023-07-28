
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_managerEdit : UserPage
{
    public int id = DNTRequest.GetInt("id", 0);
    public int aid = DNTRequest.GetInt("aid", 0);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (id > 0)
                BindData();
        }
    }

    private void BindData()
    {
        y_admin info = new y_adminDAL().GetModel(id);
        txtAccout.Text = info.username;
        txtPassWord.Text = new SymmetricMethod().Decrypto(info.pwd);
    }

    #region 对象赋值
    public y_admin SetObjectValue()
    {
        y_admin info = new y_admin();

        info.createDate = DateTime.Now;

        info.userid = id;

        info.morecol = "";
        info.morecol1 = aid.ToString();
      
        info.state = 0;
        info.username = txtAccout.Text;
        info.pwd = new SymmetricMethod().Encrypto(txtPassWord.Text.Trim());

        return info;
    }
    #endregion

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        y_admin info = SetObjectValue();
        bool result = false;
        if (id > 0)
            result = new y_adminDAL().Update(info);
        else
            result = new y_adminDAL().Add(info) > 0 ? true : false;

        if (result == true)
        {
            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('操作成功!');location.href='managerList.aspx?aid=" + aid + "';", true);
        }
    }

}