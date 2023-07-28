using Aspose.Cells;
using bsc.DAL;
using bsc.Model;
using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_videoInfoList : UserPage
{
    public int tid = DNTRequest.GetInt("tid", 0);
    public string isShow = "";
    
    public string toUrl = "";
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
        if (tid > 0)
        {
            B_Video_bnewsType info = new B_Video_bnewsTypeDAL().GetModel(tid);
            if (info.tid == 1)
            {
                isShow = "style='display:none'";
                toUrl = "videoInfoList.aspx?tid=" + info.pid;
            }
            else
                toUrl = "newsTypeList.aspx?tid=" + info.pid;

          
        }
        int count = 0;
        string sqlWhere = " and pid=" + tid + " and tid=1";

        if (txtKeyWord.Text.Trim() != "")
            sqlWhere += " and (title like '%" + txtKeyWord.Text.Trim() + "%')";

        string tbName = "B_Video_bnewsType";
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "sn asc,createDate", false, MyPager.Pagesize, MyPager.Pageindex + 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
        MyPager.Count = count;
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
                bool result = new B_Video_bnewsTypeDAL().Delete(Utils.ToInt(e.CommandArgument));
                if (result == true)
                {
                    ScriptManager.RegisterClientScriptBlock(rptData, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
                }
            }

            if (e.CommandName == "outPut")
            {
                B_Video_bnewsType tinfo = new B_Video_bnewsTypeDAL().GetModel(Utils.ToInt(e.CommandArgument));
                DataTable dts = new DataTable();
                string sqlWhere = " where tid=" + Utils.ToInt(e.CommandArgument);



                string tbName = "(select B_Video_buserAnswers.*,B_Video_memberInfo.headImgUrl as headpic,B_Video_memberInfo.trueName as phone,B_Video_memberInfo.nickName as trueName,B_Video_memberInfo.openId as CWID,B_Video_memberInfo.email from B_Video_buserAnswers left join B_Video_memberInfo on B_Video_buserAnswers.openId=B_Video_memberInfo.openId) as tb";

                dts = AllTableHelp.GetTableInfo(tbName, "*", sqlWhere);

                //string s = "1ん改进及建议〓2ん4,〓3ん7,〓";

                StringBuilder builder = new StringBuilder();

                builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
                builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");

                builder.AppendLine("<td>CWID</td>");
                builder.AppendLine("<td>昵称</td>");
                builder.AppendLine("<td>手机</td>");
                builder.AppendLine("<td>邮箱</td>");
                builder.AppendLine("<td>分数</td>");
                string questionStr = "";
                DataTable dtQuestion = new bquestionsDAL().GetList(" tid=" + tinfo.moreCol + " order by sn asc").Tables[0];
                for (int i = 0; i < dtQuestion.Rows.Count; i++)
                {
                    questionStr += "<td>" + dtQuestion.Rows[i]["title"].ToString() + (dtQuestion.Rows[i]["entitle"].ToString() == "" ? "" : " / ") + dtQuestion.Rows[i]["entitle"].ToString() + "</td>";
                }
                builder.AppendLine(questionStr);
                builder.AppendLine("<td>时间</td>");
                builder.AppendLine("</tr>");

                if (dts.Rows.Count > 0)
                {
                    foreach (DataRow row in dts.Rows)
                    {
                        builder.AppendLine("<tr>");

                        builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["CWID"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["trueName"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["phone"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["email"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["moreCol"].ToString() + "</td>");
                        for (int i = 0; i < dtQuestion.Rows.Count; i++)
                        {
                            int num = 0;
                            string[] AnswerStr = row["answers"].ToString().Split('〓');
                            for (int j = 0; j < AnswerStr.Length; j++)
                            {
                                if (AnswerStr[j].Length > 0)
                                {
                                    if (AnswerStr[j].Split('ん')[0] == dtQuestion.Rows[i]["Id"].ToString())
                                    {
                                        builder.AppendLine("<td>" + GetAnswer(AnswerStr[j].Split('ん')[1], dtQuestion.Rows[i]["cid"].ToString()) + "</td>");
                                        num++;
                                    }
                                }
                            }

                            if (num == 0)
                            {
                                builder.AppendLine("<td>/</td>");
                            }

                        }

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
                    ScriptManager.RegisterClientScriptBlock(btn_search, GetType(), "", "alert('该板块还没有数据!');", true);
                }

            }

            if (e.CommandName == "outPutTime")
            {
                B_Video_bnewsType tinfo = new B_Video_bnewsTypeDAL().GetModel(Utils.ToInt(e.CommandArgument));
                DataTable dts = new DataTable();
                string sqlWhere = " where infoId=" + Utils.ToInt(e.CommandArgument);



                string tbName = "(select B_Video_userActionInfo.*,B_Video_memberInfo.headImgUrl as headpic,B_Video_memberInfo.trueName as phone,B_Video_memberInfo.nickName as trueName,B_Video_memberInfo.openId as CWID,B_Video_memberInfo.email from B_Video_userActionInfo left join B_Video_memberInfo on B_Video_userActionInfo.mid=B_Video_memberInfo.Id) as tb";

                dts = AllTableHelp.GetTableInfo(tbName, "*", sqlWhere);

                //string s = "1ん改进及建议〓2ん4,〓3ん7,〓";

                StringBuilder builder = new StringBuilder();

                builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
                builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");

                builder.AppendLine("<td>CWID</td>");
                builder.AppendLine("<td>昵称</td>");
                builder.AppendLine("<td>手机</td>");
                builder.AppendLine("<td>邮箱</td>");
                builder.AppendLine("<td>观看时长</td>");
                builder.AppendLine("<td>时间</td>");
                builder.AppendLine("</tr>");

                if (dts.Rows.Count > 0)
                {
                    foreach (DataRow row in dts.Rows)
                    {
                        builder.AppendLine("<tr>");

                        builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["CWID"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["trueName"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["phone"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["email"].ToString() + "</td>");
                        builder.AppendLine("<td>" + row["vtime"].ToString() + "</td>");
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
                    ScriptManager.RegisterClientScriptBlock(btn_search, GetType(), "", "alert('该板块还没有数据!');", true);
                }
            }

        }
    }



    #region 返回答案
    public string GetAnswer(string answer, string cid)
    {
        string returnStr = "";
        try
        {
            if (cid != "2")
            {

                if (answer.Length > 0)
                    answer = answer.Substring(0, answer.Length - 1);

                string[] tempAnswer = answer.Split(',');

                for (int k = 0; k < tempAnswer.Length; k++)
                {
                    if (tempAnswer[k].Trim().Length > 0)
                    {
                        string[] n_child = tempAnswer[k].Split('△');
                        banswerInfo tempInfo = new banswerInfoDAL().GetModel(Utils.ToInt(n_child[0]));
                        if (tempAnswer[k].IndexOf('△') >= 0)
                            returnStr += tempInfo.ainfo + "(" + n_child[1] + ")" + "<br />";
                        else
                            returnStr += tempInfo.ainfo + "<br />";

                    }
                }
            }
            else
                returnStr = answer;
        }
        catch (Exception)
        {
            returnStr = answer;

        }


        return returnStr;
    }
    #endregion

    protected void btn_search_Click(object sender, EventArgs e)
    {
        BindData();
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        bool result = new B_Video_bnewsTypeDAL().DeleteList(hfIds.Value.Substring(0, hfIds.Value.Length - 1));
        if (result == true)
        {
            ScriptManager.RegisterClientScriptBlock(btnDel, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
        }
    }

    protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            LinkButton lbOut = (LinkButton)e.Item.FindControl("lbOut");
            LinkButton lbTime = (LinkButton)e.Item.FindControl("lbTime");
            if (isShow == "")
            {
                lbOut.Visible = false;
                lbTime.Visible = false;
            }
        }
    }
}