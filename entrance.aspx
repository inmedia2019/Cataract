<%@ Page Language="C#" AutoEventWireup="true" CodeFile="entrance.aspx.cs" Inherits="entrance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="style/style.css" />


        <script src="js/jquery-2.0.3.min.js"></script>
		<script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>

            <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	    <script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

	</head>

	<body style="height: 100%;" class="ovh">
		<div class="center">
            <img width="100%" src="img/signupi.png?v1">
        </div>
        <div class="center pr">
            <img class="w100" src="img/bg3.jpg" alt="">

            <div class="pa" style=" top: 50px; left: 0px; width: 100%;">
                <a href="sign_ups.aspx" class="center">
                    <img style="width: 65%;" src="img/butbm.png" alt="">
                </a>
                <div style="height: 20px;"></div>
                <a href="mylist.aspx" class="center">
                    <img style="width: 65%;" src="img/butzp.png" alt="">
                </a>
                <div style="height: 20px;"></div>
                <div class="center pf" style=" bottom:20px; width:100%; left:0px " onclick="exit()">
                    <div class="" style=" padding:8px 25px; background:rgba(223,32,25,1); color:#fff; border-radius: 5px;">安全退出</div>
                </div>
            </div>
        </div>

           <script src="fx.js?v=2" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('http://jjsv.atline.cn/iCataract_line/entrance.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2022年度强生眼力健白内障手术达人赛")

       function exit() {
           $.ajax({
               type: "POST",
               url: 'exit.aspx',
               async: false,
               data: {

               },
               beforeSend: function (xmlHttpRequest) {

               },
               success: function (data, textStatus) {
                   if (data == "1") {
                       window.location.href = "sign_up.aspx";

                   }

               },
               complete: function (xmlHttpRequest, textStatus) { },
               error: function () { }
           });
       }
   </script>
	</body>

</html>
