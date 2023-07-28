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
public class WebPages : Page
{
	public WebPages()
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
        string backUrl = Request.Url.ToString();

       
        if (Session["b_signOid"] == null)
        {
            Response.Redirect("~/authorization/returnUrl.aspx?returnUrl=" + Base64Code(backUrl));
            return;
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
            new memberInfoDAL().Add(minfo);
        }

      
   
        base.OnInit(e);
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