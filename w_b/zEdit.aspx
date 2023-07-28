﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zEdit.aspx.cs" Inherits="zEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
      .boxs {
          font-size:13px;
          float:right;
      }
       .boxs1 {
          font-size:13px;
          float:right;
      }
  </style>
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
                                    <i class="icon-edit"></i>答题详细</h3>
                            </div>
                            <div class="span2">
                                <a class="btn" href="Javascript:window.history.go(-1)">返回</a></div>
                        </div>
                        <div class="box-content">
                           <fieldset >
                              <legend>答题用户信息<a href="javascript:void(0)" class="boxs">[收起∧]</a></legend>
                               <div class="text">
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    姓名：</label>
                                <div class="controls">
                                    <%=trueName %>
                                </div>
                            </div>
                             <div class="control-group">
                                <label for="title" class="control-label">
                                    CWID：</label>
                                <div class="controls">
                                   <%=CWID %>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="title" class="control-label">
                                    电话：</label>
                                <div class="controls">
                                   <%=dianhua %>
                                </div>
                            </div>
                             <div class="control-group">
                              <label for="title" class="control-label">
                                    邮箱：</label>
                                <div class="controls">
                                   <%=email %>
                                </div>
                            </div>
                          

                           </div>
                           </fieldset>

                           <fieldset>
                              <legend>答题信息<a href="javascript:void(0)" class="boxs1">[收起∧]</a></legend>
                               <div class="text1">
                                  <%=anserInfo %>
                               </div>
                           </fieldset>
                            
                            <div class="form-actions">
                              
                            </div>
                          
                        </div>
                    </div>
                </div>
            </div>
      
     </div>
    </div>
    
    
    <div style="width: 100%; text-align: center; font-size: 14px; color: #ff0000; display: none;">
        英蕾技术支持 - weimob 2.0</div>

    <script type="text/javascript">

      
      $(document).ready(function () {
          $(".boxs").toggle(function () {
              $(this).parent().parent().find(".text").animate({ height: 'toggle', opacity: 'toggle' }, "slow");
              if ($(this).html() == "[收起∧]")
                  $(this).html("[展开∨]");
              else
                  $(this).html("[收起∧]");
          }, function () {
              $(this).parent().parent().find(".text").animate({ height: 'toggle', opacity: 'toggle' }, "slow");
              if ($(this).html() == "[收起∧]")
                  $(this).html("[展开∨]");
              else
                  $(this).html("[收起∧]");
          });

          $(".boxs1").toggle(function () {
              $(this).parent().parent().find(".text1").animate({ height: 'toggle', opacity: 'toggle' }, "slow");
              if ($(this).html() == "[收起∧]")
                  $(this).html("[展开∨]");
              else
                  $(this).html("[收起∧]");
          }, function () {
              $(this).parent().parent().find(".text1").animate({ height: 'toggle', opacity: 'toggle' }, "slow");
              if ($(this).html() == "[收起∧]")
                  $(this).html("[展开∨]");
              else
                  $(this).html("[收起∧]");
          });
      });
   

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
