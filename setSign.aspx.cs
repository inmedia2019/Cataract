using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Dm.Model.V20151123;
using General;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class setSign : WebPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string name = Request.Form["name"];
        string hospital = Request.Form["hospital"];
        string province = Request.Form["province"];
        string qiangsheng = Request.Form["qiangsheng"];
        string videotitle = Request.Form["videotitle"];
        string describe = Request.Form["describe"];
        string describetext = Request.Form["describetext"];
        string mailbox = Request.Form["mailbox"];
        string descript = Request.Form["descript"];
        string txtYear = Request.Form["txtYear"];
        string txtNum = Request.Form["txtNum"];
        Response.Write(GetMessage(name, hospital, province, qiangsheng, videotitle, describe, describetext, mailbox, descript, txtYear, txtNum));
        Response.End();
    }

    private string GetMessage(string name, string hospital, string province, string qiangsheng, string videotitle, string describe, string describetext, string mailbox, string descript, string txtYear, string txtNum)
    {
        string sourceUrl = Request.UrlReferrer.ToString();
        if (sourceUrl.IndexOf("http://jjsv.atline.cn") < 0)
            return "-1";
        //int count = new memberInfoDAL().GetRecordCount(" openId='" + Oid.Replace("'","") + "'");
        //if (count > 0)
        //return "2";
        DataTable dt = new memberInfoDAL().GetList(" openId='" + Oid.Replace("'", "") + "'").Tables[0];
        if (dt.Rows.Count > 0)
        {
            memberInfo minfo = new memberInfo();
            minfo.createDate = DateTime.Now;
            minfo.descript = descript;
            minfo.email = mailbox;
            minfo.hospital = hospital;

            minfo.majorType = Utils.ToInt(describe);
            minfo.moreCol = describetext;
            minfo.moreCol1 = txtYear + "|" + txtNum;
            minfo.openId = Oid;
            minfo.passCode = "";
            minfo.proviceName = province;
            minfo.saleName = qiangsheng;
            minfo.state = 0;
            minfo.title = videotitle;
            minfo.trueName = name;
            minfo.Id = Utils.ToInt(dt.Rows[0]["Id"]);
            minfo.passCode = minfo.Id.ToString() + (new Random().Next(1000)).ToString();
            minfo.phone = dt.Rows[0]["phone"].ToString();
           
            int result = new memberInfoDAL().Add(minfo);
            if (result > 0)
            {
                //  minfo.passCode = result.ToString() + (new Random().Next(1000)).ToString();
                // minfo.Id = Utils.ToInt(result);
                //   new memberInfoDAL().Update(minfo);



                string sendEmails = "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" >" +
               "<tr>" +
                "<td align=\"center\">" +
                    "<table style=\"width: 615px; margin: 0px auto;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                        "<tr>" +
                            "<td>" +
                                "<img src=\"http://jjsv.atline.cn/iCataract_line/img/signupi.png\" width=\"600px\">" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                           "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "姓名：" + minfo.trueName +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                           "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "医院：" + minfo.hospital +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                           "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "标题：" + minfo.title +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                        //   "<tr>" +
                        //    "<td style=\"font-size: 14px;\">" +
                        //        "手术类型：" + GetTypeInfo(minfo.majorType, minfo.moreCol) +
                        //    "</td>" +
                        //"</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "达人赛上传视频链接：<a href=\"http://jjsv.atline.cn/iCataract_line/pc_login.aspx\" style=\"color: #006699;\">请点击这里上传参赛视频</a>" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "如果点击无效,请复制：<a href=\"#\" style=\"color: #006699;\">http://jjsv.atline.cn/iCataract_line/pc_login.aspx</a> 至浏览器打开." +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "您的登录验证码是：<span style=\"color: #d12028; font-size: 30px;\">" + minfo.passCode + "</span>" +
                            "</td>" +
                        "</tr>" +
                         "<tr>" +
                            "<td style=\"height: 10px;\">" +

                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td style=\"font-size: 14px;\">" +
                                "病例模板下载链接：<a href=\"http://jjsv.atline.cn/iCataract_line/dow/2022年强生白内障达人赛--病例模板.pptx\" style=\"color: #006699;\">https://wx.linkmed.cn/iCataract_line/dow/2022年强生白内障达人赛--病例模板.pptx</a>" +
                            "</td>" +
                        "</tr>" +
                    "</table>" +
                "</td>" +
            "</tr>" +
        "</table>";

                IClientProfile profile = DefaultProfile.GetProfile("cn-hangzhou", "3RZPrE3F2YC1urbV", "xgn9bwZTSYtqjmO8IGmUDzNB0VUWZ1");
                IAcsClient client = new DefaultAcsClient(profile);
                SingleSendMailRequest request = new SingleSendMailRequest();
                try
                {
                    request.AccountName = "icataract@server.doctorp.cn";
                    request.FromAlias = "强生眼力健达人赛";
                    request.AddressType = 1;
                    request.TagName = "强生眼力健达人赛";
                    request.ReplyToAddress = true;
                    request.ToAddress = mailbox;
                    request.Subject = "强生眼力健2022年度白内障手术视频大赛";
                    request.HtmlBody = sendEmails;
                    SingleSendMailResponse httpResponse = client.GetAcsResponse(request);
                }
                catch (ServerException ex)
                {
                    WriteData(Server.MapPath("~/1.txt"), ex.Message);

                }
                catch (ClientException ex)
                {
                    WriteData(Server.MapPath("~/1.txt"), ex.Message);

                }


                return "1";
            }
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

    public string GetTypeInfo(int t, string d)
    {
        string majorType = "";
        if (t == 1)
            majorType = "青光眼合并白内障";
        else if (t == 2)
            majorType = "糖尿病合并白内障";
        else if (t == 3)
            majorType = "高度近视白内障";
        else if (t == 4)
            majorType = "小瞳孔白内障";
        else if (t == 5)
            majorType = "伴有晶状体位置异常的白内障";
        else if (t == 6)
            majorType = "外伤性白内障";
        else if (t == 7)
            majorType = "儿童白内障";
        else if (t == 8)
            majorType = "其他(" + d + ")";
        return majorType;
    }
}