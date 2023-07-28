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
using System.Collections;
public partial class mylist : WebPage
{
    public string areaInfo = "";
    public int tid = DNTRequest.GetInt("tid", 0);
  
    public string sName = "";
    public int countNum = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {

        string tbName = "(select productInfo.*,clickNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=0)," +
                        "dNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=1)," +
                        "code=(select cast(descript as varchar) from ztypeInfo where areaId=ztypeInfo.Id),reason=(select top 1 descript from productVerifyRecord where productId=productInfo.id order by id desc) from productInfo) as tb";
        string sqlWhere = " and mid in(select id from memberInfo where phone=(select top 1 phone from memberInfo where openId='" + Oid + "' and len(phone)>0) ) and state<>3";
        int count = 0;
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, 30, 1, sqlWhere, out count);
        rptData.DataSource = tb;
        rptData.DataBind();
        countNum = count;

    }

    public string GetScore(string infoId)
    {
        string scoreSql = @"select *,hospital=(select moreCol from teacherAccout where id=userActionInfo.mid),
                            trueName=(select accoutPwd from teacherAccout where id=userActionInfo.mid) from userActionInfo where infoid=" + infoId;
        DataTable dt = DbHelper.ExecuteDataTable(System.Data.CommandType.Text, scoreSql, null);
        string returnStr = "";
        ArrayList answer1 = new ArrayList();
        ArrayList answer2 = new ArrayList();
        ArrayList answer3 = new ArrayList();
        ArrayList answer4 = new ArrayList();
        ArrayList answer5 = new ArrayList();
        string temp = "";
        temp += "<div class=\"ovh\" style=\"margin-top: 5px;\">" +
                                    "<div style=\"margin-top: 1px; margin-bottom: 6px;\">" +
                                       " 专家评语：" +
                                   " </div>";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            answer1.Add(GetScores(dt.Rows[i]["moreCol1"].ToString(), 0));
            answer2.Add(GetScores(dt.Rows[i]["moreCol1"].ToString(), 1));
            answer3.Add(GetScores(dt.Rows[i]["moreCol1"].ToString(), 2));
            answer4.Add(GetScores(dt.Rows[i]["moreCol1"].ToString(), 3));
            answer5.Add(GetScores(dt.Rows[i]["moreCol1"].ToString(), 4));


            temp += " <div class=\"ovh\">" +
                  "  <div class=\"fl zjpybut\" style=\"padding: 3px 8px;border-radius: 3px; background: " + (i == 0 ? "#de1f26" : "#999") + "; color: #fff; margin-right: 5px; margin-bottom: 5px;\">" + (dt.Rows[i]["hospital"].ToString() + " " + GetTrueName(dt.Rows[i]["trueName"].ToString())) + "</div>" +
                  "  <div class=\"zjpynr " + (i == 0 ? "" : "dn") + "\" style=\" width: 100%; float: left; margin-bottom: 10px;\">" +
                     dt.Rows[i]["descript"].ToString().Replace("\"", "“") +
                 "   </div>" +
              "  </div>";

            //temp += " <div class=\"ovh\">" +
            //      "  <div class=\"fl zjpybut\" style=\"padding: 3px 8px;border-radius: 3px; background: " + (i == 0 ? "#de1f26" : "#999") + "; color: #fff; margin-right: 5px; margin-bottom: 5px;\">上海第一人民医院 李教授</div>" +
            //      "  <div class=\"zjpynr " + (i == 0 ? "" : "dn") + "\" style=\" width: 100%; float: left; margin-bottom: 10px;\">" +
            //         dt.Rows[i]["descript"].ToString().Replace("\"", "“") +
            //     "   </div>" +
            //  "  </div>";

            //if (i < dt.Rows.Count - 1)
            //{
            //    returnStr += "<div style=\"line-height:2;margin-bottom: 10px; border-bottom: #d1d1d1 solid 2px; padding-bottom: 10px;\">" +
            //                               " 医院教授：" + (dt.Rows[i]["hospital"].ToString() + " " + GetTrueName(dt.Rows[i]["trueName"].ToString())) + "<br />" +
            //                               " 总分：" + (GetCountScore(dt.Rows[i]["moreCol1"].ToString())) + "<br />" +
            //                               " 维度评分：" + dt.Rows[i]["moreCol1"].ToString().Replace("|","/") + "<br />" +
            //                               " 专家评语：" + dt.Rows[i]["descript"].ToString().Replace("\"", "“") +
            //                          "   </div>";
            //}
            //else
            //{
            //    returnStr += "<div style=\"line-height:2;\">" +
            //                                 " 医院教授：" + (dt.Rows[i]["hospital"].ToString() + " " + GetTrueName(dt.Rows[i]["trueName"].ToString())) + "<br />" +
            //                                 " 总分：" + (GetCountScore(dt.Rows[i]["moreCol1"].ToString())) + "<br />" +
            //                                 " 维度评分：" + dt.Rows[i]["moreCol1"].ToString().Replace("|", "/") + "<br />" +
            //                                 " 专家评语：" + dt.Rows[i]["descript"].ToString().Replace("\"", "“") +
            //                            "</div>";
            //}
        }

        temp += "  </div>";


        returnStr += "<div style=\"line-height:2;\">" +
                                     " 总分：" + (GetCountScore(answer1, answer2, answer3, answer4, answer5, dt.Rows.Count)) + "<br />" +
                                     " 维度评分：" + GetScore(answer1, answer2, answer3, answer4, answer5, dt.Rows.Count) +
                                     temp +
                                "</div>";

        return returnStr;

    }

    public int GetScores(string s, int n)
    {
        try
        {
            return Utils.ToInt(s.Split('|')[n]);
        }
        catch (Exception)
        {

        }

        return 0;
    }

    public string GetScore(ArrayList answer1, ArrayList answer2, ArrayList answer3, ArrayList answer4, ArrayList answer5, int personNum)
    {
        int num1 = 0;
        int num2 = 0;
        int num3 = 0;
        int num4 = 0;
        int num5 = 0;

        for (int i = 0; i < answer1.Count; i++)
        {
            try
            {
                num1 += Utils.ToInt(answer1[i]);
            }
            catch (Exception)
            {
                
                
            }
           
        }

        for (int i = 0; i < answer2.Count; i++)
        {
            try
            {
                num2 += Utils.ToInt(answer2[i]);
            }
            catch (Exception)
            {


            }

        }

        for (int i = 0; i < answer3.Count; i++)
        {
            try
            {
                num3 += Utils.ToInt(answer3[i]);
            }
            catch (Exception)
            {


            }

        }

        for (int i = 0; i < answer4.Count; i++)
        {
            try
            {
                num4 += Utils.ToInt(answer4[i]);
            }
            catch (Exception)
            {


            }

        }

        for (int i = 0; i < answer5.Count; i++)
        {
            try
            {
                num5+= Utils.ToInt(answer5[i]);
            }
            catch (Exception)
            {


            }

        }
        personNum = personNum == 0 ? 1 : personNum;
        return Utils.ToDecimal(num1 / personNum).ToString("f0") + "/" + Utils.ToDecimal(num2 / personNum).ToString("f0") + "/" + Utils.ToDecimal(num3 / personNum).ToString("f0") + "/" + Utils.ToDecimal(num4 / personNum).ToString("f0") + "/" + Utils.ToDecimal(num5 / personNum).ToString("f0");


    }

    public string GetCountScore(ArrayList answer1, ArrayList answer2, ArrayList answer3, ArrayList answer4, ArrayList answer5, int personNum)
    {
        int sunNum = 0;
        for (int i = 0; i < answer1.Count; i++)
        {
            sunNum += Utils.ToInt(answer1[i]);
        }

        for (int i = 0; i < answer2.Count; i++)
        {
            sunNum += Utils.ToInt(answer2[i]);
        }
        for (int i = 0; i < answer3.Count; i++)
        {
            sunNum += Utils.ToInt(answer3[i]);
        }
        for (int i = 0; i < answer4.Count; i++)
        {
            sunNum += Utils.ToInt(answer4[i]);
        }
        for (int i = 0; i < answer5.Count; i++)
        {
            sunNum += Utils.ToInt(answer5[i]);
        }


        return Utils.ToDecimal((sunNum / (personNum == 0 ? 1 : personNum))).ToString("f0");
    }

    public string GetTrueName(string t)
    {
        if (t.Length > 0)
            return t.Substring(0, 1) + "教授";
        return t;
    }

    public string GetDescriptInfo(string des)
    {
        string[] temp = des.Split('|');
        string returnStr = "";
        for (int i = 0; i < temp.Length; i++)
        {
            if (temp[i].Length > 0)
            {
                returnStr += temp[i] + "、";
            }
        }

        if (returnStr.Length > 0)
            returnStr = returnStr.Substring(0, returnStr.Length - 1);

        return "抱歉，您的<span style='color:red;'>" + returnStr + "</span>未通过审核，请凭邮件验证码登录后台，根据规范调整并重新提交。";
    }

    public string GetCode(string productId, string codeInfo)
    {
        if (productId.Length == 1)
        {
            return codeInfo + "000" + productId;
        }
        else if (productId.Length == 2)
        {
            return codeInfo + "00" + productId;
        }
        else if (productId.Length == 3)
        {
            return codeInfo + "0" + productId;
        }
        else if (productId.Length == 4)
        {
            return codeInfo + productId;
        }
        return "";
    }

    /// <summary>  
    /// Base64加密  
    /// </summary>  
    /// <param name="Message"></param>  
    /// <returns></returns>  
    public string Base64Code(string Message)
    {
        byte[] bytes = System.Text.Encoding.Default.GetBytes(Message);
        return Convert.ToBase64String(bytes);
    }

}