
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_posterEdit : UserPage
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
        teacherAccout info = new teacherAccoutDAL().GetModel(id);
        txtAccout.Text = info.accoutInfo;
        txtPassWord.Text = info.accoutPwd;
        txtYiYuan.Text = info.moreCol;
    }

    #region 对象赋值
    public teacherAccout SetObjectValue()
    {
        teacherAccout info = new teacherAccout();
        info.createDate = DateTime.Now;
        info.descript = "";
        info.Id = id;

        info.moreCol = txtYiYuan.Text;
        info.moreCol1 = "";
      
        info.state = 0;
        info.accoutInfo = txtAccout.Text.Trim();
        info.accoutPwd = txtPassWord.Text.Trim();
        info.areaId = aid;
        return info;
    }
    #endregion

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        teacherAccout info = SetObjectValue();
        bool result = false;
        if (id > 0)
            result = new teacherAccoutDAL().Update(info);
        else
            result = new teacherAccoutDAL().Add(info) > 0 ? true : false;

        if (result == true)
        {
            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('操作成功!');location.href='posterList.aspx?aid=" + aid + "';", true);
        }


    }

}