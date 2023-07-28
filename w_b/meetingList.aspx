<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meetingList.aspx.cs" Inherits="meetingList" %>

<%@ Register Assembly="PublicControls" Namespace="PublicControls" TagPrefix="mycols" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="  ">
    <meta name="Description" content="  ">
 
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
        .ewmimg img{width: 80px;}
    </style>

    <script type="text/javascript" src="src/inside.js?v=2014-05-21"></script>

    <title>管理后台</title>
    <!--[if IE 7]>
            <link href="css/font_awesome_ie7.css?v=2014-05-21" rel="stylesheet" />
        <![endif]-->
    <!--[if lte IE 8]>
            <script src="js/excanvas_min.js?v=2014-05-21"></script>
        <![endif]-->
    <!--[if lte IE 9]>
            <script src="js/watermark.js?v=2014-05-21"></script>
        <![endif]-->
        
        <style type="text/css">
			.tk{ width: 100%; height: 100%; background: rgba(0,0,0,0.7); position: fixed; z-index: 9999; }
			.tk_center{ height: 100%; display: -webkit-box;display: -ms-flexbox; display: -webkit-flex; display: flex; -webkit-box-pack: center; -ms-flex-pack: center; -webkit-justify-content: center; justify-content: center;-webkit-box-align: center; -ms-flex-align: center; -webkit-align-items: center; align-items: center;}
			.ewmtk{ width: 500px; height: 500px; background: #fff; border-radius:10px ; position: relative;}
			.guanbi{ width: 50px; height: 50px; position: absolute; top: -20px; right: -20px; background: #c5c5c5; border-radius:100px; font-size: 24px; color: #fff; text-align: center; line-height: 50px;}
			
			 .pop-box {
            z-index: 2; /*这个数值要足够大，才能够显示在最上层*/
            margin-bottom: 3px;
            display: none;
            position: absolute;
            background: #FFF;
            border: solid 1px #6e8bde;
        }

            .pop-box h4 {
                color: #FFF;
                cursor: default;
                height: 18px;
                font-size: 14px;
                font-weight: bold;
                text-align: left;
                padding-left: 8px;
                padding-top: 4px;
                padding-bottom: 2px;
                background: #38f;
                margin: 0px;
            }

        .pop-box-body {
            clear: both;
            margin: 4px;
            padding: 2px;
        }
		</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
    	
    	<div class="tk" style="display: none;">
			<div class="tk_center">
				<div class="ewmtk">
					<div class="guanbi" onclick="hideDiv()">x</div>
					<img src="api.png" style="width: 450px; margin: 25px;"/>
				</div>
			</div>
		</div>
    	
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="box">
                        <div class="box-title">
                            <div class="span8">
                                <h3>
                                    <i class="icon-table"></i>视频信息管理</h3>
                            </div>
                            <div class="span4">
                                 <div class="form-horizontal">
                                 <span style="<%=styleInfo %>" >
                                    <asp:DropDownList ID="ddlState" runat="server">
                                     <asp:ListItem Value="-1">=全部=</asp:ListItem>   
                                     <asp:ListItem Value="0">待审核</asp:ListItem> 
                                     <asp:ListItem Value="1">已审核</asp:ListItem> 
                                     <asp:ListItem Value="2">未通过审核</asp:ListItem>
                                    </asp:DropDownList></span>
                                   <asp:TextBox ID="keyword" CssClass="input-small-z" placeholder="请输入视频标题/上传用户" width="180" runat="server"></asp:TextBox>
                                  
                                   <asp:Button ID="btnSearch" CssClass="btn" runat="server" Text="查询" OnClick="btnSearch_Click" />
                               </div>
                            </div>
                        </div>
                        <div class="box-content nozypadding">
                            <div class="row-fluid">
                                <div class="span8 control-group">
                                    <div class="">
                                        <a class="btn" href="javascript:location.reload();">刷新</a>
                                        <span style="<%=styleInfo %>">
                                        <asp:Button ID="btnOut" runat="server" CssClass="btn" Text="参赛数据导出"  onclick="btnOut_Click" />
                                        <asp:Button ID="btnPOut" runat="server" CssClass="btn" Text="评分数据导出"  onclick="btnPOut_Click" /></span>
                                        为了您的网站最佳浏览体验，推荐使用Google Chrome, Firefox, Safari及IE 9.0以上浏览器.
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid dataTables_wrapper">
                                <table id="listTable" class="table table-hover table-nomargin table-bordered usertable dataTable">
                                    <thead>
                                        <tr>
                                          <th class="with-checkbox" style="display:none;">
                                                <input type="checkbox" id="checkall" onclick="checkallInfo(this)">
                                            </th>

                                            <th>
                                                状态
                                            </th>
                                            <th>
                                                上传用户
                                            </th>
                                            <th >
                                                医院
                                            </th>
                                            <th >
                                                地区
                                            </th>
                                            <th >
                                                强生销售
                                            </th>
                                            <th >
                                                标题
                                            </th>
                                            <th>
                                                视频ID
                                            </th>
                                            <th >
                                                上传时间
                                            </th>
                                            <th >
                                                操作
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptData" runat="server" onitemcommand="rptData_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="with-checkbox" style="display:none;">
                                                       <input type="checkbox" class="check_all" value='<%#Eval("Id") %>'>
                                                    </td>
                                                    <td style="color:Red;">
                                                       <%#GetState(Eval("state").ToString())%>
                                                    </td>
                                                    <td>
                                                       <%#Eval("trueName")%>
                                                    </td>
                                                    <td>
                                                       <%#Eval("hospital")%>
                                                    </td>
                                                    <td>
                                                       <%#Eval("proviceName")%>
                                                    </td>
                                                    <td>
                                                       <%#Eval("saleInfo")%>
                                                    </td>
                                                    <td>
                                                       <%#Eval("title")%>
                                                    </td>
                                                    <td>
                                                       <%#Eval("videoId")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("createDate")%>
                                                    </td>
                                                    <td>
                                                        <a href="meetEdit.aspx?id=<%#Eval("Id") %>" class="btn"><i class="icon-edit"></i>查看详细</a>
                                                        <asp:LinkButton ID="lbDel" CommandName="del" CssClass="btn" OnClientClick="return confirm('确认删除吗？')"  CommandArgument='<%#Eval("Id") %>'
                                                            runat="server"><i class="icon-remove"></i>删除</asp:LinkButton>
                                                    </td>
                                                </tr>

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <div>
                                    <mycols:MccNetPager ID="MyPager" StyleString="class='quotes'" Next="下一页" Last="尾页"
                                        Pres="..." Nexts="..." Pre="上一页" First="首页" Pages="10" runat="server" Pagesize="20"
                                        OnPageIndexChange="MyPager_PageIndexChange">
                                    </mycols:MccNetPager>
                                </div>
                                 <div style="display:none;"> 
                                    <input value="设置分组" onclick="setInfos()" type="button" />
                                 </div>
                                 <asp:HiddenField ID="hfIds" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <div id='pop-div' style="width: 600px" class="pop-box">
            <h4>分组管理</h4>
            <div class="pop-box-body">
                <table>
                    <tr>
                        <td >
                         <asp:DropDownList ID="ddlInfo" runat="server" >
                                    
                         </asp:DropDownList>
                        </td>
                    </tr>
                </table>

            </div>
            <div class='buttonPanel' style="text-align: center; margin-bottom: 10px;">
                <input value="保存" id="btnSub" onclick="addInfo()" type="button" />
                <input value="取消" id="btn1" onclick="hideDiv('pop-div');" type="button" />
            </div>
        </div>
    <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
        英蕾技术支持 - weimob 2.0</div>

    <script>
        function checkallInfo(objs) {
            var numInfo = $("#listTable").find("input");

            for (j = 0; j < numInfo.length; j++) {
                if (numInfo[j].type == "checkbox" && $(numInfo[j]).attr("id") != "checkall") {
                    numInfo[j].checked = $(objs).attr("checked");
                }
            }

        }
        function setInfos() {
            var numinfo = $("#listTable").find("input");

            for (j = 0; j < numinfo.length; j++) {
                if (numinfo[j].type == "checkbox" && $(numinfo[j]).attr("id") != "checkall" && $(numinfo[j]).attr("checked") == "checked") {
                    $("#hfIds").val($("#hfIds").val() + $(numinfo[j]).val() + ",");
                }
            }

            if ($("#hfIds").val() == "") {
                alert("请选择要操作的项!");
                return false;
            }
            else
                popupDiv('pop-div');

        }

        function addInfo() {
            var ginfo = $("#ddlInfo").val();
          

            var numinfo = $("#listTable").find("input");
            var ids = "";
            for (j = 0; j < numinfo.length; j++) {
                if (numinfo[j].type == "checkbox" && $(numinfo[j]).attr("id") != "checkall" && $(numinfo[j]).attr("checked") == "checked") {

                    ids = ids + $(numinfo[j]).val() + ",";
                }
            }


            if ($.trim(ids) == "") {
                alert("请选择要操作的项!");
                return false;
            }
            else {
                ids = ids.substring(0, ids.length - 1);
            }

            if (confirm("确认操作?") == true) {

                $.ajax({
                    type: "POST",
                    url: 'setGroupInfo.aspx',
                    async: false,
                    data: { "ginfo": ginfo, "memberId": ids },
                    beforeSend: function (xmlHttpRequest) {

                    },
                    success: function (data, textStatus) {
                       
                        if (data == "1") {
                            alert("更新成功!");
                            hideDiv('pop-div');
                            location.reload();
                        }
                    },
                    complete: function (xmlHttpRequest, textStatus) {
                    },
                    error: function () {
                    }
                });
            }
        }


        window.document.onkeydown = function(e) {
            if ('BODY' == event.target.tagName.toUpperCase()) {
                var e = e || event;
                var currKey = e.keyCode || e.which || e.charCode;
                if (8 == currKey) {
                    return false;
                }
            }
        };


        function popupDiv(div_id) {
            var div_obj = $("#" + div_id);
            var windowWidth = document.documentElement.clientWidth;
            var windowHeight = document.documentElement.clientHeight;
            var popupHeight = div_obj.height();
            var popupWidth = div_obj.width();
            //添加并显示遮罩层 
            $("<div id='mask'></div>").addClass("mask")
                .width(windowWidth * 0.99)
                .height(windowHeight * 0.99)
                .click(function () { hideDiv(div_id); })
                .appendTo("body")
                .fadeIn(200);
            div_obj.css({ "position": "absolute" })
                .animate({
                    left: windowWidth / 2 - popupWidth / 2,
                    top: windowHeight / 2 - popupHeight / 2, opacity: "show"
                }, "slow");
        }

        function hideDiv(div_id) {
            $("#mask").remove();
            $("#" + div_id).animate({ left: 0, top: 0, opacity: "hide" }, "slow");
        }


    </script>

    <div id="fallr-overlay">
    </div>
    </form>
</body>
</html>
