using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using General;
using System.Data;
using Aspose.Cells;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;

public partial class meetEdit : UserPage
{
    public int id = DNTRequest.GetInt("id", 0);
    public string stateInfo = "";
    public string trueName = "";
    public string hospital = "";
    public string proviceName = "";
    public string saleName = "";
    public string title = "";
    public string majorType = "";
    public string videoId = "";
    public string videoUrl = "";
    public string fileUrl = "";
    public string demoUrl = "";
    public string descript = "";
    public string majorOther = "";
    public string sqUrl = "";
    public string tuwen = "";
    public string yearInfo = "";
    public string isShow = "style='display:none;'";
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
        productInfo info = new productInfoDAL().GetModel(id);
        if (info.state == 0)
            stateInfo = "待审核";
        else if (info.state == 1)
            stateInfo = "一审通过";
        else if (info.state == 4)
            stateInfo = "已通过审核";
        else
            stateInfo = "未通过审核";



        trueName = info.trueName;
        hospital = info.hospital;
        proviceName = info.proviceName;
        saleName = info.saleName;
        title = info.title;
        if (info.majorType == 1)
            majorType = "青光眼合并白内障";
        else if(info.majorType == 2)
            majorType = "糖尿病合并白内障";
        else if (info.majorType == 3)
            majorType = "高度近视白内障";
        else if (info.majorType == 4)
            majorType = "其他";
        majorOther = info.moreCol;
        videoId = info.videoId;
        videoUrl = info.videoUrl;

        fileUrl = "http://jjsv.atline.cn/iCataract_line/upload/" + info.fileUrl;
        demoUrl = "http://jjsv.atline.cn/iCataract_line/upload/" + info.demoUrl;
        sqUrl = "https://wx.linkmed.cn/iCataract_line/upload/" + info.sqUrl;
        descript = info.descript;
        hfContent.Value = info.pptContent;
        tuwen = info.pptContent;


        string sqlTemp = "select moreCol1 from memberInfo where passCode='" + info.moreCol1 + "'";
        string tempStr = Utils.ToString(DbHelper.ExecuteScalar(CommandType.Text, sqlTemp, null));

        if (tempStr.Length > 0)
        {
            txtSNum.Text = tempStr.Split('|')[0];
            txtLNum.Text = tempStr.Split('|')[1];
            //yearInfo = "超声乳化手术经验 " + tempStr.Split('|')[0] + "年<br />超声乳化年手术量 " + tempStr.Split('|')[1] + "例";
        }

        y_admin adminInfo = new y_adminDAL().GetModel(Utils.ToInt(Request.Cookies["YYadmin"]["Id"]));
        if (info.state == 1 && adminInfo.morecol1 == "")
        {
            isShow = "";
        }

        if (info.state == 2)
        {
            string sql = "select top 1 * from productVerifyRecord where productId=" + info.Id + " order by id desc";
            DataTable dtTemp = DbHelper.ExecuteDataTable(CommandType.Text, sql, null);
            if (dtTemp.Rows.Count > 0)
            {
                string[] temp = dtTemp.Rows[0]["descript"].ToString().Split('|');
                for (int i = 0; i < temp.Length; i++)
                {
                    if (temp[i].Trim().Length > 0)
                    {
                        for (int j = 0; j < cbList.Items.Count; j++)
                        {
                            if (cbList.Items[j].Value == temp[i])
                            {
                                cbList.Items[j].Selected = true;
                            }
                        }
                    }
                }
            }
        }
      

    }



    protected void btnPass_Click(object sender, EventArgs e)
    {
        productInfo info = new productInfoDAL().GetModel(id);
        y_admin adminInfo = new y_adminDAL().GetModel(Utils.ToInt(Request.Cookies["YYadmin"]["Id"]));
        if (adminInfo.morecol1 != "")
        {
            info.state = 4;
        }
        else
            info.state = 1;

        info.pptContent = hfContent.Value;
        bool result = false;

        result = new productInfoDAL().Update(info);

        if (result == true)
        {
            AllTableHelp.modifyField("memberInfo", "moreCol1", txtSNum.Text + "|" + txtLNum.Text, " and passCode='" + info.moreCol1 + "'");
            ScriptManager.RegisterClientScriptBlock(btnPass, GetType(), "", "alert('操作成功!');location.href='meetingList.aspx';", true);
        }

    }

    protected void btnSecondPass_Click(object sender, EventArgs e)
    {
        productInfo info = new productInfoDAL().GetModel(id);
        info.state = 4;

        info.pptContent = hfContent.Value;
        bool result = false;

        result = new productInfoDAL().Update(info);

        if (result == true)
        {
            AllTableHelp.modifyField("memberInfo", "moreCol1", txtSNum.Text + "|" + txtLNum.Text, " and passCode='" + info.moreCol1 + "'");
            ScriptManager.RegisterClientScriptBlock(btnPass, GetType(), "", "alert('操作成功!');location.href='meetingList.aspx';", true);
        }

    }

    protected void btnNotPass_Click(object sender, EventArgs e)
    {
        productInfo info = new productInfoDAL().GetModel(id);
        info.state = 2;
        info.pptContent = hfContent.Value;
        bool result = false;

        result = new productInfoDAL().Update(info);

        if (result == true)
        {
            AllTableHelp.modifyField("memberInfo", "moreCol1", txtSNum.Text + "|" + txtLNum.Text, " and passCode='" + info.moreCol1 + "'");
            productVerifyRecord productInfo = new productVerifyRecord();
            productInfo.Id = 0;
            productInfo.productId = info.Id;
            productInfo.descript = hfCb.Value;
            //for (int j = 0; j < cbList.Items.Count; j++)
            //{
            //    if (cbList.Items[j].Selected == true)
            //    {
            //        productInfo.descript += cbList.Items[j].Value + "|";
            //    }
            //}
            productInfo.State = 0;
            productInfo.createDate = DateTime.Now;
            productInfo.moreCol = "";
            productInfo.moreCol1 = "";
            new productVerifyRecordDAL().Add(productInfo);
          
            ScriptManager.RegisterClientScriptBlock(btnNotPass, GetType(), "", "alert('操作成功!');location.href='meetingList.aspx';", true);
        }

    }

    

}
