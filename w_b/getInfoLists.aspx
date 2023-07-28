<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getInfoLists.aspx.cs" Inherits="w_b_getInfoLists" %>
<%@ Register Assembly="PublicControls" Namespace="PublicControls" TagPrefix="mycols" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <mycols:MccNetPager ID="MyPager" StyleString="class='quotes'" Next="下一页" Last="尾页"
                    Pres="..." Nexts="..." Pre="上一页" First="首页" Pages="9" runat="server" Pagesize="9"
                    OnPageIndexChange="MyPager_PageIndexChange">
                </mycols:MccNetPager>
    </div>
    </form>
</body>
</html>
