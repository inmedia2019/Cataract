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