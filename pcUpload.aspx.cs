using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class pcUpload : System.Web.UI.Page
{
    public string name = "";
    public string hospital = "";
    public string province = "";
    public string qiangsheng = "";
    public string videotitle = "";
    public string descriptInfo = "";
    public string describe = "";
    public string describetext = "";
    public int isShow = 0;
    public string videoId = "";
    public string videoUrl = "";
    public string bookInfo = "";
    public string demoInfo = "";
    public string sqUrl = "";
    public string pptContent = "";
    public string yearInfo = "";
    public string tNumInfo = "";
    public string backReson = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        if (Session["mid"] == null)
        {
            Response.Redirect("pc_login.aspx");
            return;
        }
        string passcode = Session["passCode"].ToString();
        DataTable dt = new productInfoDAL().GetList(" moreCol1='" + passcode + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            isShow = 1;
            name = dt.Rows[0]["trueName"].ToString();
            hospital = dt.Rows[0]["hospital"].ToString(); 
            province = dt.Rows[0]["proviceName"].ToString(); 
            qiangsheng = dt.Rows[0]["saleName"].ToString(); 
            videotitle = dt.Rows[0]["title"].ToString(); 
            descriptInfo = dt.Rows[0]["descript"].ToString(); 
            describe = dt.Rows[0]["majorType"].ToString(); 
            describetext = dt.Rows[0]["moreCol"].ToString();
            videoId = dt.Rows[0]["videoId"].ToString();
            videoUrl = dt.Rows[0]["videoUrl"].ToString();
            bookInfo = dt.Rows[0]["fileUrl"].ToString();
            demoInfo = dt.Rows[0]["demoUrl"].ToString();
            sqUrl = dt.Rows[0]["sqUrl"].ToString();
            pptContent = dt.Rows[0]["pptContent"].ToString();

            DataTable dts = new memberInfoDAL().GetList(" passCode='" + passcode + "'").Tables[0];
            if (dts.Rows.Count > 0)
            {
                if (dts.Rows[0]["moreCol1"].ToString().Length > 0)
                {
                    string[] temp = dts.Rows[0]["moreCol1"].ToString().Split('|');
                    yearInfo = temp[0];
                    tNumInfo = temp[1];
                }
            }

            if (dt.Rows[0]["state"].ToString() == "2")
            {
                DataTable dtReason = new productVerifyRecordDAL().GetList(" productId=" + dt.Rows[0]["Id"].ToString() + " order by id desc").Tables[0];
                if (dtReason.Rows.Count > 0)
                {
                    string[] temp = dtReason.Rows[0]["descript"].ToString().Split('|');
                    string returnStr = "";
                    for (int i = 0; i < temp.Length; i++)
                    {
                        if (temp[i].Length > 0)
                        {
                            returnStr += temp[i] + "、";
                        }
                    }

                    if (returnStr.Length > 0)
                        returnStr = returnStr.Substring(0, returnStr.Length - 1);
                    backReson = "抱歉，您的<span style='color:red;'>" + returnStr + "</span>未通过审核，请根据规范调整并重新提交。";

                }
            }

        }
        else
        {
            DataTable dts = new memberInfoDAL().GetList(" passCode='" + passcode + "'").Tables[0];

            name = dts.Rows[0]["trueName"].ToString();
            hospital = dts.Rows[0]["hospital"].ToString();
            province = dts.Rows[0]["proviceName"].ToString();
            qiangsheng = dts.Rows[0]["saleName"].ToString();
            videotitle = dts.Rows[0]["title"].ToString();
            descriptInfo = dts.Rows[0]["descript"].ToString();
            describe = dts.Rows[0]["majorType"].ToString();
            describetext = dts.Rows[0]["moreCol"].ToString();

            if (dts.Rows[0]["moreCol1"].ToString().Length > 0)
            {
                string[] temp = dts.Rows[0]["moreCol1"].ToString().Split('|');
                yearInfo = temp[0];
                tNumInfo = temp[1];
            }

        }
    }

   
}