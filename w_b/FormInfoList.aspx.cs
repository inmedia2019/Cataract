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
public partial class FormInfoList : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            BindData();
        }
    }

    #region 绑定数据
    public void BindData()
    {
        int count = 0;
        string sqlWhere = "  and state<>3";

        if(keyword.Text.Trim().Length>0)
        {
            sqlWhere += " and (trueName like '%" + keyword.Text.Trim() + "%' or phone like '%" + keyword.Text.Trim() + "%')";
        }

        string tbName = "(select FormInfo.*,trueName=(select accoutPwd from teacherAccout where accoutInfo=FormInfo.phone),hospital=(select moreCol from teacherAccout where accoutInfo=FormInfo.phone) from FormInfo) as tb";
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
        string sqlWhere = "  where 1=1 and state<>3 ";

        if(keyword.Text.Trim().Length>0)
        {
            sqlWhere += " and (phone like '%" + keyword.Text.Trim() + "%' or trueName like '%" + keyword.Text.Trim() + "%')";
        }

        string tbName = "(select FormInfo.*,trueName=(select accoutPwd from teacherAccout where accoutInfo=FormInfo.phone),hospital=(select moreCol from teacherAccout where accoutInfo=FormInfo.phone) from FormInfo) as tb";

        DataTable tb = AllTableHelp.GetTableInfo(tbName, "*", sqlWhere);
        DaoChuShuJu(tb);
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
                                                            new DataColumn("评委",typeof(string)),
                                                            new DataColumn("手机",typeof(string)),
                                                            new DataColumn("医院",typeof(string)),
                                                            new DataColumn("第1题",typeof(string)),
                                                            new DataColumn("第2题",typeof(string)),
                                                            new DataColumn("第3题",typeof(string)),
                                                            new DataColumn("第4题",typeof(string)),
                                                            new DataColumn("第5题",typeof(string)),
                                                            new DataColumn("第6题",typeof(string)),
                                                            new DataColumn("提交时间",typeof(string)),
                                                           
                                                    });
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                table.Rows.Add(new DataColumn[]{
                                new DataColumn(dt.Rows[i]["trueName"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["phone"].ToString(),typeof(string)),
                                new DataColumn(dt.Rows[i]["hospital"].ToString(),typeof(string)),
                                new DataColumn(GetAnswer(dt.Rows[i]["descript"].ToString(),0),typeof(string)),
                                new DataColumn(GetAnswer(dt.Rows[i]["descript"].ToString(),1),typeof(string)),
                                new DataColumn(GetAnswer(dt.Rows[i]["descript"].ToString(),2),typeof(string)),
                                new DataColumn(GetAnswer(dt.Rows[i]["descript"].ToString(),3),typeof(string)),
                                new DataColumn(GetAnswer(dt.Rows[i]["descript"].ToString(),4),typeof(string)),
                                new DataColumn(GetAnswer(dt.Rows[i]["descript"].ToString(),5),typeof(string)),
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

    public string GetAnswer(string answer, int num)
    {
        try
        {
            return answer.Split('|')[num];
        }
        catch (Exception)
        {
            
          
        }
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
                bool result = AllTableHelp.modifyField("FormInfo", "state", "3", " and id=" + Utils.ToInt(e.CommandArgument)) > 0 ? true : false;
                if (result == true)
                {
                    ScriptManager.RegisterClientScriptBlock(rptData, GetType(), "", "alert('操作成功!');location.href='" + Request.Url + "';", true);
                }
            }

          
        }
    }
   
   


}
