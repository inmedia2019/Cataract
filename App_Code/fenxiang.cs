using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using General;
using System.Text;
using System.Web.Script.Serialization;

/// <summary>
///fenxiang 的摘要说明
/// </summary>
public class fenxiang
{
     public static string appid = "";
    public static string timestamp = "";
    public static string nonceStr = "";
    public static string signature = "";
    public string tooken = "";
    public string tiket = "";
    public static string surl = "";
    public static string getAccessTokenUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}";
    public  string city = DNTRequest.GetString("city");
    public  string country = DNTRequest.GetString("country");
    public  string nickname = DNTRequest.GetString("nickname");
    public string province = DNTRequest.GetString("province");
    public fenxiang()
    {
       
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    #region 后台数据
    public void fenxiang1(int p)
    {
        timestamp = UnixStamp().ToString();
        nonceStr = new RandomKey().GenerateRandom(16);
        string url = "";

        url = HttpContext.Current.Request.Url.ToString();

       

        weiNo.userInfo info = new weiNo.userInfoDAL().GetModel(63);


        //TimeSpan ts = DateTime.Now - info.createDate;
        //if (ts.TotalMinutes > 15)
        //{
        //    ModifyToken();
        //    info = new weiNo.userInfoDAL().GetModel(62);
        //}

        surl = url;
        string str1 = "";

       
        tooken = info.token;
        appid = info.appid;
        tiket = info.moreCol1;

        signature = GetSignature(tiket, nonceStr, timestamp, url, out str1);
      

       
    }
    #endregion

    #region 写记事本
    public static void WriteData(string filePath, string sb)
    {
        System.IO.StreamWriter myWrite = new System.IO.StreamWriter(filePath, false, System.Text.Encoding.Default);
        myWrite.WriteLine(sb);
        myWrite.Flush();
        myWrite.Close();
    }
    #endregion


    public static string ModifyToken()
    {
        weiNo.userInfo info = new weiNo.userInfoDAL().GetModel(63);
        string returnStr = "";
        string url = string.Format("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}", info.appid, info.appser);
        string jsonStr = HttpHelper.Get(url);
        WriteData(HttpContext.Current.Server.MapPath("~/log.txt"), jsonStr);
        var serializer = new JavaScriptSerializer();
        var obj = serializer.Deserialize<Dictionary<string, string>>(jsonStr);
        string accessToken;
        if (!obj.TryGetValue("access_token", out accessToken))
        {
           
            returnStr = "0";
        }
        var access_token = obj["access_token"];

        info.token = access_token.ToString();

        string ticketUrl = string.Format("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi", access_token.ToString());
        string ticket = HttpHelper.Get(ticketUrl);
        var serializer1 = new System.Web.Script.Serialization.JavaScriptSerializer();
        var userInfo = serializer1.Deserialize<System.Collections.Generic.Dictionary<string, object>>(ticket);

        info.moreCol1 = userInfo["ticket"].ToString();
        info.createDate = DateTime.Now;
        new weiNo.userInfoDAL().Update(info);
        returnStr = "1";
        return returnStr;
    }

    public UInt32 UnixStamp()
    {

        TimeSpan ts = DateTime.Now - TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));

        return Convert.ToUInt32(ts.TotalSeconds);

    }

    /// <summary>
    /// 签名算法       
    /// </summary>
    /// <param name="jsapi_ticket">jsapi_ticket</param>
    /// <param name="noncestr">随机字符串(必须与wx.config中的nonceStr相同)</param>
    /// <param name="timestamp">时间戳(必须与wx.config中的timestamp相同)</param>
    /// <param name="url">当前网页的URL，不包含#及其后面部分(必须是调用JS接口页面的完整URL)</param>
    /// <returns></returns>
    public string GetSignature(string jsapi_ticket, string noncestr, string timestamp, string url, out string string1)
    {
        var string1Builder = new StringBuilder();
        string1Builder.Append("jsapi_ticket=").Append(jsapi_ticket).Append("&")
                      .Append("noncestr=").Append(noncestr).Append("&")
                      .Append("timestamp=").Append(timestamp).Append("&")
                      .Append("url=").Append(url.IndexOf("#") >= 0 ? url.Substring(0, url.IndexOf("#")) : url);
        string1 = string1Builder.ToString();

        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(string1, "SHA1");
    }
}
