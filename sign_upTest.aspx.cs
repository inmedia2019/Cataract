using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using General;
using System.Data;

public partial class sign_upTest : WebPage
{
    public string name = "";
    public string hospital = "";
    public string province = "";
    public string txtYear = "";
    public string txtNum = "";
    public string saleName = "";
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
        if (dt.Rows.Count == 1)
        {
            name = dt.Rows[0]["trueName"].ToString();
            hospital = dt.Rows[0]["hospital"].ToString();
            province = dt.Rows[0]["proviceName"].ToString();
            try
            {
                txtYear = dt.Rows[0]["moreCol1"].ToString().Split('|')[0];
            }
            catch 
            {
                
               
            }
            try
            {
                txtNum = dt.Rows[0]["moreCol1"].ToString().Split('|')[1];
            }
            catch
            {


            }

            saleName = dt.Rows[0]["saleName"].ToString();

        }
    }

}