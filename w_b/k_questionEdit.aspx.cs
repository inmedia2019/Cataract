using General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class k_questionEdit : UserPage
{
    private int id = DNTRequest.GetInt("id", 0);
    public string src = "";
    public string answer = "";
    public int tid = DNTRequest.GetInt("tid", 0);
    public string enanswer = "";
    public string isshow = "";
    public string zh_title = "";
    public string en_title = "";
    public string src_en = "";
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
        bquestions info = new bquestionsDAL().GetModel(id);

        txtTitle.Text = info.title;
        txtEnTitle.Text = info.Entitle;

        ddlInfo.SelectedValue = info.cid.ToString();
        txtSn.Text = info.sn.ToString();
        if (info.picUrl != "")
            src = ".." + info.picUrl;
        picurl.Value = info.picUrl;
        if (info.descript != "")
            src_en = ".." +info.descript;
        picurl_en.Value = info.descript;
        hfmoreCol.Value = info.moreCol;
        hfMoreCol1.Value = info.moreCol1;
        //if (info.cid == 2)
        //    isshow = "style='display:none;'";

        //DataTable dt = new banswerInfoDAL().GetList(" qid=" + id.ToString()+" and lid=0").Tables[0];
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    answer += "<tr><td><input type='text' class='txt' t='" + dt.Rows[i]["Id"].ToString() + "' style='width:350px;' value=\"" + dt.Rows[i]["ainfo"].ToString().Replace("\"", "\\\"") + "\" /></td><td><a href='javascript:void(0);' onclick='delThis(this)'>[删除]</a></td><td><input class='ck' " + GetAnswer(info.moreCol, dt.Rows[i]["Id"].ToString()) + " type=\"checkbox\" /><span style='color:red;'>勾选即为正确答案</span></td></tr>";

        //}

        //DataTable dtEn = new banswerInfoDAL().GetList(" qid=" + id.ToString() + " and lid=1").Tables[0];
        //for (int i = 0; i < dtEn.Rows.Count; i++)
        //{
        //    enanswer += "<tr><td><input type='text' class='txt' t='" + dtEn.Rows[i]["Id"].ToString() + "' style='width:350px;' value=\"" + dtEn.Rows[i]["ainfo"].ToString().Replace("\"", "\\\"") + "\" /></td><td><a href='javascript:void(0);' onclick='delThis(this)'>[删除]</a></td><td><input class='ck' " + GetAnswer(info.moreCol1, dtEn.Rows[i]["Id"].ToString()) + " type=\"checkbox\" /><span style='color:red;'>勾选即为正确答案</span></td></tr>";
        //}
    }

  
    
   #region 对象赋值
    public bquestions SetObjectValue()
    {
        bquestions info = new bquestions();
        info.cid = Utils.ToInt(ddlInfo.SelectedValue);
        info.createDate = DateTime.Now;
        info.descript = picurl_en.Value;
        info.easyId = 0;
        info.Id = id;
        info.moreCol = hfmoreCol.Value;
        info.moreCol1 = hfMoreCol1.Value;
        info.picUrl = picurl.Value;
        info.sn = Utils.ToInt(txtSn.Text.Trim());
        info.state = 0;
        info.tid = tid;
        info.title = txtTitle.Text;
        info.Entitle = txtEnTitle.Text;
        return info;
    }
    #endregion

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bquestions info = SetObjectValue();
        int result = 0;
        //string[] temp = hfAnswer.Value.Split('□');
        //string[] entemp = hfEnAnswer.Value.Split('□');
        if (id > 0)
        {
            result = new bquestionsDAL().Update(info) == true ? info.Id : 0;
        }
        else
        {
            result = new bquestionsDAL().Add(info);
        }

        if (result > 0)
        {
            //    if (ddlInfo.SelectedValue != "2")
            //    {

            //        var rightAnswer = "";
            //        string ids = "";
            //        for (int i = 0; i < temp.Length; i++)
            //        {
            //            if (temp[i].Length > 0)
            //            {
            //                string[] child = temp[i].Split('●');

            //                if (child[0] == "0")
            //                {
            //                    banswerInfo ainfo = new banswerInfo();
            //                    ainfo.ainfo = child[1];
            //                    ainfo.createDate = DateTime.Now;
            //                    ainfo.descript = "";
            //                    ainfo.Id = 0;
            //                    ainfo.moreCol = "";
            //                    ainfo.moreCol1 = "";
            //                    ainfo.qid = result;
            //                    ainfo.Lid = 0;
            //                    ainfo.state = 0;
            //                    int addid = new banswerInfoDAL().Add(ainfo);
            //                    if (child[2] == "true")
            //                        rightAnswer += addid.ToString() + ",";
            //                    ids += addid.ToString() + ",";
            //                }
            //                else
            //                {
            //                    banswerInfo ainfo = new banswerInfoDAL().GetModel(Utils.ToInt(child[0]));
            //                    ainfo.ainfo = child[1];
            //                    ainfo.createDate = DateTime.Now;
            //                    new banswerInfoDAL().Update(ainfo);
            //                    if (child[2] == "true")
            //                        rightAnswer += ainfo.Id.ToString() + ",";
            //                    ids += ainfo.Id.ToString() + ",";
            //                }
            //            }
            //        }

            //        var enrightAnswer = "";
            //        for (int i = 0; i < entemp.Length; i++)
            //        {
            //            if (entemp[i].Length > 0)
            //            {
            //                string[] child = entemp[i].Split('●');

            //                if (child[0] == "0")
            //                {
            //                    banswerInfo ainfo = new banswerInfo();
            //                    ainfo.ainfo = child[1];
            //                    ainfo.createDate = DateTime.Now;
            //                    ainfo.descript = "";
            //                    ainfo.Id = 0;
            //                    ainfo.moreCol = "";
            //                    ainfo.moreCol1 = "";
            //                    ainfo.qid = result;
            //                    ainfo.Lid = 1;
            //                    ainfo.state = 0;
            //                    int addid = new banswerInfoDAL().Add(ainfo);
            //                    if (child[2] == "true")
            //                        enrightAnswer += addid.ToString() + ",";
            //                    ids += addid.ToString() + ",";
            //                }
            //                else
            //                {
            //                    banswerInfo ainfo = new banswerInfoDAL().GetModel(Utils.ToInt(child[0]));
            //                    ainfo.ainfo = child[1];
            //                    ainfo.createDate = DateTime.Now;
            //                    new banswerInfoDAL().Update(ainfo);
            //                    if (child[2] == "true")
            //                        enrightAnswer += ainfo.Id.ToString() + ",";
            //                    ids += ainfo.Id.ToString() + ",";
            //                }
            //            }
            //        }

            //        if (ids.Length > 0)
            //            ids = ids.Substring(0, ids.Length - 1);
            //        if (ids.Length > 0)
            //        {
            //            DbHelper.ExecuteSql("delete from banswerInfo where qid=" + result.ToString() + " and id not in(" + ids + ")");
            //        }

            //        AllTableHelp.modifyField("bquestions", "moreCol", rightAnswer, " and id=" + result.ToString());
            //        AllTableHelp.modifyField("bquestions", "moreCol1", enrightAnswer, " and id=" + result.ToString());
            //    }

            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('操作成功!');location.href='k_questionList.aspx?tid=" + tid + "';", true);
        }
    }
}