
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class e_k_PhoneSendCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string phone = Request.Form["phone"];
      
        Response.Write(GetMessage(phone));
        Response.End();
    }
    
    public string GenerateTimeStamp(DateTime dt)
    {
       
        TimeSpan ts = dt.ToUniversalTime() - new DateTime(1970, 1, 1, 0, 0, 0, 0);
        return Convert.ToInt64(ts.TotalSeconds).ToString();
    }

    private string SHA256Encrypt(string str)
    {
        System.Security.Cryptography.SHA256 s256 = new System.Security.Cryptography.SHA256Managed();
        byte[] byte1;
        byte1 = s256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(str));
        s256.Clear();
        return ByteArrayToHex(byte1);
    }

    public string StrToHash(string str)
    {
        System.Security.Cryptography.SHA256 sha256 = new System.Security.Cryptography.SHA256Managed();
        byte[] resultByteArray = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(str));
        return ByteArrayToHex(resultByteArray);
    }

    private static string ByteArrayToHex(byte[] byteArray)
    {
        string returnStr = "";
        if (byteArray != null)
        {
            for (int i = 0; i < byteArray.Length; i++)
            {
                returnStr += byteArray[i].ToString("x2");
            }
        }
        return returnStr;
    }



    private string GetMessage(string phone)
    {


        string sdkappid = "1400635878";
        string sdkAppect = "afc1182cbbb0417d1b66567c3a53c51b";
        string random = Guid.NewGuid().ToString();
        string time = GenerateTimeStamp(DateTime.Now);
        string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sdkAppect + phone, "MD5").ToUpper();
        string sign_r = SHA256Encrypt("appkey=" + sdkAppect + "&random=" + random + "&time=" + time + "&mobile=" + phone);
        string sendCode = new RandomNumber().GenerateRandom(6);

        string url = "";
        string json = "";

        url = "https://yun.tim.qq.com/v3/tlssmssvr/sendsms?sdkappid=" + sdkappid + "&random=" + random;
        json = "{" +
                       "\"tel\" :{ " +
                              " \"nationcode\": \"86\", " +
                               "\"phone\": \"" + phone + "\"" +
                        " }," +
                       "\"type\": \"0\"," +
                       "\"msg\": \"【强生眼力健】验证码为：" + sendCode + "，您正在登录，若非本人操作，请勿泄露。\"," +
                       "\"sig\": \"" + sign + "\"," +
                       "\"extend\": \"\"," +
                       "\"ext\": \"\"" +
                   "}";


        string returnStr = HttpHelper.Post(url, json);

        //WriteData(Server.MapPath("~/log.txt"), returnStr);
        var serializer = new JavaScriptSerializer();
        var userInfo = serializer.Deserialize<Dictionary<string, object>>(returnStr);
        if (userInfo["result"].ToString() == "0")
        {
            phoneSendCode info = new phoneSendCode();
            info.createDate = DateTime.Now;
            info.descript = returnStr;
            info.Id = 0;
            info.moreCol = "";
            info.moreCol1 = "";
            info.phone = phone;
            info.state = 0;
            info.tid = 0;
            info.vcode = sendCode;
            new phoneSendCodeDAL().Add(info);
            Session["isHavePhone"] = 1;
            return "1|" + sendCode;
        }
        return "0";
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
}