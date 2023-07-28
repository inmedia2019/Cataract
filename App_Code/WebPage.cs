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
public class WebPage : Page
{
	public WebPage()
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

    protected override void OnInit(EventArgs e)
    {
        try
        {
            string backUrl = Request.Url.ToString();
            //Session["b_signOid"] = "ocvuXjjBz6yIPANZORIr7bQTcis4";
            if (Session["b_signOid"] == null)
            {
                Response.Redirect("~/authorization/returnUrl.aspx?returnUrl=" + Base64Code(backUrl));
                return;
            }

            if (Request.Cookies["userPhone"] != null)
            {
                Session["isHavePhone"] = 1;
            }

            if (backUrl.IndexOf("sign_up.aspx") < 0)
            {
                if (Session["isHavePhone"] == null)
                {
                    Response.Redirect("~/sign_up.aspx");
                    return;
                }
            }

            Oid = Session["b_signOid"].ToString();

            int count = new memberInfoDAL().GetRecordCount(" openId='" + Oid.Replace("'", "") + "'");
            if (count == 0)
            {
                memberInfo minfo = new memberInfo();
                minfo.createDate = DateTime.Now;
                minfo.descript = "";
                minfo.email = "";
                minfo.hospital = "";
                minfo.Id = 0;
                minfo.majorType = 0;
                minfo.moreCol = "";
                minfo.moreCol1 = "";
                minfo.openId = Oid;
                minfo.passCode = "";
                minfo.proviceName = "";
                minfo.saleName = "";
                minfo.state = 0;
                minfo.title = "";
                minfo.trueName = "";
                minfo.phone = "";
                new memberInfoDAL().Add(minfo);
            }

            WriteData(HttpContext.Current.Server.MapPath("~/log.txt"), Session["isHavePhone"].ToString());
            if (Session["isHavePhone"] != null && backUrl.IndexOf("sign_up.aspx") >= 0)
            {
                Response.Redirect("~/entrance.aspx");
                return;
            }
        }
        catch (Exception ex)
        {
            WriteData(HttpContext.Current.Server.MapPath("~/log.txt"), ex.Message.ToString());
           // Response.Write(ex.Message);
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

    public int GetUserId()
    {
        memberInfo minfo = new memberInfoDAL().GetModel(Oid);
        return minfo.Id;
    }

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