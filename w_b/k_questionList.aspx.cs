using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class k_questionList : UserPage
{
    public string tname = "问题列表";
    public int tid = DNTRequest.GetInt("tid", 0);
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
        string sqlWhere = " and tid=" + tid;

        if (txtKeyWord.Text.Trim() != "")
            sqlWhere += " and (title like '%" + txtKeyWord.Text.Trim() + "%')";

        string tbName = "B_Video_bquestions";
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "sn asc,createDate", false, MyPager.Pagesize, MyPager.Pageindex + 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
        MyPager.Count = count;
    }
    #endregion

    #region 返回题目类型
    public string GetCid(string cid)
    {
        if (cid == "0")
            return "单选题";
        else if (cid == "1")
            return "多选题";
        else if (cid == "2")
            return "文本题";
        return "满意度题";
    }
    #endregion

    protected void MyPager_PageIndexChange(object sender, EventArgs e)
    {
        
        BindData();
       
    }

    protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "del")
            {
                bool result = new bquestionsDAL().Delete(Utils.ToInt(e.CommandArgument));
                if (result == true)
                {
                    ScriptManager.RegisterClientScriptBlock(rptData, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
                }
            }
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        BindData();
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        bool result = new bquestionsDAL().DeleteList(hfIds.Value.Substring(0, hfIds.Value.Length - 1));
        if (result == true)
        {
            ScriptManager.RegisterClientScriptBlock(btnDel, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
        }
    }

    protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {

        }
    }

    
 

}


