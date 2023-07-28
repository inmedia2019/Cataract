<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showEdit.aspx.cs" ValidateRequest="false" Inherits="w_b_showEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="管理平台">
    <meta name="Description" content="管理平台">
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
    <link rel="stylesheet" type="text/css" href="css/plugins/chosen/chosen.css?v=2014-05-21" media="all">
   
    <link rel="stylesheet" type="text/css" href="css/resource.css?v=2014-05-21">
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

    <script type="text/javascript" src="src/emotion.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/jquery_validate_min.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/jquery_validate_methods.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/chosen_jquery_min.js?v=2014-05-21"></script>

  

    <script type="text/javascript" src="src/resource.js?v=2014-05-21"></script>

     <script type="text/javascript" src="../b_edit/ueditor.config.js"></script>

    <script type="text/javascript" src="../b_edit/ueditor.all.js"></script>


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
                                        <i class="icon-edit"></i><%=lang %> - 答案信息编辑</h3>
                                </div>
                                <div class="span2">
                                    <a class="btn" href="Javascript:location.href='showAnswerInfo.aspx?qid=<%=qid %>&lid=<%=lid %>'">返回</a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="control-group">
                                    <label for="picurl" class="control-label">
                                         答案信息：</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtAnswer" CssClass="input-xlarge" Width="500" runat="server"></asp:TextBox>
                                        <span class="maroon">*</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                <label for="title" class="control-label">
                                    上传图片：</label>
                                <div class="controls">
                                <div id="thumb_img" class="">
                                        <img upload="image-single" id="src" style="max-height: 50px;" src="<%=src %>">
                                        <asp:HiddenField ID="picurl"  runat="server" />
                                   <span class="help-inline">
                                    <button name="button" class="btn select_img" type="button" onclick="upImage()">
                                                    选择图片</button><span class="help-inline"></span></span>
                                     <button name="button" class="btn select_img" type="button" onclick="ClearImage()">
                                                    清除图片</button>
                                </div>
                                   <script type="text/plain" id="j_ueditorupload" style="height:5px;display:none;" ></script>  
                                   <script>
                                       function ClearImage()
                                       {
                                           $("#src").hide();
                                           $("#src").attr("src", "");
                                           $("#picurl").val("");
                                       }
                                       var webSiteUrl = '<%=Config.webSiteUrl %>';
                                       //实例化编辑器  
                                       var o_ueditorupload = UE.getEditor('j_ueditorupload',
                                       {
                                           autoHeightEnabled: false
                                       });
                                       o_ueditorupload.ready(function () {
                                           o_ueditorupload.hide();//隐藏编辑器  

                                           //监听图片上传  
                                           o_ueditorupload.addListener('beforeInsertImage', function (t, arg) {
                                               $pp = (arg[0].src);
                                               $("#src").attr("src", webSiteUrl + $pp);
                                               $("#picurl").val($pp);
                                               $("#src").show();
                                           });
                                       });

                                       //弹出图片上传的对话框  
                                       function upImage() {
                                           var myImage = o_ueditorupload.getDialog("insertimage");
                                           myImage.open();
                                       }


                                    </script>  
                                </div>
                            </div>
                                <div class="control-group">
                                    <label for="picurl" class="control-label">
                                         是否追加文本框：</label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbAppendTxt" runat="server" />
                                    </div>
                                </div>
                                 <div class="control-group">
                                    <label for="picurl" class="control-label">
                                         是否正确答案：</label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbCheck" runat="server" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="picurl" class="control-label">
                                         排序：</label>
                                    <div class="controls">
                                       <asp:TextBox ID="txtSn" CssClass="input-xlarge" Text="0" runat="server"></asp:TextBox>
                                        <span class="maroon">*</span>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    // 导航
                                    $(document).ready(function () {
                                        var resource = Resource.create();
                                        var ins = Resource.instance['res_block'];
                                        ins.result = ins.result || {};
                                        ins.result.aid = 512305;

                                    });


                                 </script>

                                </div>
                                <div class="form-actions">
                                   <asp:HiddenField ID="hfContent" runat="server" />
                                   <asp:HiddenField ID="hfId" runat="server" Value="0" />
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="保存"
                                        OnClick="btnSubmit_Click" OnClientClick="return getDids()" />
                                  
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

     

        <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
            
        </div>

        <script type="text/javascript">

            function getDids() {


                $("#hfContent").val(ue.getContent());

            }

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

