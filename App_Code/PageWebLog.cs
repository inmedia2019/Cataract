using System;
using System.Configuration;
using System.Web;

/// <summary>
/// PageWebLog 的摘要说明
/// </summary>
public class PageWebLog
{
    public PageWebLog()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>页面操作成功提示信息
    /// 页面操作成功提示信息
    /// </summary>
    /// <param name="Msg"></param>
    /// <param name="Url"></param>
    public static void PageRight(string Msg, string Url)
    {
        PageRender(Msg, Url, true);
    }

    public static void PageRightEx(string Msg, string backUrl, string Url)
    {
        PageRenderEx(Msg, backUrl, Url, true);
    }

    /// <summary>页面操作失败提示信息
    /// 页面操作失败提示信息
    /// </summary>
    /// <param name="Msg"></param>
    /// <param name="Url"></param>
    public static void PageError(string Msg, string Url)
    {
        PageRender(Msg, Url, false);
    }

    public static void PageErrorEx(string Msg, string backUrl, string Url)
    {
        PageRenderEx(Msg,backUrl, Url, false);
    }

    private static void PageRender(string Msg,string Url, bool Succeed)
    {
        string STitle = "操作成功信息";
        string _tmp = "<img src=\"../PageRightError/success.gif\" border=\"0\">";
        string SCaption = "√恭喜！操作成功";
        if (!Succeed)
        {
            STitle = "操作失败信息";
            _tmp = "<img src=\"../PageRightError/error.gif\" border=\"0\">";
            SCaption = "<font color=\"red\">×抱歉！操作失败</font>";
        }
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write("<html xmlns='http://www.w3.org/1999/xhtml' >\r<head>\r");
        HttpContext.Current.Response.Write("<title>" + STitle + "</title>\r");
        HttpContext.Current.Response.Write("<link href=\"../PageRightError/css.css\" rel=\"stylesheet\" type=\"text/css\" />\r");
        HttpContext.Current.Response.Write("\r</head><body>\r");
        HttpContext.Current.Response.Write("<table width='60%' border='0' align=\"center\" cellspacing=\"1\" cellpadding=\"5\" class=\"table\"  style=\"height:150px;margin-top:80px\"><tr class=\"hback\"><td class=\"hback\" style=\"height:38px;\" colspan=\"2\">" + SCaption + "</td>\r");
        HttpContext.Current.Response.Write("</tr><tr class=\"hback\"><td align=\"center\" style=\"40%\">" + _tmp + "<br /><br /></td><td class=\"list_link\" ><font color=red>操作描述：</font>\r");
        HttpContext.Current.Response.Write("<ul>");
        HttpContext.Current.Response.Write("<li><span>" + Msg + "</span></li><li><a href='javascript:history.back();' class='list_link'><b>返回继续操作</b></a>&nbsp;&nbsp;&nbsp;&nbsp;" + UserUrl(Url) + "</li></ul>\r");
        HttpContext.Current.Response.Write("    </td></tr>\r</table>\r");
        HttpContext.Current.Response.Write("</body>\r</html>\r");
        HttpContext.Current.Response.End();
    }

    private static void PageRenderEx(string Msg, string backUrl, string Url, bool Succeed)
    {
        string STitle = "操作成功信息";
        string _tmp = "<img src=\"../PageRightError/success.gif\" border=\"0\">";
        string SCaption = "√恭喜！操作成功";
        if (!Succeed)
        {
            STitle = "操作失败信息";
            _tmp = "<img src=\"../PageRightError/error.gif\" border=\"0\">";
            SCaption = "<font color=\"red\">×抱歉！操作失败</font>";
        }
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write("<html xmlns='http://www.w3.org/1999/xhtml' >\r<head>\r");
        HttpContext.Current.Response.Write("<title>" + STitle + "</title>\r");
        HttpContext.Current.Response.Write("<link href=\"../PageRightError/css.css\" rel=\"stylesheet\" type=\"text/css\" />\r");
        HttpContext.Current.Response.Write("\r</head><body>\r");
        HttpContext.Current.Response.Write("<table width='60%' border='0' align=\"center\" cellspacing=\"1\" cellpadding=\"5\" class=\"table\"  style=\"height:150px;margin-top:80px\"><tr class=\"hback\"><td class=\"hback\" style=\"height:38px;\" colspan=\"2\">" + SCaption + "</td>\r");
        HttpContext.Current.Response.Write("</tr><tr class=\"hback\"><td align=\"center\" style=\"40%\">" + _tmp + "<br /><br /></td><td class=\"list_link\" ><font color=red>操作描述：</font>\r");
        HttpContext.Current.Response.Write("<ul>");
        if (backUrl != "")
        {
            HttpContext.Current.Response.Write("<li><span>" + Msg + "</span></li><li><a href='" + backUrl + "' class='list_link'><b>返回继续操作</b></a>&nbsp;&nbsp;&nbsp;&nbsp;" + UserUrl(Url) + "</li></ul>\r");
        }
        else
        {
            HttpContext.Current.Response.Write("<li><span>" + Msg + "</span></li><li><a href='javascript:history.back();' class='list_link'><b>返回继续操作</b></a>&nbsp;&nbsp;&nbsp;&nbsp;" + UserUrl(Url) + "</li></ul>\r");
        }
        HttpContext.Current.Response.Write("    </td></tr>\r</table>\r");
        HttpContext.Current.Response.Write("</body>\r</html>\r");
        HttpContext.Current.Response.End();
    }

    private static string UserUrl(string StrUrl)
    {
        if (StrUrl == "0" || StrUrl == "")
        {
            StrUrl = "<a href='/' target='_blank'><b>返回首页</b></a>";
        }
        else
        {
            StrUrl = "<a href='" + StrUrl + "'><b>返回管理</b></a>";
        }
        return StrUrl;
    }
}
