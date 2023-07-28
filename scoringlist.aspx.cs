using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using General;
public partial class scoringlist : TeacherPage
{
    public string areaInfo = "";
    public int tid = DNTRequest.GetInt("tid", 0);
    public int yNum = 0;
    public string tishi = "暂无";
    public string areaIds = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        //teacherAccout infos = new teacherAccoutDAL().GetModel(Utils.ToInt(Session["areaId"]));
       // areaIds = infos.areaId;

        DataTable dtTeacher = new teacherAccoutDAL().GetList(" accoutInfo='" + Session["tName"].ToString() + "'").Tables[0];
        for (int i = 0; i < dtTeacher.Rows.Count; i++)
        {
            areaIds += dtTeacher.Rows[i]["areaId"].ToString() + ",";
        }

        string sql = "select count(1) from userActionInfo where tid=2 and moreCol='" + Session["tName"].ToString() + "'";
        yNum = Utils.ToInt(DbHelper.ExecuteScalar(CommandType.Text, sql, null));

        int areaId = tid;
        ztypeInfo info = new ztypeInfoDAL().GetModel(areaId);
        areaInfo = info.sname;

        string tbName = "(select productInfo.*,IsPingCount=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2),IsPing=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=2 and moreCol='"+Session["tname"].ToString()+"')," +
                        "code=(select cast(descript as varchar) from ztypeInfo where areaId=ztypeInfo.Id) from productInfo) as tb";
        string sqlWhere=" and state=4";
        if (areaId > 0)
        {
            sqlWhere += " and areaId=" + areaId;
           // sqlWhere += " and CHARINDEX(proviceName,'" + info.description + "',0)>0";
        }



        DataTable dt = AllTableHelp.GetTableInfo(tbName, "*", " where 1=1" + sqlWhere + " order by IsPingCount asc,IsPing asc,id asc");
        rptData.DataSource = dt;
        rptData.DataBind();

        if (dt.Rows.Count > 0)
        {
            tishi = "";
        }

      
    }

    public string GetFontInfo(int c, int isp)
    {
        if (c >= 4)
        {
            return "已评满";
        }
        else if (isp > 0)
        {
            return "已评分";
        }
        else
        {
            if (yNum >= 10)
                return "查看作品";
            else
            {
                if (areaIds.IndexOf(tid.ToString() + ",") < 0)
                    return "查看作品";
                return "邀您评分";
            }
        }

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