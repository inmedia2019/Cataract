using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using General;
using Aspose.Cells;
using System.IO;
public partial class meetingList : UserPage
{
    public string styleInfo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlInfo.Items.Clear();
            DataTable dt = new ztypeInfoDAL().GetList("").Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListItem item = new ListItem();
                item.Text = dt.Rows[i]["sname"].ToString();
                item.Value = dt.Rows[i]["Id"].ToString();
                ddlInfo.Items.Add(item);
            }
            BindData();
        }
    }

    #region 绑定数据
    public void BindData()
    {
        int count = 0;
        string sqlWhere = "  and state<>3";
        DataTable dtInfo = new y_adminDAL().GetList(" username='" + Request.Cookies["YYadmin"]["adminName"] + "' and pwd='" + Request.Cookies["YYadmin"]["S_pwd"] + "'").Tables[0];
        string desInfo = "";
        for (int i = 0; i < dtInfo.Rows.Count; i++)
        {
            if (dtInfo.Rows[i]["morecol1"].ToString() != "")
            {
                ztypeInfo zInfo = new ztypeInfoDAL().GetModel(Utils.ToInt(dtInfo.Rows[i]["morecol1"]));
                desInfo += zInfo.description + ",";
            }
        }
       // y_admin adminInfo = new y_adminDAL().GetModel(Utils.ToInt(Request.Cookies["YYadmin"]["Id"]));
        if (desInfo != "")
        {
           // ztypeInfo zInfo = new ztypeInfoDAL().GetModel(Utils.ToInt(adminInfo.morecol1));
            sqlWhere += " and CHARINDEX(proviceName,'" + desInfo + "',0)>0 and state in(1,4)";
            styleInfo = "display:none";
        }
      

        if(keyword.Text.Trim().Length>0)
        {
            sqlWhere += " and (title like '%" + keyword.Text.Trim() + "%' or trueName like '%" + keyword.Text.Trim() + "%')";
        }

        if (ddlState.SelectedValue != "-1")
            sqlWhere += " and state=" + ddlState.SelectedValue;

        string tbName = "(select productInfo.*,saleInfo=(select saleName from memberInfo where id=productInfo.mid) from productInfo) as tb";
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, MyPager.Pagesize, MyPager.Pageindex + 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
        MyPager.Count = count;

    }
    #endregion

    protected void MyPager_PageIndexChange(object sender, EventArgs e)
    {
        BindData();
    }


    protected void btnOut_Click(object sender, EventArgs e)
    {
        int count = 0;
        string sqlWhere = "  1=1 and state<>3 ";

        y_admin adminInfo = new y_adminDAL().GetModel(Utils.ToInt(Request.Cookies["YYadmin"]["Id"]));
        if (adminInfo.morecol1 != "")
        {
            ztypeInfo zInfo = new ztypeInfoDAL().GetModel(Utils.ToInt(adminInfo.morecol1));
            sqlWhere += " and CHARINDEX(proviceName,'" + zInfo.description + "',0)>0";
        }

        if(keyword.Text.Trim().Length>0)
        {
            sqlWhere += " and (title like '%" + keyword.Text.Trim() + "%' or trueName like '%" + keyword.Text.Trim() + "%')";
        }

        if (ddlState.SelectedValue != "-1")
            sqlWhere += " and state=" + ddlState.SelectedValue;



        DataTable tb = new productInfoDAL().GetList(sqlWhere + " order by createDate desc").Tables[0];
        DaoChuShuJu(tb);
    }

    protected void btnPOut_Click(object sender, EventArgs e)
    {
        string sqlWhere = "";
        string temp = "";

        y_admin adminInfo = new y_adminDAL().GetModel(Utils.ToInt(Request.Cookies["YYadmin"]["Id"]));
        if (adminInfo.morecol1 != "")
        {
            ztypeInfo zInfo = new ztypeInfoDAL().GetModel(Utils.ToInt(adminInfo.morecol1));
            temp += " and CHARINDEX(proviceName,'" + zInfo.description + "',0)>0";
        }

        if (keyword.Text.Trim().Length > 0)
        {
            temp += " and (title like '%" + keyword.Text.Trim() + "%' or trueName like '%" + keyword.Text.Trim() + "%')";
        }

        if (ddlState.SelectedValue != "-1")
            temp += " and state=" + ddlState.SelectedValue;

        string tbName = "(select *," +
                      "trueName=(select trueName from productInfo where Id=infoId), " +
                      "hospital=(select hospital from productInfo where Id=infoId)," +
                      "AreaId=(select areaId from productInfo where Id=infoId)," +
                      "videoId=(select videoId from productInfo where Id=infoId)," +
                      "title=(select title from productInfo where Id=infoId)," +
                      "zName=(select accoutPwd from teacherAccout where accoutInfo=[userActionInfo].moreCol)," +
                      "zYiYuan=(select moreCol from teacherAccout where accoutInfo=[userActionInfo].moreCol)," +
                      "yAreaId=(select areaId from teacherAccout where accoutInfo=[userActionInfo].moreCol)," +
                      "zPhone=(select accoutInfo from teacherAccout where accoutInfo=[userActionInfo].moreCol)," +
                      "JY=(select moreCol1 from productInfo where Id=infoId), " +
                      "majorType=(select majorType from productInfo where Id=infoId), " +
                      "otherInfo=(select moreCol from productInfo where Id=infoId), " +
                      "proviceName=(select proviceName from productInfo where Id=infoId)," +
                      "saleName=(select saleName from productInfo where Id=infoId)" +
                      "from [userActionInfo] where len(moreCol)>0 and infoId in(select Id FROM productInfo where state<>3 " + temp + ")) as tb";
        DataTable dt = AllTableHelp.GetTableInfo(tbName, "*", sqlWhere);
        DaoChuShuJus(dt);

    }

    #region 导出选中的数据
    private void DaoChuShuJus(DataTable dt)
    {

        try
        {

            string path = Server.MapPath("~/execl");
            // 检查License
            string licenseFile = Server.MapPath("~/bin\\License.lic");
            if (System.IO.File.Exists(licenseFile))
            {
                Aspose.Cells.License license = new Aspose.Cells.License();
                license.SetLicense(licenseFile);
            }
            else
                throw new Exception("License.lic文件不存在" + licenseFile);


            Workbook workbook = new Workbook();

            Worksheet worksheet = workbook.Worksheets[0];
            Cells cells = worksheet.Cells;
            DataTable table = new DataTable("Report");
            table.Columns.AddRange(new DataColumn[]{
                                                            new DataColumn("作品编号",typeof(string)),
                                                            new DataColumn("参赛医生",typeof(string)),
                                                            new DataColumn("医院",typeof(string)),
                                                            new DataColumn("省",typeof(string)),
                                                            new DataColumn("赛区",typeof(string)),
                                                            new DataColumn("销售",typeof(string)),
                                                            new DataColumn("视频ID",typeof(string)),
                                                            new DataColumn("视频标题",typeof(string)),
                                                            new DataColumn("手术类型",typeof(string)),
                                                            new DataColumn("超声乳化手术经验(年)",typeof(string)),
                                                            new DataColumn("超声乳化年手术量(例)",typeof(string)),
                                                            new DataColumn("评分专家",typeof(string)),
                                                            new DataColumn("专家医院",typeof(string)),
                                                            new DataColumn("评审区域",typeof(string)),
                                                            new DataColumn("专家手机号",typeof(string)),
                                                            new DataColumn("手术难度（30）",typeof(string)),
                                                            new DataColumn("诊疗思路及手术方式选择的合理性（20）",typeof(string)),
                                                            new DataColumn("手术操作的规范性（20）",typeof(string)),
                                                            new DataColumn("病例资料完整清晰（15）",typeof(string)),
                                                            new DataColumn("手术视频清晰度剪辑是否得当（15）",typeof(string)),
                                                            new DataColumn("总分",typeof(string)),
                                                            new DataColumn("评语",typeof(string)),
                                                            new DataColumn("评分时间",typeof(string)),
                                                            

                                                       });
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                table.Rows.Add(new DataColumn[]{
                                new DataColumn(GetCode(dt.Rows[i]["infoId"].ToString(),dt.Rows[i]["areaId"].ToString()),typeof(string)),
                                new DataColumn(dt.Rows[i]["trueName"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["hospital"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["proviceName"].ToString(),typeof(string)),
                                new DataColumn(GetSQ(dt.Rows[i]["areaId"].ToString()),typeof(string)),
                                new DataColumn(dt.Rows[i]["saleName"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["videoId"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["title"].ToString(),typeof(string)),
                                new DataColumn(GetMajorType(dt.Rows[i]["majorType"].ToString(),dt.Rows[i]["otherInfo"].ToString()),typeof(string)),
                                new DataColumn(GetJY(dt.Rows[i]["JY"].ToString(),0),typeof(string)),
                                new DataColumn(GetJY(dt.Rows[i]["JY"].ToString(),1),typeof(string)),
                                new DataColumn(dt.Rows[i]["zName"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["zYiYuan"].ToString(),typeof(string)),
                                new DataColumn(GetAreaInfo(dt.Rows[i]["yAreaId"].ToString()),typeof(string)),
                                new DataColumn(dt.Rows[i]["zPhone"].ToString(),typeof(string)),
                                new DataColumn(GetScoreInfo(dt.Rows[i]["moreCol1"].ToString(),0),typeof(string)),
                                new DataColumn(GetScoreInfo(dt.Rows[i]["moreCol1"].ToString(),1),typeof(string)),
                                new DataColumn(GetScoreInfo(dt.Rows[i]["moreCol1"].ToString(),2),typeof(string)),
                                new DataColumn(GetScoreInfo(dt.Rows[i]["moreCol1"].ToString(),3),typeof(string)),
                                new DataColumn(GetScoreInfo(dt.Rows[i]["moreCol1"].ToString(),4),typeof(string)),
                                new DataColumn(GetSumScore(dt.Rows[i]["moreCol1"].ToString()),typeof(string)),
                               
                                new DataColumn(dt.Rows[i]["descript"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["createDate"].ToString(),typeof(string)),
                              
                              });
            }


            cells.ImportDataTable(table, true, "A1");

            string temFile = "data" + DateTime.Now.ToBinary() + ".xls";

            workbook.Save(path + "/" + temFile);


            Response.ClearContent();
            Response.AddHeader("Content-Disposition", "attachment;filename=" + temFile);

            Response.ContentType = "application/excel";

            Response.WriteFile(path + "/" + temFile);

            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
        catch (Exception ex)
        {
            Page.RegisterClientScriptBlock("msc", "<script>alert('" + ex.Message + "')</script>");

        }



    }
    #endregion

    public string GetAreaInfo(string yId)
    {
        try
        {
            return new ztypeInfoDAL().GetModel(Utils.ToInt(yId)).sname;
        }
        catch (Exception)
        {
            
        }
        return "";
    }

    public string GetScoreInfo(string scoreInfo,int num)
    {
        string[] temp = scoreInfo.Split('|');

        try
        {
            return temp[num];
        }
        catch (Exception)
        {
            
           
        }
        return "";
    }

    public string GetSumScore(string scoreInfo)
    {
        string[] temp = scoreInfo.Split('|');
        int returnStr = 0;
        for (int i = 0; i < temp.Length; i++)
        {
            if (temp[i].Trim().Length > 0)
                returnStr += Utils.ToInt(temp[i]);
        }
        return returnStr.ToString();
    }


    public string GetSQ(string areaId)
    {
        try
        {
            return new ztypeInfoDAL().GetModel(Utils.ToInt(areaId)).sname;
        }
        catch (Exception)
        {
            
            
        }
        return "";
    }

    #region 导出选中的数据
    private void DaoChuShuJu(DataTable dt)
    {

        try
        {

            string path = Server.MapPath("~/execl");
            // 检查License
            string licenseFile = Server.MapPath("~/bin\\License.lic");
            if (System.IO.File.Exists(licenseFile))
            {
                Aspose.Cells.License license = new Aspose.Cells.License();
                license.SetLicense(licenseFile);
            }
            else
                throw new Exception("License.lic文件不存在" + licenseFile);


            Workbook workbook = new Workbook();

            Worksheet worksheet = workbook.Worksheets[0];
            Cells cells = worksheet.Cells;
            DataTable table = new DataTable("Report");
            table.Columns.AddRange(new DataColumn[]{
                                                            new DataColumn("作品编号",typeof(string)),
                                                            new DataColumn("参赛医生",typeof(string)),
                                                            new DataColumn("医院",typeof(string)),
                                                            new DataColumn("省",typeof(string)),
                                                           new DataColumn("赛区",typeof(string)),
                                                          
                                                            new DataColumn("负责销售",typeof(string)),
                                                           new DataColumn("视频ID",typeof(string)),
                                                            new DataColumn("视频标题",typeof(string)),
                                                            new DataColumn("手术类型",typeof(string)),
                                                            new DataColumn("手术描述",typeof(string)),
                                                           
                                                          
                                                            new DataColumn("超声乳化手术经验(年)",typeof(string)),
                                                            new DataColumn("超声乳化年手术量(例)",typeof(string)),
                                                           // new DataColumn("创建时间",typeof(string)),
                                                           new DataColumn("状态",typeof(string)),
                                                           
                                                            });
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                table.Rows.Add(new DataColumn[]{
                                new DataColumn(GetCode(dt.Rows[i]["Id"].ToString(),dt.Rows[i]["areaId"].ToString()),typeof(string)),
                                new DataColumn(dt.Rows[i]["trueName"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["hospital"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["proviceName"].ToString(),typeof(string)),
                               new DataColumn(GetSQ(dt.Rows[i]["areaId"].ToString()),typeof(string)),
                                new DataColumn(dt.Rows[i]["saleName"].ToString(),typeof(string)),
                                 new DataColumn(dt.Rows[i]["videoId"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["title"].ToString(),typeof(string)),
                                new DataColumn(GetMajorType(dt.Rows[i]["majorType"].ToString(),dt.Rows[i]["moreCol"].ToString()),typeof(string)),
                                new DataColumn(dt.Rows[i]["descript"].ToString(),typeof(string)),
                               
                               
                                new DataColumn(GetJY(dt.Rows[i]["moreCol1"].ToString(),0),typeof(string)),
                                new DataColumn(GetJY(dt.Rows[i]["moreCol1"].ToString(),1),typeof(string)),
                                  new DataColumn(GetState(dt.Rows[i]["state"].ToString()),typeof(string)),
                              }); 
            }


            cells.ImportDataTable(table, true, "A1");

            string temFile = "data" + DateTime.Now.ToBinary() + ".xls";

            workbook.Save(path + "/" + temFile);


            Response.ClearContent();
            Response.AddHeader("Content-Disposition", "attachment;filename=" + temFile);

            Response.ContentType = "application/excel";

            Response.WriteFile(path + "/" + temFile);

            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
        catch (Exception ex)
        {
            Page.RegisterClientScriptBlock("msc", "<script>alert('" + ex.Message + "')</script>");

        }



    }
    #endregion

    public string GetCode(string productId,string areaId)
    {
        string codeInfo = "";
        try
        {
            codeInfo = new ztypeInfoDAL().GetModel(Utils.ToInt(areaId)).descript;
        }
        catch (Exception)
        {
            
           
        }
        
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

    public string GetJY(string passCode,int num)
    {
        try
        {
            DataTable dt = new memberInfoDAL().GetList(" passCode='" + passCode + "'").Tables[0];
            string[] temp = dt.Rows[0]["moreCol1"].ToString().Split('|');
            return temp[num];
        }
        catch (Exception)
        {
            
           
        }
        return "";
    }

    public string GetMajorType(string major, string m)
    {
         
        if (major == "1")
            return "青光眼合并白内障";
        else if (major == "2")
            return "糖尿病合并白内障";
        else if (major == "3")
            return "高度近视白内障";
        else if (major == "4")
            return "小瞳孔白内障";
        else if (major == "5")
            return "伴有晶状体位置异常的白内障";
        else if (major == "6")
            return "外伤性白内障";
        else if (major == "7")
            return "儿童白内障";
        else if (major == "8")
            return "其他("+m+")";
        return "";
    }

    public string GetState(string state)
    {
        if (state == "0")
            return "待审核";
        else if (state == "1")
            return "一审通过";
        else if (state == "2")
            return "未通过审核";
        else if (state == "4")
            return "二审通过";
        return "";
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "del")
            {
                bool result = AllTableHelp.modifyField("productInfo", "state", "3", " and id=" + Utils.ToInt(e.CommandArgument)) > 0 ? true : false;
                if (result == true)
                {
                    ScriptManager.RegisterClientScriptBlock(rptData, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
                }
            }

          
        }
    }
   
   


}
