<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherLists.aspx.cs" Inherits="teacherLists" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <title>网络海选获奖名单</title>
  
    <script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
  
  
    <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
   	<style>
			html,body{ margin: 0px; padding: 0px; }
		</style>
</head>
<body>
     <div class="img" style="">
			<img style="width: 100%;" src="" >
		</div>
		<script type="text/javascript">

		    function GetQueryValue(queryName) {
		        var query = decodeURI(window.location.search.substring(1));
		        var vars = query.split("&");
		        for (var i = 0; i < vars.length; i++) {
		            var pair = vars[i].split("=");
		            if (pair[0] == queryName) { return pair[1]; }
		        }
		        return null;
		    }

		    if (GetQueryValue('id') == 14) {
		        $("img").hide()
		        $(".img").html("产品信息正在更新中，敬请期待!").attr("style", " text-align: center; padding-top: 200px; font-size: 18px;")
		    } else {
		        $("img").attr("src", "img/c" + GetQueryValue('id') + ".png")
		    }
			
		</script>
     <script src="fx.js?v=1" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
	 <script type="text/javascript">
	     loadfx('http://jjsv.atline.cn/iCataract_line/teacher_videoLists.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛-网络海选获奖名单")
	</script>
   <script>
       var _hmt = _hmt || [];
       (function () {
           var hm = document.createElement("script");
           hm.src = "https://hm.baidu.com/hm.js?6ccdf781d6092b6dc70475599c21e7cc";
           var s = document.getElementsByTagName("script")[0];
           s.parentNode.insertBefore(hm, s);
       })();
		</script>
</body>
</html>
