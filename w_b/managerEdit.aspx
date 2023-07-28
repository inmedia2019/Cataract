<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerEdit.aspx.cs" ValidateRequest="false" Inherits="w_b_managerEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <link rel="shortcut icon" href="img/favicon.ico?v=2014-05-21">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_min.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/bootstrap_responsive_min.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/style.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/todc_bootstrap.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/themes.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/inside.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/emotion.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/plugins/chosen/chosen.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/resource.css?v=2014-05-21">
    <link rel="stylesheet" type="text/css" href="css/font_awesome.css?v=2014-05-21" media="all" />
    <link rel="stylesheet" type="text/css" href="css/uploadify.css" media="all">

    <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>



    <style type="text/css">
        .dropdown-submenu:hover > .dropdown-menu {
            display: none;
        }
    </style>


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
                                    <h3><i class="icon-edit"></i>审核员详细信息</h3>
                                </div>
                                <div class="span2">
                                    <a class="btn" href="Javascript:window.history.go(-1)">返回</a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="control-group">
                                    <label for="title" class="control-label">
                                        账号：</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtAccout" CssClass="input-xlarge" Width="400" runat="server"></asp:TextBox>
                                        <span class="maroon">*</span>
                                    </div>
                                </div>
                                <div class="control-group" >
                                    <label for="title" class="control-label">
                                        密码：</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtPassWord" CssClass="input-xlarge" Width="400" runat="server"></asp:TextBox>
                                        <span class="maroon">*</span>
                                    </div>
                                </div>    
                            </div>
                            <div class="form-actions">
                              
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="保存" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
        </div>
        <div id="fallr-overlay">
        </div>
    </form>
</body>
</html>