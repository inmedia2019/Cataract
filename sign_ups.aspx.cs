using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using General;
using System.Data;

public partial class sign_ups : WebPage
{
    public string name = "";
    public string hospital = "";
    public string province = "";
    public string txtYear = "";
    public string txtNum = "";
    public string saleName = "";
    public string mailbox = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {

        DataTable dt = new memberInfoDAL().GetList(" openId='" + Oid.Replace("'", "") + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            DataTable dts = new memberInfoDAL().GetList(" phone='" + dt.Rows[0]["phone"].ToString() + "' and passCode<>''").Tables[0];
            if(dts.Rows.Count>0){
            name = dts.Rows[0]["trueName"].ToString();
            hospital = dts.Rows[0]["hospital"].ToString();
            province = dts.Rows[0]["proviceName"].ToString();
            try
            {
                txtYear = dts.Rows[0]["moreCol1"].ToString().Split('|')[0];
            }
            catch
            {


            }
            try
            {
                txtNum = dts.Rows[0]["moreCol1"].ToString().Split('|')[1];
            }
            catch
            {


            }

            saleName = dts.Rows[0]["saleName"].ToString();

            mailbox = dts.Rows[0]["email"].ToString();
           }

        }
    }
}