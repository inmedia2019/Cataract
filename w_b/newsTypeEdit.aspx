<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsTypeEdit.aspx.cs" ValidateRequest="false"
    Inherits="w_b_newsTypeEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <link rel="stylesheet" type="text/css" href="css/emotion.css?v=2014-05-21" media="all">
    <link rel="stylesheet" type="text/css" href="css/plugins/chosen/chosen.css?v=2014-05-21"
        media="all">
    <link rel="stylesheet" type="text/css" href="css/resource.css?v=2014-05-21">
    <%--<script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>--%>
    <style type="text/css">
        .dropdown-submenu:hover > .dropdown-menu
        {
            display: none;
        }
    </style>
    <script type="text/javascript" src="src/jQuery.js?v=2014-05-21"></script>
    <script type="text/javascript" src="/iCataract_line/b_edit/ueditor.config.js?v=1"></script>
    <script type="text/javascript" src="/iCataract_line/b_edit/ueditor.all.js?v2"></script>
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
                                <a class="btn" href="Javascript:window.history.go(-1)">返回</a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    名称：</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtTitle" CssClass="input-xlarge" Width="400" runat="server"></asp:TextBox>
                                    <span class="maroon">*</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="picurl" class="control-label">
                                    背景图：</label>
                                <div class="controls">
                                    <div id="thumb_img" class="">
                                        <img upload="image-single" id="src" style="max-height: 50px;" src="<%=src %>">
                                        <asp:HiddenField ID="picurl" runat="server" />
                                        <asp:HiddenField ID="picurlOld" runat="server" />
                                        <span class="help-inline">
                                            <button name="button" class="btn select_img" type="button" onclick="upImage()">
                                                选择图片</button><span class="help-inline"></span></span><span class="maroon">*</span>
                                    </div>
                                    <script type="text/plain" id="j_ueditorupload" style="height: 5px; display: none;"></script>
                                    <script>

                                        //实例化编辑器  
                                        var o_ueditorupload = UE.getEditor('j_ueditorupload',
                                            {
                                                autoHeightEnabled: false
                                            });
                                        o_ueditorupload.ready(function () {
                                            o_ueditorupload.hide(); //隐藏编辑器  

                                            //监听图片上传  
                                            o_ueditorupload.addListener('beforeInsertImage', function (t, arg) {
                                                $pp = (arg[0].src);
                                                $("#src").attr("src", $pp);
                                                $("#picurl").val($pp);

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
                                    灰色背景图：</label>
                                <div class="controls">
                                    <div id="thumb_img1" class="">
                                        <img upload="image-single" id="src1" style="max-height: 50px;" src="<%=src1 %>">
                                        <asp:HiddenField ID="picurl1" runat="server" />
                                        <asp:HiddenField ID="picurlOld1" runat="server" />
                                        <span class="help-inline">
                                            <button name="button" class="btn select_img" type="button" onclick="upImage1()">
                                                选择图片</button><span class="help-inline"></span></span><span class="maroon">*</span>
                                    </div>
                                    <script type="text/plain" id="j_ueditorupload1" style="height: 5px; display: none;"></script>
                                    <script>

                                        //实例化编辑器
                                        var o_ueditorupload1 = UE.getEditor('j_ueditorupload1',
                                            {
                                                autoHeightEnabled: false
                                            });
                                            o_ueditorupload1.ready(function () {
                                                o_ueditorupload1.hide(); //隐藏编辑器  

                                            //监听图片上传  
                                                o_ueditorupload1.addListener('beforeInsertImage', function (t, arg) {
                                                $pp = (arg[0].src);
                                                $("#src1").attr("src", $pp);
                                                $("#picurl1").val($pp);

                                            });
                                        });

                                        //弹出图片上传的对话框  
                                        function upImage1() {

                                            var myImage = o_ueditorupload1.getDialog("insertimage");
                                            myImage.open();
                                        }


                                    </script>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    大区编号首字母：</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtZiMu" CssClass="input-xlarge" Width="400" runat="server"></asp:TextBox>
                                    <span class="maroon">*</span>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    评委老师账号：</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtName" CssClass="input-xlarge" Width="400" runat="server"></asp:TextBox>
                                    <span class="maroon">*</span>
                                </div>
                            </div>
                            <div class="control-group" style="display: none;">
                                <label for="title" class="control-label">
                                    评委老师密码：</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPass" CssClass="input-xlarge" Width="400" runat="server"></asp:TextBox>
                                    <span class="maroon">*</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    排序：</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtSn" CssClass="input-xlarge" Text="0" runat="server"></asp:TextBox>
                                    <span class="maroon">*</span>
                                </div>
                            </div>
                            <div class="control-group" style="display:none;">
                                    <label for="picurl" class="control-label">
                                        选择大区视频：</label>
                                    <div class="controls">
                                        <table class="dataTable-mini" id="more_graphics_table">
                                            <%=sbStr %>
                                        </table>
                                        <button type="button" rel="more_graphics_table" class="btn add-on">
                                            添加</button>
                                    </div>
                              </div>

                        </div>
                        <div class="form-actions">
                            <asp:HiddenField ID="hftids" runat="server" />
                               <%-- OnClientClick="return getDids()"--%>
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

    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×</button>
                        <h4 class="modal-title">
                            <i class="icon-table"></i>选择视频信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            标题：<input name="key" id="key" type="text" class="input-medium" placeholder="输入标题进行查找">

                            <button type="button" class="btn" id="_soso">
                                <strong>查找</strong></button>
                        </div>
                        <p>
                        </p>
                        <div class="row-fluid">
                            <input type="checkbox" id="chkall" name="chkall">
                            全选 共有 <span class="red" id="count_num">0</span> 条符合条件
                        <button type="button" class="btn btn-mini" id="p_page">
                            <strong>上一页</strong></button>
                            <span id="p_page_str">第1页/共1页</span>
                            <button type="button" class="btn btn-mini" id="n_page">
                                <strong>下一页</strong></button>
                            <ul class="unstyled list-li-border" id="data-list">
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary sure" data-dismiss="modal">
                            确定</button>
                    </div>

                    <script type="text/javascript">
                        $(document).ready(function () {

                            var _pdata_table_id;
                            var _isoso = false;
                            $("#chkall").click(function () {
                                var $idsCheck = $("#data-list input[name='check']")
                                var $this = $(this);
                                if ($this.attr("checked")) {
                                    $idsCheck.attr("checked", true);
                                } else {
                                    $idsCheck.attr("checked", false);
                                }
                                $idsCheck.each(function () {
                                    _tr($(this));
                                });

                            });

                            $(".close,.sure").click(function () {
                                $('#myModal').hide();

                            });

                            $("#_soso").click(function () { _isoso = true; $("#_soso").attr("disabled", ""); _page(1) });
                            $("#classid").change(function () { _this_page = 1; _page(1) });
                            $("#data-list input[name='check']").live("click", function () { _tr($(this)); });
                            var _tr = function (_t) {
                                var $this = _t;
                                var $title = $this.attr("t");
                                var $id = $this.val();
                                var $selecttr = $("#" + _pdata_table_id + "tr" + $id + "");
                                if ($this.attr("checked")) {
                                    if ($selecttr.length == 0) {
                                        var t = (_pdata_table_id == "more_graphics_table") ? "votetouser[0][]" : "votetouser[1][]";
                                        var _trtmp = "<tr id='" + _pdata_table_id + "tr" + $id + "'><td><input type='hidden' name='" + t + "'  value='" + $id + "' />" + $title + "</td><td><a href='javascript:void(0)' class='btn btn-mini del'><i class='icon-remove'>X</i></a></td></tr>";
                                        $("#" + _pdata_table_id + "").append(_trtmp);
                                    }

                                } else {
                                    $selecttr.remove();
                                }
                            }

                            //删除
                            $("table.dataTable-mini .del").live("click", function () {
                                $(this).parent().parent().remove();
                            });
                            $("button.add-on").click(function (e) {
                                e.preventDefault();

                                _pdata_table_id = $(this).attr("rel");
                                $('#myModal').show();
                                $('#myModal').removeClass("fade");
                                $("#chkall").attr("checked", false);
                                _page(1);
                            });
                            $("#p_page").click(function () {
                                if (_this_page - 1 > 0) {
                                    _this_page--;
                                    _page(_this_page);
                                }
                            });
                            $("#n_page").click(function () {
                                if (_this_page + 1 <= _this_page_count) {
                                    _this_page++;
                                    _page(_this_page);
                                }
                            });
                            var _this_page = 1; //当前页
                            var _this_page_count = 0; //总页数
                            var _page = function (_index) {
                                var key = "";
                                if (_isoso) {
                                    key = $("#key").val();
                                }
                                var classid = $("#classid").val();

                                $.ajax({
                                    type: "POST",
                                    url: 'getInfoLists.aspx',
                                    async: false,
                                    data: { "key": key, "page": _index },
                                    beforeSend: function (xmlHttpRequest) {
                                    },
                                    success: function (data, textStatus) {
                                        $("#data-list").html("");

                                        var temp = data.split('|||');

                                        $("#data-list").html(temp[0]);
                                        if (parseInt(temp[1]) < 9)
                                            _this_page_count = 1;

                                        else if (parseInt(temp[1]) % 9 == 0)
                                            _this_page_count = parseInt(temp[1]) / 9;
                                        else
                                            _this_page_count = (parseInt(temp[1]) / 9) + 1;

                                        $("#count_num").text(temp[1]);
                                        $("#p_page_str").text("第" + _this_page + "页/共" + parseInt(_this_page_count) + "页");
                                        $("#_soso").removeAttr("disabled")
                                    },
                                    complete: function (xmlHttpRequest, textStatus) {
                                    },
                                    error: function () {
                                    }
                                });

                            }
                        })


                        function getDids() {
                            var checks = $("#more_graphics_table").find("input");
                            var str = "";
                            for (j = 0; j < checks.length; j++) {
                                if ($(checks[j]).attr("type") == "hidden") {
                                    str += $(checks[j]).val() + ",";
                                }
                            }
                            $("#hftids").val(str);
                        }


                    </script>

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
</body>
</html>
