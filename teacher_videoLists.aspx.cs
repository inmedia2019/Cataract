using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class teacher_videoLists : System.Web.UI.Page
{
    public int areaId = 0;
    public int yNum = 0;
    public string trueName ="";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["areaId"]="2";
       // Session["tName"]="15102105469";
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        teacherAccout info = new teacherAccoutDAL().GetModel(Utils.ToInt(Session["areaId"]));
        areaId = info.areaId;
        DataTable tb = new ztypeInfoDAL().GetList(" state<>3 order by  cast(morecol as int) desc, (  select count(1) from (select id,num=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2 ) from productInfo where areaId=ztypeInfo.Id ) as t where num<4) desc").Tables[0];
        rptData.DataSource = tb;
        rptData.DataBind();

        string sql = "select count(1) from userActionInfo where tid=2 and moreCol='" + Session["tName"].ToString() + "'";
        yNum = Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null));
    }

    public string GetUnScore(string unId)
    {
        string sql = "select count(1) from ( " +
                     " select id,pCount=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2) from [dbo].[productInfo] where areaId=" + unId +
                     ") as t where pCount<4";

        return Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null)).ToString();
    }

    public int GetStyles(string aId)
    {
        if (areaId.ToString() == aId)
        {
            string sql = "   select count(1) from (" +
  "select id,num=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2 ) from productInfo where areaId=" + aId +

  ") as t where num<4";
            return Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null));
        }
        return 1;
    }

}