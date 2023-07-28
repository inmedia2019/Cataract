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

public partial class w_b_videoInfoEdit : UserPage
{
    public int tid = DNTRequest.GetInt("tid", 0);
    public int id = DNTRequest.GetInt("id", 0);
    public string src = "";
    public string fileUrl = "";
    public string isshow = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        B_Video_bnewsType pinfo = new B_Video_bnewsTypeDAL().GetModel(tid);
        if (pinfo.tid == 0)
        {
            isshow = "style='display:none'";
           
        }

        ddlQuestion.Items.Clear();
        DataTable dt = new meetingInfoDAL().GetList(" state<>3").Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem item = new ListItem();
            item.Text = dt.Rows[i]["mName"].ToString();
            item.Value = dt.Rows[i]["Id"].ToString();
            ddlQuestion.Items.Add(item);
        }

        if (id > 0)
        {
            B_Video_bnewsType info = new B_Video_bnewsTypeDAL().GetModel(id);
            txtTitle.Text = info.title;
            if (info.picUrl != "")
                src = Config.ImgSource + info.picUrl;
            picurl.Value = info.picUrl;
            if (info.videoUrl != "")
                fileUrl = Config.webSiteUrl + "/" + info.videoUrl;
            hfVideoName.Value = info.videoUrl;
            txtSn.Text = info.sn.ToString();
            ddlQuestion.SelectedValue = info.moreCol;
            txtNo.Text = info.moreCol1;
            txtNum.Text = info.tnum.ToString();
        }
    }

    #region 对象赋值
    public B_Video_bnewsType SetObjectValue()
    {
        B_Video_bnewsType info = new B_Video_bnewsType();
        info.createDate = DateTime.Now;
        info.descript = "";
        info.Id = id;
        info.moreCol = ddlQuestion.SelectedValue;
        info.moreCol1 = txtNo.Text.Trim();
        info.picUrl = picurl.Value;
        info.pid = tid;
        info.sn = Utils.ToInt(txtSn.Text.Trim());
        info.state = 0;
        info.title = txtTitle.Text.Trim();
        info.videoUrl = hfVideoName.Value;
        info.tid = 1;
        info.tnum = Utils.ToInt(txtNum.Text.Trim());
        info.moreCol2 = "";
        info.moreCol3 = "";
        return info;
    }
    #endregion

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        B_Video_bnewsType info = SetObjectValue();
        bool result = false;
        if (id > 0)
            result = new B_Video_bnewsTypeDAL().Update(info);
        else
            result = new B_Video_bnewsTypeDAL().Add(info) > 0 ? true : false;

        if (result == true)
        {
            ScriptManager.RegisterClientScriptBlock(btnSubmit, GetType(), "", "alert('操作成功!');location.href='videoInfoList.aspx?tid=" + tid + "';", true);
        }


    }
}