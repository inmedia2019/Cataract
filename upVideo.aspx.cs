using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Dm.Model.V20151123;
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class upVideo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string name = Request.Form["name"];
        string hospital = Request.Form["hospital"];
        string province = Request.Form["province"];
        string qiangsheng = Request.Form["qiangsheng"];
        string videotitle = Request.Form["videotitle"];
        string describe = Request.Form["describe"];
        string describetext = Request.Form["describetext"];
        string hfVideoId = Request.Form["hfVideoId"];
        string hfVideoUrl = Request.Form["hfVideoUrl"];
        string hfVideoBook = Request.Form["hfVideoBook"];
        string hfDemo = Request.Form["hfDemo"];
        string descript = Request.Form["descript"];
        string hfsqUrl = Request.Form["hfsqUrl"];
        string pptContent = Request.Form["pptContent"];
        string txtYear = Request.Form["txtYear"];
        string txtNum = Request.Form["txtNum"];
        Response.Write(GetMessage(name, hospital, province, qiangsheng, videotitle, describe, describetext, hfVideoId, hfVideoUrl, hfVideoBook, hfDemo, descript, hfsqUrl, pptContent, txtYear, txtNum));
        Response.End();
    }

    private string GetMessage(string name, string hospital, string province, string qiangsheng, string videotitle, string describe, string describetext, string hfVideoId, string hfVideoUrl, string hfVideoBook, string hfDemo, string descript, string hfsqUrl, string pptContent, string txtYear, string txtNum)
    {
        string sourceUrl = Request.UrlReferrer.ToString();
        if (sourceUrl.IndexOf("http://jjsv.atline.cn") < 0)
            return "-1";

        if (Session["passCode"] == null)
            return "-2";

        DataTable dt = new productInfoDAL().GetList(" moreCol1='" + Session["passCode"].ToString().Replace("'", "") + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            productInfo info = new productInfoDAL().GetModel(Utils.ToInt(dt.Rows[0]["Id"]));
            info.trueName = name;
            info.hospital = hospital;
            

            info.proviceName = province;

            DataTable dtArea = new ztypeInfoDAL().GetList(" CHARINDEX('" + province + "',description,0)>0 and state<>3").Tables[0];
            int areaId = 0;
            if (dtArea.Rows.Count > 0)
            {
                areaId = Utils.ToInt(dtArea.Rows[0]["Id"]);
            }
            info.areaId = areaId;

            info.saleName = qiangsheng;
            info.title = videotitle;
            info.majorType = Utils.ToInt(describe);
            info.videoId = hfVideoId;
            info.videoUrl = hfVideoUrl;
            info.fileUrl = "";
            try
            {
                info.fileUrl = Utils.ToString(hfVideoBook);
            }
            catch (global::System.Exception)
            {

                info.fileUrl = "";
            }
           
            info.demoUrl = hfDemo;
            info.descript = descript;
          
            info.createDate = DateTime.Now;
            info.moreCol = describetext;
            info.sqUrl = Utils.ToString(hfsqUrl);
            info.pptContent = Utils.ToString(pptContent);
            info.state = 0;
            bool result = new productInfoDAL().Update(info);
            if (result == true)
            {
                AllTableHelp.modifyField("memberInfo", "moreCol1", txtYear + "|" + txtNum, " and passCode='" + Session["passCode"].ToString().Replace("'", "") + "'");
                return "1";
            }
        }
        else
        {

            DataTable dtArea = new ztypeInfoDAL().GetList(" CHARINDEX('" + province + "',description,0)>0 and state<>3").Tables[0];
            int areaId = 0;
            if(dtArea.Rows.Count>0)
            {
                areaId = Utils.ToInt(dtArea.Rows[0]["Id"]);
            }

            productInfo info = new productInfo();
            info.mid = Utils.ToInt(Session["mid"]);
            info.trueName = name;
            info.hospital = hospital;
            info.proviceName = province;
            info.saleName = qiangsheng;
            info.title = videotitle;
            info.majorType = Utils.ToInt(describe);
            info.videoId = hfVideoId;
            info.videoUrl = hfVideoUrl;
            info.fileUrl = hfVideoBook;
            info.demoUrl = hfDemo;
            info.descript = descript;
            info.areaId = areaId;
            info.state = 0;
            info.createDate = DateTime.Now;
            info.moreCol = describetext;
            info.moreCol1 = Session["passCode"].ToString().Replace("'", "");
            info.sqUrl = hfsqUrl;
            info.pptContent = pptContent;
            bool result = new productInfoDAL().Add(info);
            if (result == true)
            {
                AllTableHelp.modifyField("memberInfo", "moreCol1", txtYear + "|" + txtNum, " and passCode='" + Session["passCode"].ToString().Replace("'", "") + "'");
                return "1";
            }
        }
        return "0";
    }
}