
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class setGroupInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string ginfo = Request.Form["ginfo"];
        string memberId = Request.Form["memberId"];
        Response.Write(GetMessage(ginfo, memberId));
        Response.End();
    }

    private string GetMessage(string ginfo, string memberId)
    {
        int result = AllTableHelp.modifyField("productInfo", "areaId", ginfo, " and id in(" + memberId + ")");
        if (result > 0)
            return "1";
        return "0";
    }
    
}