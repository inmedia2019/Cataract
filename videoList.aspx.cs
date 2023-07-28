using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class videoList : WebPages
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DataTable tb = new ztypeInfoDAL().GetList(" state<>3 order by cast(moreCol as int) desc").Tables[0];
        rptData.DataSource = tb;
        rptData.DataBind();
    }

}