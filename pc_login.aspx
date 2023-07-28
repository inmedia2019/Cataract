<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pc_login.aspx.cs" Inherits="pc_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="style/style.css" />
		<link rel="stylesheet" type="text/css" href="style/swiper.min.css" />
		<script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<style type="text/css">
			html,
			body {
				overflow: auto;
				background: url(img/bg2.jpg) no-repeat center;
				background-size: 100% auto;
			}
		</style>
	</head>
	<body>
		<div class="pf pctop">
			<div class="pctopbg1"></div>
			<div class="pctopbg2 center">
				<div class="w1200 fs30 cfff ovh">
					<div class="center fl">
						<img style="margin-right: 20px; width: 213px;" src="img/logo.png" >
						白内障手术达人赛视频上传
					</div>
				</div>
			</div>
		</div>
		
		<div class="center pa whtl0">
			<div style="width: 100%;">
				<div class="w1200 ovh center">
					<div>
						<div class="bfff bor1200 tec center" style="padding: 20px;">
							<img width="400px" style="border-radius:10px ;" src="img/signupi.png" >
						</div>
						<div class="bfff p1220 tec pr" style="font-size: 24px; padding-top: 0px;">
							密码登录
							<div class="pa" style="width: 100px; height: 2px; background: #DF2019; bottom: 0px; left: 180px;"></div>
						</div>
						<div style="height: 1px; background: #DDDDDD;"></div>
						<div class="bfff bor0012 p1220 f18">
							<div style="height: 28px;"></div>
							<input type="text" id="password" value="" placeholder="输入验证码" style="width: calc(100% - 22px); text-align: center; background: #ececec; border: #d0d0d0 solid 1px; font-size: 16px; padding: 12px 10px 12px 10px; border-radius: 5px;color: #999;-webkit-appearance: none;" />
							<div style="height: 80px;"></div>
							<div class="center f18">
								<div class="qcqrtj cfff center cp" style="width: 100%;">确认</div>
							</div>
							<div style="height: 28px;"></div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
		    var isupvideo = false

		    $(".pcvideoup").click(function () {
		        isupvideo = true
		    })
		    $(".isdescribe").hide()
		    $("#describe").change(function () {
		        if ($(this).val() == "其他") {
		            $(".isdescribe").show()
		        } else {
		            $(".isdescribe").hide()
		        }
		    })

		    $(".qcqrtj").click(function () {
		        if ($.trim($("#password").val()) == "") {
		            alert("请输入验证码！")
		            return false;
		        }

		        $.ajax({
		            type: "POST",
		            url: 'valLogin.aspx',
		            async: false,
		            data: { "password": $.trim($("#password").val()) },
		            beforeSend: function (xmlHttpRequest) {
		            },
		            success: function (data, textStatus) {
		                if (data == "1")
		                    window.location.href = "pcUpload.aspx";
		                else
		                	alert("验证码输入错误！")
		            },
		            complete: function (xmlHttpRequest, textStatus) {
		            },
		            error: function () {
		            }
		        });


		    })
		</script>

	</body>
</html>
