using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using General;
public partial class userScoringlist : TeacherPage
{

    public int yNum = 0;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
      

        string tbName = "(select productInfo.*,IsPingCount=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2),IsPing=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2 and moreCol='"+Session["tname"].ToString()+"')," +
                        "code=(select cast(descript as varchar) from ztypeInfo where areaId=ztypeInfo.Id) from productInfo) as tb";
        string sqlWhere = " and state=4 and IsPing>0";
      
        DataTable dt = AllTableHelp.GetTableInfo(tbName, "*", " where 1=1" + sqlWhere);
        rptData.DataSource = dt;
        rptData.DataBind();

        string sql = "select count(1) from userActionInfo where tid=2 and moreCol='" + Session["tName"].ToString() + "'";
        yNum = Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null));
    }

    public string GetFontInfo(int c, int isp)
    {
        if (c >= 5)
        {
            return "修改评分";
        }
        else if (isp > 0)
        {
            return "修改评分";
        }
        return "邀您评分";
    }

    public string GetCode(string productId, string codeInfo)
    {
        if (productId.Length == 1)
        {
            return codeInfo + "000" + productId;
        }
        else if (productId.Length == 2)
        {
            return codeInfo + "00" + productId;
        }
        else if (productId.Length == 3)
        {
            return codeInfo + "0" + productId;
        }
        else if (productId.Length == 4)
        {
            return codeInfo + productId;
        }
        return "";
    }
}