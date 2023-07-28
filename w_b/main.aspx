<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="Keywords" content="平台管理系统" />
    <meta name="Description" content="平台管理系统" />
    <link rel="stylesheet" type="text/css" href="css/app.css?v=2014-05-21" media="all" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap_min.css?v=2014-05-21"
        media="all" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap_responsive_min.css?v=2014-05-21"
        media="all" />
    <link rel="stylesheet" type="text/css" href="css/style.css?v=2014-05-21" media="all" />
    <link rel="stylesheet" type="text/css" href="css/themes.css?v=2014-05-21" media="all" />
    <link rel="stylesheet" type="text/css" href="css/todc_bootstrap.css?v=2014-05-21"
        media="all" />
    <link rel="stylesheet" type="text/css" href="css/font_awesome.css?v=2014-05-21" media="all" />

    <script type="text/javascript" src="src/jQuery.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/applicationnew.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/bootstrap_min.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/jquery_bootbox.js?v=2014-05-21"></script>

    <script type="text/javascript" src="src/bootstrap_contextmenu.js?v=2014-05-21"></script>

    <title>平台管理系统</title>
    <!--[if IE 7]>
            <link href="css/font_awesome_ie7.css?v=2014-05-21" rel="stylesheet" />
        <![endif]-->
</head>
<body>
    <style type="text/css">
        .auth-modal p {
            text-indent: 5em;
            padding: 10px 0;
        }

        .auth-modal div {
            color: #333;
            font-size: 28px;
            padding-bottom: 10px;
        }

        .authu-btn {
            display: inline-block;
            width: 100px;
            height: 30px;
            line-height: 30px;
            color: #fff;
            background: url();
            text-align: left;
            padding-left: 10px;
        }

            .authu-btn:hover {
                text-decoration: none;
                color: #fff;
            }

        .g-tips {
            z-index: 21;
            position: absolute;
            margin-top: -37px;
            left: 120px;
        }

            .g-tips .cont {
                border: 1px solid #febe8f;
                background-color: #fff8d9;
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
                padding: 0 2px;
                border-color: #ffb787;
                background-color: #fcfcfc;
                height: 28px;
                line-height: 14px;
            }

            .g-tips a {
                line-height: 14px !important;
            }

            .g-tips .cont:before, .g-tips .cont:after {
                overflow: hidden;
                position: absolute;
                top: 50%;
                left: -11px;
                margin-top: -5px;
                width: 0;
                height: 0;
                border-width: 6px;
                border-style: dashed solid dashed dashed;
                content: '';
                border-color: transparent #ffb787 transparent transparent;
            }

            .g-tips .cont:after {
                left: -10px;
                border-color: transparent #fff transparent transparent;
            }

        .g-new {
            width: 24px;
            margin: -18px 0 0 3px;
        }
    </style>
    <body class="body">
        <div id="context-menu" data-toggle="context" data-target="#context-menu">
            <ul class="dropdown-menu" role="menu">
                <li><a tabindex="-1" href="javascript:;">打开</a></li>
                <li><a tabindex="-1" href="javascript:;">删除</a></li>
                <li><a tabindex="-1" href="javascript:;">重命名</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="javascript:;">属性</a></li>
            </ul>
        </div>
        <div id="navigation">
            <div class="container-fluid">
                <div>
                  <a href="javascript:void(0);"
                        class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation">
                        <i class="icon-reorder"></i></a>
                </div>
                <ul class='main-nav'>
                    <li class='active'><a href="javascript:void(0);"><span>管理平台</span> </a></li>
                  
                </ul>
                <div class="user">
                    <ul class="icon-nav">
                    
                        <!--                 <li>
                        <a href="javascript:;" title="全屏" data-toggle="fullscreen"><i class="icon-fullscreen"></i></a></li>-->
                        <li class='dropdown colo'><a href="#" class='dropdown-toggle' data-toggle="dropdown"
                            title="选择颜色"><i class="icon-tint"></i></a>
                            <ul class="dropdown-menu pull-right theme-colors">
                                <li class="subtitle">Predefined colors </li>
                                <li><span class='red'></span><span class='orange'></span><span class='green'></span>
                                    <span class="brown"></span><span class="blue"></span><span class='lime'></span><span
                                        class="teal"></span><span class="purple"></span><span class="pink"></span><span class="magenta">
                                        </span><span class="grey"></span><span class="darkblue"></span><span class="lightred">
                                        </span><span class="lightgrey"></span><span class="satblue"></span><span class="satgreen">
                                        </span></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="dropdown " >
                        <form id="form1" runat="server" target="_self">
                        <asp:LinkButton ID="lbExit" runat="server" OnClick="lbExit_Click" Style="padding: 3px 30px;
                            font-size: 13px; color: #ffffff;">退出系统</asp:LinkButton>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid" id="content">
            <div class="btn-toolbar clearfix" id="shortcutMenu">
                <div class="btn-group" style="margin-left: 35px">
                    <button type="button" id="shortcutMenuBtn" class="btn btn-inverse btn-icon" style="height: 30px;">
                        <i class="icon-plus"></i>
                    </button>
                    <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        快捷菜单 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu text-left" style="z-index: 10000" id="shortcutHrefList">
                        <li><a id="-1" title="空" data-url="" href="javascript:void(0);" target="mainFrame">
                            <空>
                        </a></li>

                        <script type="text/html" id="addUrlTem">
                        <li><a id="{{id}}" title="{{title}}" data-url="{{url}}" href="{{url}}" {{if target}}target="{{target}}"{{/if}} target="mainFrame">{{title}}</a></li>
                        </script>

                    </ul>
                </div>
            </div>
            <div id="left" style="top: 50px;">
               
                <div class="subnav">
                    <div class="subnav-title first-subnav">
                        <a href="javascript:void(0)" class='toggle-subnav'><em><strong class="icon-menu"><i
                            class="wmfontset wmfont wm-mobile"></i></strong><b class="bg-icon-color">&nbsp;</b>
                        </em><span>上传视频管理</span> <i class="icon-angle-down"></i></a>
                    </div>
                    <ul class="subnav-menu" style="display: none;">
                        <li>
                            <div class="subnav-title second-subnav isurl">
                                <a href="zLists.aspx" class="toggle-subnav " target="mainFrame"><i class="icon-angle-down icon-space">
                                </i><span>报名信息列表</span> </a>
                            </div>
                        </li>
                       <li <%=isShow %>>
                            <div class="subnav-title second-subnav isurl">
                                <a href="newsTypeList.aspx" class="toggle-subnav " target="mainFrame"><i class="icon-angle-down icon-space">
                                </i><span>视频区域列表</span> </a>
                            </div>
                        </li>
                        <li>
                            <div class="subnav-title second-subnav isurl">
                                <a href="meetingList.aspx" class="toggle-subnav " target="mainFrame"><i class="icon-angle-down icon-space">
                                </i><span>视频列表</span> </a>
                            </div>
                        </li>
                        <li <%=isShow %>>
                            <div class="subnav-title second-subnav isurl">
                                <a href="FormInfoList.aspx" class="toggle-subnav " target="mainFrame"><i class="icon-angle-down icon-space">
                                </i><span>表单信息</span> </a>
                            </div>
                        </li>
                    </ul>
                </div>
               
            </div>
            <div class="right">
                <div class="main">
                    <iframe frameborder="0" id="mainFrame" name="mainFrame" src="default.aspx"
                        height="100%" width="100%" style="background: url('') center no-repeat">
                    </iframe>
                </div>
            </div>
        </div>

        <script>P.skn();</script>

        <div id="showShortcutMenuModal" style="width: 50%" class="modal hide fade" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;</button>
                        <h4 class="modal-title">
                            快捷菜单</h4>
                    </div>
                    <div class="modal-body" style="overflow-y: auto">
                        <ul class="unstyled inline clearfix shortmenu-ul" id="shortmenuShow" style="padding-bottom: 10px;">

                            <script type="text/html" id="shortMenuShowTem">
                            {{each slist as value}}
                            <li>
                                <a class="btn btn-default" data-title="{{value.title}}" data-id="{{value.id}}" href="javascript:;" data-url="{{value.url}}">{{value.title}}<i class="icon-remove" title="删除"></i></a>
                            </li>
                            {{/each}}
                            </script>

                            <script type="text/html" id="addTem">
                            <li>
                                <a class="btn btn-default" data-title="{{title}}" data-id="{{id}}" href="javascript:;"  data-url="{{url}}">{{title}}<i class="icon-remove" title="删除"></i></a>
                            </li>
                            </script>

                        </ul>
                        <p>
                        </p>
                        <div class="tabbable tabs-left">
                            <ul class="nav nav-tabs" role="tablist" id="shortcutMenuFirst">

                                <script type="text/html" id="shortcutMenuFirstTem">
                                {{each firstmenu as value i}}
                                    <li {{if i==0}}class="active"{{/if}}><a href="#firstMenu{{i}}" data-toggle="tab">{{value.name}}</a></li>
                                {{/each}}
                                </script>

                            </ul>
                            <div class="tab-content" id="shortcutMenuList">

                                <script type="text/html" id="shortcutMenuSecondTem">
                                {{each secondmenu as value i}}
                                    <div class="tab-pane {{if i==0}}active{{/if}}" id="firstMenu{{i}}" style="overflow:hidden">
                                        {{each value as val }}
                                        {{if val.name}}
                                            <h6>{{val.name}}</h6>
                                        {{/if}}
                                        <ul class="unstyled inline clearfix shortmenu-ul">
                                            {{each val.tlist as v j}}
                                            <li><a data-title="{{v.title}}" data-id="{{v.id}}" {{if v.target}}data-target="{{v.target}}"{{/if}}
 title="{{if v.flag}}已添加，点击取消{{/if}}{{if !v.flag}}点击添加快捷菜单{{/if}}" class="btn {{if v.flag}}disabled{{/if}}" data-url="{{v.url}}" href="javascript:;"><i class="{{if v.flag}}icon-ok{{/if}}{{if !v.flag}}icon-plus{{/if}}"></i>{{v.title}}</a></li>
                                            {{/each}}
                                        </ul>
                                        {{/each}}
                                    </div>
                                {{/each}}
                                </script>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
                    </div>
                </div>
            </div>
        </div>
    </body>

    <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
        技术支持</div>
</body>

<script type="text/javascript">
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

</html>
