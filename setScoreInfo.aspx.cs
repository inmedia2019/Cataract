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
public partial class setScoreInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string infoId = Request.Form["infoId"];
        string in1 = Request.Form["in1"];
        string in2 = Request.Form["in2"];
        string in3 = Request.Form["in3"];
        string in4 = Request.Form["in4"];
        string in5 = Request.Form["in5"];
        string py = Request.Form["py"];
        Response.Write(GetMessage(infoId, in1, in2, in3, in4, in5, py));
        Response.End();
    }

    private string GetMessage(string infoId, string in1, string in2, string in3, string in4, string in5, string py)
    {    
        string sourceUrl = Request.UrlReferrer.ToString();
        if (sourceUrl.IndexOf("http://jjsv.atline.cn") < 0)
            return "-1";

        int counts1 = new userActionInfoDAL().GetRecordCount(" moreCol='" + Session["tName"].ToString() + "' and tid=2"); //当前专家已经评分了10个视频

        DataTable dt = new teacherAccoutDAL().GetList(" accoutInfo='" + Session["tName"].ToString() + "'").Tables[0];
        if (dt.Rows.Count == 0)
            return "2|" + counts1;

        DataTable dtCount = new userActionInfoDAL().GetList(" moreCol='" + Session["tName"].ToString() + "' and infoId=" + infoId + " and tid=2").Tables[0]; //当前专家已经评分当前视频
        if (dtCount.Rows.Count > 0)
        {
            userActionInfo uinfos = new userActionInfoDAL().GetModel(Utils.ToInt(dtCount.Rows[0]["Id"]));
            uinfos.createDate = DateTime.Now;
            uinfos.moreCol1 = in1 + "|" + in2 + "|" + in3 + "|" + in4 + "|" + in5;
            uinfos.descript = py;
            int results = new userActionInfoDAL().Update(uinfos) == true ? 1 : 0;
            if (results > 0)
            {
                return "4|" + counts1;
            }
        }

        int count = new userActionInfoDAL().GetRecordCount(" infoId=" + infoId + " and tid=2"); //当前视频已经被4个专家评分了
        if (count >= 4)
            return "3|" + counts1;

       
        if (counts1 >= 10)
            return "5|" + counts1;

        userActionInfo uinfo = new userActionInfo();
        uinfo.mid = Utils.ToInt(Session["areaId"]);
        uinfo.tid = 2;
        uinfo.infoId = Utils.ToInt(infoId);
        uinfo.createDate = DateTime.Now;
        uinfo.descript = py;
        uinfo.state = 0;
        uinfo.moreCol = Session["tName"].ToString();
        uinfo.moreCol1 = in1 + "|" + in2 + "|" + in3 + "|" + in4 + "|" + in5;
        int result = new userActionInfoDAL().Add(uinfo);

        counts1 = new userActionInfoDAL().GetRecordCount(" moreCol='" + Session["tName"].ToString() + "' and tid=2"); 
        if (result > 0)
        {
            int count2 = new userActionInfoDAL().GetRecordCount(" tid=2 and moreCol='" + Session["tName"].ToString() + "'"); //当前专家评分10个视频了
            if (count2 >= 10)
                return "6|" + counts1;
            return "1|" + counts1;
        }

        return "0|" + counts1;
    }
}