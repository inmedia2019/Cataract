using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class w_b_modifyTypeSn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string id = Request.Form["objId"];
        string objNum = Request.Form["objNum"];
        Response.Write(GetMessage(id, objNum));
        Response.End();
    }

    private string GetMessage(string id, string objNum)
    {
        int result = AllTableHelp.modifyField("ztypeInfo", "morecol", objNum, " and id=" + id);
        if (result > 0)
            return "1";
        return "0";
    }
}