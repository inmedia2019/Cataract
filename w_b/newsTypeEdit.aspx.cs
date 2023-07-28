
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class w_b_newsTypeEdit : UserPage
{
  
    public int id = DNTRequest.GetInt("id", 0);
    public string src = "";
    public string sbStr = "";
    public string src1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        if (id > 0)
        {
            ztypeInfo info = new ztypeInfoDAL().GetModel(id);
            txtTitle.Text = info.sname;
            if (info.morecol1 != "")
                src =  info.morecol1;
            picurl.Value = info.morecol1;
            if (info.tName != "")
                src1 = info.tName;
            picurl1.Value = info.tName;

            txtSn.Text = info.morecol.ToString();
            txtZiMu.Text = info.descript;
            txtName.Text = info.tName;
            txtPass.Text = info.tPassWord;
            hftids.Value = info.description;
            //if (info.description.Length > 0)
            //{
            //    DataTable dtChild = new productInfoDAL().GetList(" id in(" + info.description.Substring(0, info.description.Length - 1) + ") and state=1").Tables[0];

            //    for (int i = 0; i < dtChild.Rows.Count; i++)
            //    {
            //        sbStr += "<tr id='more_graphics_table" + "tr" + dtChild.Rows[i]["Id"].ToString() + "'><td><input type='hidden' name='votetouser[0][]'  value='" + dtChild.Rows[i]["Id"].ToString() + "' />" + dtChild.Rows[i]["title"].ToString() + "_" + dtChild.Rows[i]["trueName"].ToString() + "</td><td><a href='javascript:void(0)' class='btn btn-mini del'><i class='icon-remove'>X</i></a></td></tr>";
            //    }
            //}        
        }
    }

    #region 对象赋值
    public ztypeInfo SetObjectValue()
    {
        ztypeInfo info = new ztypeInfo();
        info.sname = txtTitle.Text;
        info.isRecommand = 0;
        info.descript = txtZiMu.Text;
        info.description = hftids.Value;
        info.state = 0;
        info.createDate = DateTime.Now;
        info.morecol = txtSn.Text;
        info.morecol1 = picurl.Value;
        info.tName = picurl1.Value;
        info.tPassWord = txtPass.Text;
        info.Id = id;
        return info;
    }
    #endregion

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ztypeInfo info = SetObjectValue();
        bool result = false;
        if (id > 0)
            result = new ztypeInfoDAL().Update(info);
        else
            result = new ztypeInfoDAL().Add(info) > 0 ? true : false;

        if (result == true)
        {
            //if (info.description.Length > 0)
            //{
            //    string sql = "update productInfo set areaId=0 where areaId=" + info.Id;
            //    string sql1 = "update productInfo set areaId=" + info.Id + " where id in(" + info.description.Substring(0, info.description.Length - 1) + ")";
            //    DbHelper.ExecuteSql(sql);
            //    DbHelper.ExecuteSql(sql1);
            //}
            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('操作成功!');location.href='newsTypeList.aspx';", true);
        }

       
    }
}