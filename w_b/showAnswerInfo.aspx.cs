using bsc.DAL;
using bsc.Model;
using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_showAnswerInfo : UserPage
{
    public int qid = DNTRequest.GetInt("qid", 0);
    public int lid = DNTRequest.GetInt("lid", 0);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    #region 绑定数据
    public void BindData()
    {
        int count = 0;
        string sqlWhere = " and qid=" + qid + " and lid=" + lid;

        string tbName = "B_Video_banswerInfo";
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "cast(moreCol as int) asc, createDate", false, MyPager.Pagesize, MyPager.Pageindex + 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
        MyPager.Count = count;
    }
    #endregion


    protected void MyPager_PageIndexChange(object sender, EventArgs e)
    {
        BindData();
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        BindData();
    }

    protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "del")
            {
                bool result = new banswerInfoDAL().Delete(Utils.ToInt(e.CommandArgument));
                if (result == true)
                {
                    ScriptManager.RegisterClientScriptBlock(rptData, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
                }
            }
        }
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        bool result = new banswerInfoDAL().DeleteList(hfIds.Value.Substring(0, hfIds.Value.Length - 1));
        if (result == true)
        {
            ScriptManager.RegisterClientScriptBlock(btnDel, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
        }
    }

}