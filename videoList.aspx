<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoList.aspx.cs" Inherits="videoList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/swiper.min.css" />
    <script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <style type="text/css">
        #body
        {
            width: 100%;
            height: 100%;
        }
        
        #body .swiper-slide
        {
            height: auto;
        }
        
        .worknav .swiper-slide
        {
            width: 80px;
        }
        .worknav .swiper-slide.on
        {
            color: #DF2019;
            font-size: 16px;
        }
        .worknav .swiper-slide.on span
        {
            display: block;
            background: #DF2019;
            width: 50px;
            height: 3px;
            bottom: 0px;
            border-radius: 5px;
            position: absolute;
            left: 15px;
        }
    </style>
</head>
<body>
    <div id="overflow_hidden" class="pf whtl0">
        <div class="swiper-container" id="body">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="lwmain">
                        <div class="h20">
                        </div>
                        <asp:Repeater ID="rptData" runat="server">
                            <ItemTemplate>
                                <a href="videoDetailList.aspx?tid=<%#Eval("Id") %>">
                                    <div class="lwlist center " style="background: url(<%#Eval("moreCol1") %>) no-repeat;background-size: 100% 100%;">
                                        <div class="lwnum" style="width: calc( 100% - 140px );">
                                            <%#Eval("sname") %>
                                        </div>
                                        <div class="lwbt center">
                                            了解更多
                                            <img src="img/icon3.png" />
                                        </div>
                                    </div>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="swiper-scrollbar">
            </div>
        </div>
        <div class="pf loadlist center">
            <img src="img/load.gif" />
            <div>
                开始加载...</div>
        </div>
    </div>
    <script type="text/javascript">
			$(function() {

				var worknav = new Swiper('.worknav', {
					slidesPerView: 'auto'
				});

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
					setTimeout(function() {
						sbody.update()
					}, 500)
				}
				
				$(".worknav .swiper-slide").click(function(){
					var type=$(this).data().type
					$(".worknav .swiper-slide").removeClass("on")
					$(this).addClass("on")
					worknav.slideToLoop(type, 1000, false);//切换到第一个slide，速度为1秒
				})

			})
    </script>

     <script src="fx.js?v=1" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('http://jjsv.atline.cn/iCataract_line/videoList.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛")
   </script>
</body>
</html>
