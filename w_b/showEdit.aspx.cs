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

public partial class w_b_showEdit : UserPage
{
    public string tuwen = "";
    public int id = DNTRequest.GetInt("id", 0);
    public int qid = DNTRequest.GetInt("qid", 0);
    public int lid = DNTRequest.GetInt("lid", 0);
    public string lang = "中文";
    public string src = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lid == 1)
            lang = "英文";
        if (!IsPostBack)
        {
            if (id > 0)
                BindData();
        }
    }

    private void BindData()
    {
        banswerInfo info = new banswerInfoDAL().GetModel(id);
      
      
        txtSn.Text = info.moreCol.ToString();
        
        if (info.moreCol1 != "")
            src = Config.webSiteUrl + info.moreCol1;
        picurl.Value = info.moreCol1;
        cbAppendTxt.Checked = info.descript == "1" ? true : false;
        cbCheck.Checked = info.state == 1 ? true : false;
        txtAnswer.Text = info.ainfo;
    }

    #region 对象赋值
    public banswerInfo SetObjectValue()
    {    
        banswerInfo ainfo = new banswerInfo();
        ainfo.ainfo = txtAnswer.Text.Trim();
        ainfo.createDate = DateTime.Now;
        ainfo.descript = cbAppendTxt.Checked == true ? "1" : "0";
        ainfo.Id = id;
        ainfo.moreCol = txtSn.Text.Trim();
        ainfo.moreCol1 = picurl.Value;
        ainfo.qid = qid;
        ainfo.Lid = lid;
        ainfo.state = cbCheck.Checked == true ? 1 : 0;
        
        return ainfo;
    }
    #endregion

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        banswerInfo info = SetObjectValue();
        int result = 0;
        if (info.Id > 0)
        {
            result = new banswerInfoDAL().Update(info) == true ? info.Id : 0;
        }
        else
            result = new banswerInfoDAL().Add(info);

        if (result > 0)
        {
            string ids = "";
            DataTable dtRightAnswer = new banswerInfoDAL().GetList(" state=1 and lid=" + lid.ToString() + " and qid=" + qid).Tables[0];
            for (int i = 0; i < dtRightAnswer.Rows.Count; i++)
            {
                ids += dtRightAnswer.Rows[i]["Id"].ToString() + ",";
            }
        
            if (lid == 0)
            {
                AllTableHelp.modifyField("B_Video_bquestions", "moreCol", ids, " and id=" + qid.ToString());
            }
            else if (lid == 1)
            {
                AllTableHelp.modifyField("B_Video_bquestions", "moreCol1", ids, " and id=" + qid.ToString());
            }
            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('操作成功!');location.href='showAnswerInfo.aspx?qid=" + qid + "&lid=" + lid + "';", true);
        }

    }
}