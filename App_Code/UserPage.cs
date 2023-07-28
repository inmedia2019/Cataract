using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
///UserPage 的摘要说明
/// </summary>
public class UserPage:Page
{
    public UserPage()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
        ShowPage();
    }

    protected override void OnInit(EventArgs e)
    {
        //if (HttpContext.Current.Session["cwid"] == null || HttpContext.Current.Request.UrlReferrer == null)
        //{
        //    Response.Redirect(ResolveUrl("~/w_b/") + "error.aspx");
        //}
        try
        {
            string logName = Request.Cookies["YYadmin"]["adminName"].ToString();
            string pwd = Request.Cookies["YYadmin"]["S_pwd"].ToString();
            y_admin admin = new y_adminDAL().GetUserInfo(logName, pwd);
            if (admin.userid <= 0)
            {

                Response.Redirect(ResolveUrl("~/w_b/") + "w_b_l.aspx");
            }
        }
        catch
        {

            Response.Redirect(ResolveUrl("~/w_b/") + "w_b_l.aspx");
        }

        base.OnInit(e);
    }


    /// <summary>
    /// 获取UserID
    /// </summary>
    public string GetUserAction()
    {
        string action = "";
        try
        {
            string logName = Request.Cookies["YYadmin"]["adminName"].ToString();
            string pwd = Request.Cookies["YYadmin"]["S_pwd"].ToString();
            y_admin admin = new y_adminDAL().GetUserInfo(logName, pwd);
            action = admin.morecol;
        }
        catch (Exception)
        {
            Response.Redirect(ResolveUrl("~/w_b/") + "w_b_l.aspx");
        }
        return action;
    }

    /// <summary>
    /// 获取UserID
    /// </summary>
    public int GetUserId()
    {
        int userId = 0;
        try
        {
            string logName = Request.Cookies["YYadmin"]["adminName"].ToString();
            string pwd = Request.Cookies["YYadmin"]["S_pwd"].ToString();
            y_admin admin = new y_adminDAL().GetUserInfo(logName, pwd);
            userId = admin.userid;
        }
        catch (Exception)
        {
            Response.Redirect(ResolveUrl("~/w_b/") + "w_b_l.aspx");
        }
        return userId;
    }
    /// <summary>
    /// 页面处理虚方法
    /// </summary>
    protected virtual void ShowPage()
    {
        return;
    }
}
