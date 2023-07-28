<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zLists.aspx.cs" Inherits="zLists" %>



<%@ Register Assembly="PublicControls" Namespace="PublicControls" TagPrefix="mycols" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_min.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_responsive_min.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/style.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/todc_bootstrap.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/themes.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/inside.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/font_awesome.css?v=2014-05-21" media="all" />

    <script type="text/javascript" src="src/jQuery.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/bootstrap_min.js?v=2014-05-21"></script>

    <style type="text/css">
        .dropdown-submenu:hover > .dropdown-menu
        {
            display: none;
        }
    </style>

    <script type="text/javascript" src="src/inside.js?v=2014-05-21"></script>

    <title>管理后台</title>
    <!--[if IE 7]>
            <link href="css/font_awesome_ie7.css?v=2014-05-21" rel="stylesheet" />
        <![endif]-->
   
</head>
<body>
    <form id="listForm" runat="server">
    <div id="main">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="box">
                        <div class="box-title">
                            <div class="span8">
                                <h3>
                                    <i class="icon-table"></i>用户报名信息</h3>
                            </div>
                            <div class="span4">
                                <div class="form-horizontal">
                                    <asp:TextBox ID="txtKeyWord" CssClass="input-small-z" placeholder="姓名" runat="server"></asp:TextBox>&nbsp;
                                    <asp:Button ID="btn_search" CssClass="btn" runat="server" Text="查询" OnClick="btn_search_Click" />&nbsp;
                                    
                                </div>
                            </div>
                        </div>
                        <div class="box-content nozypadding">
                            <div class="row-fluid">
                                <div class="span8 control-group">
                                    <div class="span5">
                                       
                                         <asp:Button ID="btnOut" runat="server" Text="导出Excel" onclick="btnOut_Click" />
                                    </div>
                                </div>
                            </div>
                            -
                            <div class="row-fluid dataTables_wrapper">
                                <table id="listTable" class="table table-hover table-nomargin table-bordered usertable dataTable">
                                    <thead>
                                        <tr>
                                            <th class="with-checkbox">
                                                <input type="checkbox" id="checkall" onclick="checkallInfo(this)">
                                            </th>
                                            <th>
                                                姓名
                                            </th>
                                             <th>
                                                邮箱
                                            </th>
                                             <th>
                                                密码
                                            </th>
                                            <th>
                                                医院
                                            </th>
                                            <th>
                                                省份
                                            </th>
                                            <th>
                                                强生销售
                                            </th>
                                             <th>
                                                手术标题
                                            </th>
                                              <th>
                                                手术类型
                                            </th>
                                             <th>
                                                手术描述
                                            </th>
                                             
                                            <th>
                                                时间
                                            </th>
                                            <th>
                                                操作
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptData" runat="server" OnItemCommand="rptData_ItemCommand" OnItemDataBound="rptData_ItemDataBound">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="with-checkbox">
                                                        <input type="checkbox" class="check_all" value='<%#Eval("Id") %>'>
                                                    </td>
                                                      <td>
                                                        <%#Eval("trueName")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("email")%>
                                                    </td>
                                                    
                                                    <td>
                                                        <%#Eval("passCode")%>
                                                    </td>
                                                   
                                                    <td>
                                                        <%#Eval("hospital")%>
                                                    </td>
                                                      <td>
                                                        <%#Eval("proviceName")%>
                                                    </td>
                                                      <td>
                                                        <%#Eval("saleName")%>
                                                    </td>
                                                      <td>
                                                        <%#Eval("title")%>
                                                    </td>
                                                      <td>
                                                        <%#GetMajorType(Eval("majorType").ToString())%>
                                                    </td>
                                                     <td>
                                                        <%#Eval("descript")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("createDate")%>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lbDel" CommandName="del" CssClass="btn" OnClientClick="return confirm('确认删除?')" CommandArgument='<%#Eval("Id") %>'
                                                            runat="server">删除</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <div>
                                    <mycols:MccNetPager ID="MyPager" StyleString="class='quotes'" Next="下一页" Last="尾页"
                                        Pres="..." Nexts="..." Pre="上一页" First="首页" Pages="10" runat="server" Pagesize="12"
                                        OnPageIndexChange="MyPager_PageIndexChange">
                                    </mycols:MccNetPager>
                                </div>
                                <div>
                                    <asp:Button ID="btnDel" runat="server" Text="删除" OnClick="btnDel_Click" OnClientClick="return getIds()" />
                                </div>
                                <asp:HiddenField ID="hfIds" runat="server" />
                                <div class="dataTables_paginate paging_full_numbers">
                                    <span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">


        function checkallInfo(objs) {
            var numInfo = $("#listTable").find("input");

            for (j = 0; j < numInfo.length; j++) {
                if (numInfo[j].type == "checkbox" && $(numInfo[j]).attr("id") != "checkall") {
                    numInfo[j].checked = $(objs).attr("checked");
                }
            }

        }

        function getIds() {
            var numinfo = $("#listTable").find("input");

            for (j = 0; j < numinfo.length; j++) {
                if (numinfo[j].type == "checkbox" && $(numinfo[j]).attr("id") != "checkall" && $(numinfo[j]).attr("checked") == "checked") {
                    $("#hfIds").val($("#hfIds").val() + $(numinfo[j]).val() + ",");
                }
            }

            if ($("#hfIds").val() == "") {
                alert("请选择要删除的项!");
                return false;
            }

            return confirm("确认删除?");

        }

        function setSn(bid) {
            if ($("#txtSn" + bid).val() == "") {
                alert("请填写排序!");
                return false;
            }

            $.ajax({
                type: "POST",
                url: 'modifySn.aspx',
                async: false,
                data: { "objNum": $("#txtSn" + bid).val(), "objId": bid },
                beforeSend: function (xmlHttpRequest) {
                },
                success: function (data, textStatus) {
                    if (data == "1")
                        alert("更新成功!");
                },
                complete: function (xmlHttpRequest, textStatus) {
                },
                error: function () {
                }
            });

        }


    </script>

    <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
        英蕾技术支持 - weimob 2.0</div>

    <script>
        window.document.onkeydown = function (e) {
            if ('BODY' == event.target.tagName.toUpperCase()) {
                var e = e || event;
                var currKey = e.keyCode || e.which || e.charCode;
                if (8 == currKey) {
                    return false;
                }
            }
        };
    </script>

    <div id="fallr-overlay">
    </div>
    </form>
</body>
    </html>