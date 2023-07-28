using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Helper 的摘要说明
/// </summary>
public class Helper:Page
{
    public Helper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static string GetMoney(int flag)
    {
        switch (flag)
        {
            case 0: return "1-1000元";
            case 1: return "1001-2000元";
            case 2: return "2001-5000元";
            case 3: return "5001-10000元";
            case 4: return "10000以上";
            default: return "N/A";
        }
    }
    public static int GetAction(string action)
    {
        switch (action)
        {
            case "profile": return 0;
            case "Culture": return 1;
            case "Organize": return 2;
            case "Principle": return 3;
            case "Contact": return 4;
            default: return -1;
        }
    }
    public static int GetNews(string action)
    {
        switch (action)
        {
            case "Co": return 1;
            case "Ye": return 2;
            case "Pr": return 3;
            default: return -1;
        }
    }
    ///   <summary>   
    ///    移除HTML标签   
    ///   </summary>   
    ///   <param    name="HTMLStr">HTMLStr</param>   
    public static string ParseTags(string HTMLStr)
    {
        HTMLStr = Regex.Replace(HTMLStr, "<[^>]*>", "");
        HTMLStr = Regex.Replace(HTMLStr, "&lt;br/&gt;", "");
        HTMLStr = Regex.Replace(HTMLStr, "\r\n", "");
        return HTMLStr;
    }   
}
