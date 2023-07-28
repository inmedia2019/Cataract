using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using Aspose.Cells;
using System.Text;
using System.Text.RegularExpressions;

public partial class zLists : UserPage
{
    public string tname = "信息管理";
   
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
        string sqlWhere = " and len(passCode)>0";

        if (txtKeyWord.Text.Trim() != "")
            sqlWhere += " and (trueName like '%" + txtKeyWord.Text.Trim() + "%' or openId like '%" + txtKeyWord.Text.Trim() + "%')";

        string tbName = "memberInfo";
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, MyPager.Pagesize, MyPager.Pageindex + 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
        MyPager.Count = count;
    }
    #endregion

    protected void MyPager_PageIndexChange(object sender, EventArgs e)
    {
        BindData();
    }
    
    
    protected void btnOut_Click(object sender, EventArgs e)
    {
        DataTable dts = new DataTable();
        string sqlWhere = " where len(passCode)>0";

        if (txtKeyWord.Text.Trim() != "")
              sqlWhere += " and (trueName like '%" + txtKeyWord.Text.Trim() + "%' or openId like '%" + txtKeyWord.Text.Trim() + "%')";

        string tbName = "memberInfo";
       
        dts =  AllTableHelp.GetTableInfo(tbName,"*",sqlWhere);

        StringBuilder builder = new StringBuilder();

        builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
        builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");

        builder.AppendLine("<td>姓名</td>");
        builder.AppendLine("<td>邮箱</td>");
        builder.AppendLine("<td>密码</td>");
        builder.AppendLine("<td>医院</td>");
        builder.AppendLine("<td>省份</td>");
        builder.AppendLine("<td>强生销售</td>");
        builder.AppendLine("<td>手术标题</td>");
        builder.AppendLine("<td>手术类型</td>");
        builder.AppendLine("<td>手术描述</td>");
        builder.AppendLine("<td>时间</td>");
        builder.AppendLine("</tr>");

        if (dts.Rows.Count > 0)
        {
            foreach (DataRow row in dts.Rows)
            {
                builder.AppendLine("<tr>");

                builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["trueName"].ToString() + "</td>");
                builder.AppendLine("<td>" + row["email"].ToString() + "</td>");
                builder.AppendLine("<td>" + row["passCode"].ToString() + "</td>");
                builder.AppendLine("<td>" + row["hospital"].ToString() + "</td>");
                builder.AppendLine("<td>" + row["proviceName"].ToString() + "</td>");
                builder.AppendLine("<td>" + row["saleName"].ToString() + "</td>");
                builder.AppendLine("<td>" + row["title"].ToString() + "</td>");
                builder.AppendLine("<td>" + GetMajorType(row["majorType"].ToString()) + "</td>");
                builder.AppendLine("<td>" + row["descript"].ToString() + "</td>");
               

                builder.AppendLine("<td>" + row["createDate"].ToString() + "</td>");
                builder.AppendLine("</tr>");
            }
            builder.AppendLine("</table>");
            this.Page.Response.Clear();
            this.Page.Response.Buffer = false;
            //this.Page.Response.Charset = "utf-8";
            
            this.Page.Response.AppendHeader("Content-Disposition", "attachment;filename=UserOrder.xls");
            //this.Page.Response.ContentEncoding = Encoding.GetEncoding("gb2312");
            
            this.Page.Response.ContentType = "application/ms-excel";
            this.Page.EnableViewState = false;
            this.Page.Response.Write("<meta http-equiv=Content-Type; content=text/html;charset=utf-8>");  
            this.Page.Response.Write(builder.ToString());
            this.Page.Response.End();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(btnOut, GetType(), "", "alert('该板块还没有数据!');", true);
        }
    }

   
    #region 返回手术类型
    public string GetMajorType(string userType)
    { 
       if(userType=="1")
           return "青光眼合并白内障";
       else if(userType=="2")
           return "糖尿病合并白内障";
       else if(userType=="3")
           return "高度近视白内障";
       else
           return "其他";
    }
    #endregion

    protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "del")
            {
                bool result = new memberInfoDAL().Delete(Utils.ToInt(e.CommandArgument));
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
        bool result = new memberInfoDAL().DeleteList(hfIds.Value.Substring(0, hfIds.Value.Length - 1));
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


