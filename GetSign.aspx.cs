using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using General;

using System.Security.Cryptography;
using System.Text;
using System.Threading;
public partial class GetSign : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();

        Signature sign = new Signature();
        sign.m_strSecId = "AKID83kCwVT75II3a4nM8KL7lRs30h9MqLzr";
        sign.m_strSecKey = "Tt63CfKkvLvqWAcKYS7oiEWYVWIp7JRK";
        sign.vodSubAppId = "1400251075";
        sign.procedure = "pimg";
        sign.m_qwNowTime = Signature.GetIntTimeStamp();
        sign.m_iRandom = new Random().Next(0, 1000000);
        sign.m_iSignValidDuration = 3600 * 24 * 2;
        

        Response.Write(sign.GetUploadSignature());
        Response.End();
    }

    public UInt32 UnixStamp()
    {

        TimeSpan ts = DateTime.Now - TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));

        return Convert.ToUInt32(ts.TotalSeconds);

    }
    
}

class Signature
{
    public string m_strSecId;
    public string m_strSecKey;
    public int m_iRandom;
    public long m_qwNowTime;
    public int m_iSignValidDuration;
    public string vodSubAppId;
    public string procedure;
    public static long GetIntTimeStamp()
    {
        TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1);
        return Convert.ToInt64(ts.TotalSeconds);
    }
    private byte[] hash_hmac_byte(string signatureString, string secretKey)
    {
        var enc = Encoding.UTF8; HMACSHA1 hmac = new HMACSHA1(enc.GetBytes(secretKey));
        hmac.Initialize();
        byte[] buffer = enc.GetBytes(signatureString);
        return hmac.ComputeHash(buffer);
    }
    public string GetUploadSignature()
    {
        string strContent = "";
        strContent += ("secretId=" + Uri.EscapeDataString((m_strSecId)));	
        strContent += ("&currentTimeStamp=" + m_qwNowTime);
        strContent += ("&expireTime=" + (m_qwNowTime + m_iSignValidDuration));
        strContent += ("&random=" + m_iRandom);
        strContent += ("&procedure=" + procedure);
        strContent += ("&vodSubAppId=" + vodSubAppId);

        byte[] bytesSign = hash_hmac_byte(strContent, m_strSecKey);
        byte[] byteContent = System.Text.Encoding.Default.GetBytes(strContent);
        byte[] nCon = new byte[bytesSign.Length + byteContent.Length];
        bytesSign.CopyTo(nCon, 0);
        byteContent.CopyTo(nCon, bytesSign.Length);
        return Convert.ToBase64String(nCon);
    }
}


