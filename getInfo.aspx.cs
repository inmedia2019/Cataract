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
public partial class getInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        string stArea = Request.Form["stArea"];
        string pageIndex = Request.Form["pageIndex"];

        Response.Write(GetMessage(stArea, pageIndex));
        Response.End();
    }

    private string GetMessage(string stArea, string pageIndex)
    {
        string sqlWhere = " and state=1";
        if (Utils.ToInt(stArea) > 0)
            sqlWhere += " and areaId=" + stArea;
        int pageNum = Utils.ToInt(pageIndex) + 1;
        string returnStr = "";
        string tbName = "(select productInfo.*,clickNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=0)," +
                     "dNum=(select count(1) from userActionInfo where infoId=productInfo.Id and tid=1)," +
                     "code=(select cast(descript as varchar) from ztypeInfo where areaId=ztypeInfo.Id) from productInfo) as tb";
        
        int count = 0;
        DataTable tb = AllTableHelp.GetAllInfo(tbName, "*", "createDate", false, 30, pageNum, sqlWhere, out count);
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            returnStr += "<div class=\"lwshow fl\" onclick=\"window.location.href='videoDetail.aspx?id=" + tb.Rows[i]["Id"].ToString() + "'\">" +
                                "<div class=\"lwbh\">" +
                                    "编号：" + GetCode(tb.Rows[i]["Id"].ToString(), tb.Rows[i]["code"].ToString()) +
                                "</div>" +
                                "<div class=\"lwbt1\">" +
                                    "查 看 作 品" +
                                "</div>" +
                                "<div class=\"lwtt center ovh pr\" style=\"border-radius: 5px;\">" +
                                    "<video id=\"player-container-id_" + tb.Rows[i]["Id"].ToString() + "\" class=\"video\" d=\"" + tb.Rows[i]["Id"].ToString() + "\" t=\"" + tb.Rows[i]["videoId"].ToString() + "\" preload=\"auto\" width=\"600px\" height=\"400px\" playsinline webkit-playinline x5-playinline></video>" +
                                    "<div class=\"spzd pa whtl0\" style=\" z-index: 100000;\"></div>" +
                                "</div>" +
                                "<div class=\"ovh dn\" style=\"padding: 6px 10px;\">" +
                                    "<div class=\"fl list_wb_i1 center\" style=\"margin-left: 0px;\"><i></i>" +
                                        "<div class=\"w5\"></div>" + tb.Rows[i]["clickNum"].ToString() +
                                    "</div>" +
                                    "<div class=\"fr list_wb_i2 center\" style=\"margin-right: 0px;\"><i></i>" +
                                        "<div class=\"w5\"></div>" + tb.Rows[i]["dNum"].ToString() +
                                    "</div>" +
                                "</div>" +
                            "</div>";
        }
        return returnStr + "|||" + pageNum.ToString();
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
}