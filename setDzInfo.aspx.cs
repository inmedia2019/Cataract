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
public partial class setDzInfo : WebPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string infoId = Request.Form["infoId"];
        Response.Write(GetMessage(infoId));
        Response.End();
    }

    private string GetMessage(string infoId)
    {
        
        string sourceUrl = Request.UrlReferrer.ToString();
        if (sourceUrl.IndexOf("https://wx.linkmed.cn") < 0)
            return "-1";

        DataTable dt = new memberInfoDAL().GetList(" openId='" + Oid + "'").Tables[0];
        if (dt.Rows.Count == 0)
            return "2";

        int count = new userActionInfoDAL().GetRecordCount(" infoId=" + infoId + " and mid=" + dt.Rows[0]["Id"].ToString()+" and tid=1");
        if (count > 0)
            return "3";

        userActionInfo uinfo = new userActionInfo();
        uinfo.mid = Utils.ToInt(dt.Rows[0]["Id"]);
        uinfo.tid = 1;
        uinfo.infoId = Utils.ToInt(infoId);
        uinfo.createDate = DateTime.Now;
        uinfo.descript = "";
        uinfo.state = 0;
        uinfo.moreCol = "";
        uinfo.moreCol1 = "";
        int result = new userActionInfoDAL().Add(uinfo);
        if (result > 0)
        {
            return "1";
        }
        return "0";
    }
}