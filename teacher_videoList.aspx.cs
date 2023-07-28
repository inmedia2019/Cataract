using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class teacher_videoList : TeacherPage
{
    public string areaId = "";
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
      //  teacherAccout info = new teacherAccoutDAL().GetModel(Utils.ToInt(Session["areaId"]));

        DataTable dtTeacher = new teacherAccoutDAL().GetList(" accoutInfo='" + Session["tName"].ToString() + "'").Tables[0];
        for (int i = 0; i < dtTeacher.Rows.Count; i++)
        {
            areaId += dtTeacher.Rows[i]["areaId"].ToString() + ",";
        }

       

        DataTable tb = new ztypeInfoDAL().GetList(" state<>3 order by  cast(morecol as int) desc, (  select count(1) from (select id,num=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2 ) from productInfo where state=4 and areaId=ztypeInfo.Id ) as t where num<4) desc").Tables[0];
        rptData.DataSource = tb;
        rptData.DataBind();

        string sql = "select count(1) from userActionInfo where tid=2 and moreCol='" + Session["tName"].ToString() + "'";
        yNum = Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null));
    }

    public string GetUnScore(string unId)
    {
        string sql = "select count(1) from ( " +
                     " select id,pCount=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2) from [dbo].[productInfo] where state=4 and areaId=" + unId +
                     ") as t where pCount<4";

        return Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null)).ToString();
    }

    public int GetStyles(string aId)
    {
        if (areaId.IndexOf(aId + ",") >= 0)
        {
            string sql = "   select count(1) from (" +
  "select id,num=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2 ) from productInfo where state=4 and areaId=" + aId +

  ") as t where num<4";
            return Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null));
        }
        return 1;
    }

}