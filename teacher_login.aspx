<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher_login.aspx.cs" Inherits="teacher_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
		<title>评委登陆入口</title>
		<link rel="stylesheet" type="text/css" href="style/style.css" />
		<link rel="stylesheet" type="text/css" href="style/swiper.min.css" />
		<script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
		<meta http-equiv="X-UA-Compatible"content="IE=EmulateIE8" />
        <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	    <script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<style type="text/css">
			#body {
				width: 100%;
				height: 100%;
			}

			#body .swiper-slide {
				height: auto;
			}
		</style>
	</head>

	<body>
		<div id="overflow_hidden" class="pf whtl0">
			<div class="swiper-container" id="body">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="center">
							<img width="100%" src="img/signini.png?v1">
						</div>
						<div class="p1220">
							<div class="h30"></div>
							<div class=" pr ninput">
								<input type="tel" id="tel" value="" placeholder="手机号" />
								<div class="center pa signik">
									<div class="icon2 signi7"></div>
								</div>
							</div>
							<div class="h12"></div>
							<div class="center">
								<div class=" pr ninput" style="width: calc(100% - 110px);">
									<input type="tel" id="code" value="" placeholder="验证码" maxlength="6" />
									<div class="center pa signik">
										<div class="icon2 signi8"></div>
									</div>
								</div>
								<div class="hqyzm center cp" style="margin-left: 10px; width: 100px; text-align: center; color: #fff; background: rgb(223, 32, 25); height: 38px; border-radius: 5px; ">获取验证码</div>
							</div>
							
							
							<div class="h20"></div>
							<div class="center butsign f16 cp">提交</div>
							<div class="h10"></div>
						</div>
					</div>
				</div>
				<div class="swiper-scrollbar"></div>
			</div>
		</div>

		<script type="text/javascript">
			$(function() {

				var refreshEnd = false;
				var staY, endY

				var sbody = new Swiper('#body', {
					direction: 'vertical',
					slidesPerView: 'auto',
					freeMode: true,
					scrollbar: {
						el: '#body .swiper-scrollbar',
					},
					mousewheel: true,
					on: {
						touchStart: function() {
							staY = sbody.translate
						},
						momentumBounce: function() {},
						touchEnd: function() {
							if (sbody.isEnd) {
								if (staY - sbody.translate > 30) {
									//loadpage()
								}
							}
						},
					}
				});

				function loadpage() {
					sbody.allowTouchMove = false; //禁止触摸
					$(".loadlist").attr("style", "bottom: 25px;");
					setTimeout(function() {
						sbody.params.virtualTranslate = true; //定住不给回弹
						$(".loadlist").attr("style", "");
						for (var i = 0; i < 10; i++) {
							//$(".list").append(html);
						}
						sbody.params.virtualTranslate = false;
						sbody.allowTouchMove = true;
						sbody.update()
					}, 1000)
				}

				window.onpageshow = function(event) {
					setTimeout(function() {
						sbody.update()
					}, 100)
				}

			})
			
			
			var timeyzm=60;
			var setyzm;
			var isyzm=false
			var sendCode="";
			$(".hqyzm").click(function(){
				var tel = $.trim($("#tel").val());
				
				if (tel == "") {
					alert("请输入手机号！")
					//alert_Tips(, "", 1500)
					return false;
				}
				if (!isPhoneNo(tel)) {
					alert("手机号格式不正确！")
					//alert_Tips(, "", 1500)
					return false;
				}
               
                $.ajax({
		            type: "POST",
		            url: 'sendCode.aspx',
		            async: false,
		            data: {"phone": tel },
		            beforeSend: function (xmlHttpRequest) {
		            },
		            success: function (data, textStatus) {
                     
                      if(data=="2")
                      {
                         alert("非评委手机号,无法登陆！")
                         return false;
                      }
                       var temp=data.split('|');
                       if(temp[0]=="1"){
                               if(!isyzm){
					                isyzm=true
					                timeyzm=60
					                $(".hqyzm").html("倒计时："+timeyzm+"S").css("background","rgb(210, 210, 210)")
					                setyzm=setInterval(function(){
						                timeyzm--
						                $(".hqyzm").html("倒计时："+timeyzm+"S").css("background","rgb(210, 210, 210)")
						                if(timeyzm==0){
							                isyzm=false
							                clearInterval(setyzm)
							                $(".hqyzm").html("获取验证码").css("background","rgb(223, 32, 25)")
						                }
					                },1000)
				                }else{
				                	alert("验证码已发送请稍后再试！")
					               // alert_Tips(, "", 1500)
				               }
                         sendCode=temp[1];
                       }
                       else
                       {
                       	alert("网络繁忙,请稍后再试！")
                          //alert_Tips(, "", 1500)
                       }
		              
		            },
		            complete: function (xmlHttpRequest, textStatus) {
		            },
		            error: function () {
		            }
		        });
				
				
				
		   })

          
			// 验证手机号
			function isPhoneNo(phone) {
				var pattern = /^1[23456789]\d{9}$/;
				return pattern.test(phone);
			}

			$(".butsign").click(function() {

				var tel = $.trim($("#tel").val());
				var code = $.trim($("#code").val());
				if (tel == "") {
					alert("请输入手机号！")
					//alert_Tips(, "", 1500)
					return false;
				}
				if (!isPhoneNo(tel)) {
					alert("手机号格式不正确！")
					//alert_Tips(, "", 1500)
					return false;
				}

				if (code == "") {
					alert("请输入验证码！")
					//alert_Tips(, "", 1500)
					return false;
				}
             
                if(code!=sendCode)
                {
                	alert("验证码输入错误！")
                   //alert_Tips(, "", 1500)
				   return false;
                }

                $.ajax({
		            type: "POST",
		            url: 'valTeacherLogin.aspx',
		            async: false,
		            data: {"tel": tel },
		            beforeSend: function (xmlHttpRequest) {
		            },
		            success: function (data, textStatus) {
                       
		                if (data == "1")
		                    window.location.href = "teacher_videoList.aspx";

							
		                else
		                	alert("账号和密码错误！")
		                    //alert_Tips(, "", 2000)
		            },
		            complete: function (xmlHttpRequest, textStatus) {
		            },
		            error: function () {
		            }
		        });

			  
			})
		</script>
         <script src="fx.js?v=2" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('http://jjsv.atline.cn/iCataract_line/teacher_login.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛")
   </script>

<script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>
