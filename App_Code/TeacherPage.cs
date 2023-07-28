using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Data;
/// <summary>
/// WebPage 的摘要说明
/// </summary>
public class TeacherPage : Page
{
    public TeacherPage()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
        ShowPage();
	}

    private string oid;

    public string Oid
    {
        get { return oid; }
        set { oid = value; }
    }

    private string _trueName;

    public string trueName
    {
        get { return _trueName; }
        set { _trueName = value; }
    }

    protected override void OnInit(EventArgs e)
    {
        string backUrl = Request.Url.ToString();

     
        //if (Session["b_signOid"] == null)
        //{
        //    Response.Redirect("~/authorization/returnUrl.aspx?returnUrl=" + Base64Code(backUrl));
        //    return;
        //}
        //Oid = Session["b_signOid"].ToString();

        //int count = new memberInfoDAL().GetRecordCount(" openId='" + Oid.Replace("'", "") + "'");
        //if (count == 0)
        //{
        //    memberInfo minfo = new memberInfo();
        //    minfo.createDate = DateTime.Now;
        //    minfo.descript = "";
        //    minfo.email = "";
        //    minfo.hospital = "";
        //    minfo.Id = 0;
        //    minfo.majorType = 0;
        //    minfo.moreCol = "";
        //    minfo.moreCol1 = "";
        //    minfo.openId = Oid;
        //    minfo.passCode = "";
        //    minfo.proviceName = "";
        //    minfo.saleName = "";
        //    minfo.state = 0;
        //    minfo.title = "";
        //    minfo.trueName = "";
        //    new memberInfoDAL().Add(minfo);
        //}

        if (Request.Cookies["phone"] != null)
        {
            Session["tName"] = Request.Cookies["phone"].Value;
        }

        if (Request.Cookies["areaId"] != null)
        {
            Session["areaId"] = Request.Cookies["areaId"].Value;
        }

        if (Session["tName"] == null && backUrl.IndexOf("teacher_login.aspx") < 0)
        {
            Response.Redirect("~/teacher_login.aspx");
            return;
        }

        if (Session["tName"] != null)
        {
           
            DataTable dtParent = new teacherAccoutDAL().GetList(" accoutInfo='" + Session["tName"].ToString() + "'").Tables[0];
           
            if (dtParent.Rows.Count > 0)
            {
                trueName = dtParent.Rows[0]["accoutPwd"].ToString();

                WriteData(HttpContext.Current.Server.MapPath("~/log.txt"), dtParent.Rows.Count.ToString());
            }
        }

        if (Request.Cookies["phone"] != null && backUrl.IndexOf("teacher_login.aspx") >= 0)
        {
             Response.Redirect("~/teacher_videoList.aspx");
             return;
        }
   
        base.OnInit(e);
    }

    #region 写记事本
    public static void WriteData(string filePath, string sb)
    {
        System.IO.StreamWriter myWrite = new System.IO.StreamWriter(filePath, false, System.Text.Encoding.Default);
        myWrite.WriteLine(sb);
        myWrite.Flush();
        myWrite.Close();
    }
    #endregion

    /// <summary>  
    /// Base64加密  
    /// </summary>  
    /// <param name="Message"></param>  
    /// <returns></returns>  
    public string Base64Code(string Message)
    {
        byte[] bytes = Encoding.Default.GetBytes(Message);
        return Convert.ToBase64String(bytes);
    }  

    /// <summary>
    /// 页面处理虚方法
    /// </summary>
    protected virtual void ShowPage()
    {
        return;
    }

}