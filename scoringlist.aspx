<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scoringlist.aspx.cs" Inherits="scoringlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="style/style.css?v" />
		<link rel="stylesheet" type="text/css" href="style/swiper.min.css" />
		<script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>
         <link href="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.css" rel="stylesheet">  
         <!-- 如需在IE8、9浏览器中初始化播放器，浏览器需支持Flash并在页面中引入 -->  
         <!--[if lt IE 9]>  
         <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/ie8/videojs-ie8.js"></script>  
         <![endif]-->  
         <!-- 如果需要在 Chrome Firefox 等现代浏览器中通过H5播放hls，需要引入 hls.js -->  
         <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/lib/hls.min.0.8.8.js"></script>  
         <!-- 引入播放器 js 文件 -->  
         <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.min.js"></script> 
            <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	    <script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<style type="text/css">
			#body {
				width: 100%;
				top: 100px;
				bottom: 0px;
				left: 0px;
				right: 0px;
			}

			#body .swiper-slide {
				height: auto;
			}
			.ccH5PlayBtn{-webkit-transform:scale(0.5);}
		</style>
	</head>

	<body>
		<div id="overflow_hidden" class="pf whtl0">
			<div class="p1220">
							<div class="scorlisttop ovh">
								<div class="ovh">
									<div class="fl scorlisttopgz cp">打分规则</div>
									<div class="fr scorlisttopbut cp" onclick="login_out()">退出</div>
									<div class="fr scorlisttopname"><%=trueName %> 全国评委老师，欢迎您</div>
								</div>
								<div class="h10"></div>
								<div class="center">
									<div class="scorlisttopwb">我的点评</div>
									<div class="scorlisttopjd">
										<span style="width: <%=(yNum*9)>=99?100:((yNum*9)) %>%;"></span>
									</div>
									<div class="scorlisttopjdwb"><%=yNum %>/10</div>
									<a href="userScoringlist.aspx" class="scorlisttopck center">查看</a>
								</div>
								<div class="h5"></div>
							</div>
			</div>
			<div class="swiper-container" id="body" style="position: absolute;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="p1220">
							<div class="scorlisttitle"><%=areaInfo %>参赛作品</div>
							<div class="h10"></div>
							<div class="scorlist">
                            <asp:Repeater ID="rptData" runat="server">
                            <ItemTemplate>
								<a href="scoring.aspx?id=<%#Eval("Id") %>" class="ovh <%#General.Utils.ToInt(Eval("IsPingCount"))>=4?"on":"" %> <%#General.Utils.ToInt(Eval("IsPing"))>0?"on":"" %>">
									<div class="scorlistimg center fl pr">
										<video id="player-container-id_<%#Eval("Id") %>" class="video" d="<%#Eval("Id") %>" t="<%#Eval("videoId") %>" preload="auto" width="600px" height="400px" playsinline webkit-playinline x5-playinline></video>
										<div class="spzd pa whtl0" style=" z-index: 100000;"></div>
									</div>
									<div class="scorlistwb fr">
										<div class="scorlistwbbh"><div>作品编号：<span><%#GetCode(Eval("Id").ToString(),Eval("code").ToString()) %></span></div><div>已评人数：<%#Eval("IsPingCount") %>/4</div></div>
                                        
										<div class="scorlistwbzt center"><%#GetFontInfo(General.Utils.ToInt(Eval("IsPingCount")),General.Utils.ToInt(Eval("IsPing"))) %></div>
									</div>
								</a>
						   </ItemTemplate>
                           </asp:Repeater>
                            <h1 <%=tishi==""?"style='display:none;'":"style='padding:100px 0px;'" %> class="center"><%=tishi %></h1>
							</div>
							<div class="h20"></div>
							<div class="center butsign f16 cp">查看其他区域参赛作品</div>
							<div class="h10"></div>
						</div>
					</div>
				</div>
				<div class="swiper-scrollbar"></div>
			</div>
			<div class="pf loadlist center">
				<img src="img/load.gif" />
				<div>开始加载...</div>
			</div>
			
			 <div class="tk dn" id="gz">
        	<!--<div class="center gzgb cp" style=" position: absolute; top: 20px; right: 20px; width: 35px; height: 35px;background: #fff; border-radius: 100px;font-size: 18px;">X</div>-->
        	<div class=" h100" style="overflow-y: auto;">
        		<div style="">
        			<div class="" style="height: 50px;"></div>
        			<div class="pr" style=" max-width: 80%; margin: 0px auto;">
	        			<img width="100%" src="img/gz.png?s1"/>
	        			<div class="gzgb pa cp" style="width: 100%; height: 85px; z-index: 3; bottom: 0px; left: 0px;"></div>
	        		</div>
	        		<div class="" style="height: 50px;"></div>
        		</div>
        	</div>
        </div>
		</div>

		<script type="text/javascript">

			$(".scorlisttopgz").click(function(){
    		$("#gz").show()
    	})
    	
    	$(".gzgb").click(function(){
    		$("#gz").hide()
    	})

         function login_out()
         {
           $.ajax({
		            type: "POST",
		            url: 'login_out.aspx',
		            async: false,
		            data: { },
		            beforeSend: function (xmlHttpRequest) {
		            },
		            success: function (data, textStatus) {
                  
		                window.location.href = "teacher_login.aspx";
		            },
		            complete: function (xmlHttpRequest, textStatus) {
		            },
		            error: function () {
		            }
		     });
         }

          function loadVideo()
            {
                var videoList=$(".video");
                
                for (var i = 0; i < videoList.length; i++) {
                   
                     var player = TCPlayer("player-container-id_"+$(videoList[i]).attr("d"), { // player-container-id 为播放器容器ID，必须与html中一致  
                          fileID: $(videoList[i]).attr("t"), // 请传入需要播放的视频filID 必须  
                          appID: "1400251075", // 请传入点播账号的appID 必须  
                          autoplay: false //是否自动播放  
                                           //其他参数请在开发文档中查看  
                     }); 
                }
            }
            loadVideo()
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
			
			$(".butsign").click(function(){
				window.location.href="teacher_videoList.aspx"
			})
		</script>
         <script src="fx.js?v=1" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('http://jjsv.atline.cn/iCataract_line/scoringlist.aspx?tid=<%=tid %>', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛")
   </script>
	</body>

</html>