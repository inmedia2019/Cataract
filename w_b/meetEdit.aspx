<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meetEdit.aspx.cs" ValidateRequest="false"
    Inherits="meetEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <link rel="shortcut icon" href="img/favicon.ico?v=2014-05-21">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_min.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_responsive_min.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/style.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/todc_bootstrap.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/themes.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/inside.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/emotion.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/plugins/chosen/chosen.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/resource.css?v=2014-05-21">
    <link rel="stylesheet" type="text/css" href="css/font_awesome.css?v=2014-05-21" media="all" />
    <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
    <style type="text/css">
        .dropdown-submenu:hover > .dropdown-menu
        {
            display: none;
        }
    </style>
    <script type="text/javascript" src="../b_edit/ueditor.config.js"></script>
    <script type="text/javascript" src="../b_edit/ueditor.all.js"></script>
    <link href="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.css" rel="stylesheet">
    <!-- 如需在IE8、9浏览器中初始化播放器，浏览器需支持Flash并在页面中引入 -->
    <!--[if lt IE 9]>  
 <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/ie8/videojs-ie8.js"></script>  
 <![endif]-->
    <!-- 如果需要在 Chrome Firefox 等现代浏览器中通过H5播放hls，需要引入 hls.js -->
    <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/lib/hls.min.0.8.8.js"></script>
    <!-- 引入播放器 js 文件 -->
    <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.min.js"></script>
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
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal form-validate" novalidate>
    <div id="main">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="box">
                        <div class="box-title">
                            <div class="span10">
                                <h3>
                                    <i class="icon-edit"></i>详细信息</h3>
                            </div>
                            <div class="span2">
                                <a class="btn" href="Javascript:window.history.go(-1)">返回</a></div>
                        </div>
                        <div class="box-content">
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    信息状态：</label>
                                <div class="controls">
                                    <%=stateInfo %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    上传用户：</label>
                                <div class="controls">
                                    <%=trueName %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    临床经验：</label>
                                <div class="controls">
                                    超声乳化手术经验：<asp:TextBox ID="txtSNum" CssClass="input-xlarge" Text="0" Width="40px"
                                        runat="server"></asp:TextBox>年<br />
                                    超声乳化年手术量：<asp:TextBox ID="txtLNum" CssClass="input-xlarge" Text="0" Width="40px"
                                        runat="server"></asp:TextBox>例
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    医院：</label>
                                <div class="controls">
                                    <%=hospital %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    地区：</label>
                                <div class="controls">
                                    <%=proviceName %>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    负责销售：</label>
                                <div class="controls">
                                    <%=saleName %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    标题：</label>
                                <div class="controls">
                                    <%=title %>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    手术类型：</label>
                                <div class="controls">
                                    <%=majorType %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    其他：</label>
                                <div class="controls">
                                    <%=majorOther %>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    视频ID：</label>
                                <div class="controls">
                                    <%=videoId %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    视频地址：</label>
                                <div class="controls">
                                    <%=videoUrl %>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    授权书地址：</label>
                                <div class="controls">
                                    <a href="<%=fileUrl %>" target="_blank">
                                        <%=fileUrl %></a>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    病例模板地址：</label>
                                <div class="controls">
                                    <a href="<%=demoUrl %>" target="_blank">
                                        <%=demoUrl %></a>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    专家授权书附件：</label>
                                <div class="controls">
                                    <a href="<%=sqUrl %>" target="_blank">
                                        <%=sqUrl %></a>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    手术描述：</label>
                                <div class="controls">
                                    <%=descript %>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    视频：</label>
                                <div class="controls">
                                    <video id="player-container-id" preload="auto" width="600px" height="400px" playsinline
                                        webkit-playinline x5-playinline></video>
                                    <script type="text/javascript">
                                        var player = TCPlayer("player-container-id", { // player-container-id 为播放器容器ID，必须与html中一致  
                                            fileID: "<%=videoId %>", // 请传入需要播放的视频filID 必须  
                                            appID: "1400251075", // 请传入点播账号的appID 必须  
                                            autoplay: false //是否自动播放  
                                            //其他参数请在开发文档中查看  
                                        }); 
                                    </script>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="picurl" class="control-label">
                                    PPT：</label>
                                <div class="controls">
                                    <div id="divVideo" style="display: none;">
                                        <%=tuwen %></div>
                                    <script id="editor" type="text/plain" style="width: 1024px; height: 500px;"></script>
                                    <script type="text/javascript">
                                        var ue = UE.getEditor('editor');
                                        ue.ready(function () {
                                            ue.setContent($("#divVideo").html());
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="picurl" class="control-label">
                                    驳回原因：</label>
                                <div class="controls">
                                    <style>
                                     #cbList td{width:100px;}
                                     #cbList input{float:left;margin-right:10px;}
                                    </style>
                                    <asp:CheckBoxList ID="cbList" RepeatColumns="3" CssClass="cbL"  RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Value="视频">视频</asp:ListItem>
                                        <asp:ListItem Value="个人信息">个人信息</asp:ListItem>
                                        <asp:ListItem Value="病例幻灯片">病例幻灯片</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:HiddenField ID="hfContent" runat="server" Value="" />
                            <asp:HiddenField ID="hfCb" runat="server" Value="" />
                            <span <%=isShow==""?"style='display:none'":"" %>><asp:Button ID="btnPass" runat="server" CssClass="btn btn-primary" Text="通过" OnClick="btnPass_Click"
                                OnClientClick="return getDids()" />&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <span <%=isShow %>><asp:Button ID="btnSecondPass" runat="server" CssClass="btn btn-primary" Text="二次审核通过" OnClick="btnSecondPass_Click"
                                OnClientClick="return getDids()" />&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <asp:Button ID="btnNotPass" runat="server" CssClass="btn btn-primary" OnClientClick="return getResons()" Text="驳回" OnClick="btnNotPass_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function getDids() {
            $("#hfContent").val(ue.getContent());
        }

        $(".cbL input").each(function () {
            $(this).attr("name", "cbLC");
        });

        function getResons() {
            var reason = "";

            $("input[name='cbLC']:checked").each(function () {
                reason += $(this).val() + "|";
            });
          
            if (reason == "") {
                alert("请选择驳回原因!")
                return false;
            }
            $("#hfCb").val(reason);
            return true;
        }

    </script>
    <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
    </div>
    <div id="fallr-overlay">
    </div>
    </form>
</body>
</html>
