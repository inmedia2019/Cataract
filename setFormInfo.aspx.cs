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
public partial class setFormInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string answer = Request.Form["answer"];
        string infoId = Request.Form["infoId"];
        Response.Write(GetMessage(answer, infoId));
        Response.End();
    }

    private string GetMessage(string answer, string infoId)
    {
        
        string sourceUrl = Request.UrlReferrer.ToString();
        if (sourceUrl.IndexOf("http://jjsv.atline.cn") < 0)
            return "-1";

        int count = new FormInfoDAL().GetRecordCount(" phone=" + Session["tName"].ToString()+" and state<>3");
        if (count > 0)
            return "2";

        FormInfo uinfo = new FormInfo();
        uinfo.phone = Session["tName"].ToString();
     
        uinfo.createDate = DateTime.Now;
        uinfo.descript = answer;
        uinfo.state = 0;
        uinfo.moreCol = "";
        uinfo.moreCol1 = "";
        int result = new FormInfoDAL().Add(uinfo);
        if (result > 0)
        {
            int counts2 = new userActionInfoDAL().GetRecordCount(" moreCol='" + Session["tName"].ToString() + "' and tid=2 and infoId=" + infoId);
            if (counts2 > 0)
                return "3";
            return "1";
        }
        return "0";
    }
}