<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoDetail.aspx.cs" Inherits="videoDetail" %>

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
         <link href="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.css" rel="stylesheet">  
         <!-- 如需在IE8、9浏览器中初始化播放器，浏览器需支持Flash并在页面中引入 -->  
         <!--[if lt IE 9]>  
         <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/ie8/videojs-ie8.js"></script>  
         <![endif]-->  
         <!-- 如果需要在 Chrome Firefox 等现代浏览器中通过H5播放hls，需要引入 hls.js -->  
         <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/lib/hls.min.0.8.8.js"></script>  
         <!-- 引入播放器 js 文件 -->  
         <script src="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.min.js"></script> 
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
           <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#body {
				width: 100%;
				height: 100%;
			}

			#body .swiper-slide {
				height: auto;
			}
.video-js .vjs-tech{    position: relative;}
  img{max-width:100%;}
		</style>
	</head>

	<body>
		<div id="overflow_hidden" class="pf whtl0">
			<div class="swiper-container" id="body">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div>
                         <video style="width: 100%;height: auto;" id="player-container-id"  preload="auto" playsinline webkit-playinline x5-playinline></video>
                         <script type="text/javascript">
                             var player = TCPlayer("player-container-id", { // player-container-id 为播放器容器ID，必须与html中一致  
                                 fileID: "<%=videoId %>", // 请传入需要播放的视频filID 必须  
                                 appID: "1400251075", // 请传入点播账号的appID 必须  
                                 autoplay: false //是否自动播放  
                                 //其他参数请在开发文档中查看  
                             }); 
                          </script>
                        </div>
						<div class="p1220">
							<div class="h5"></div>
							<div class="h10"></div>
							<div class="bfff bor5 p1220 f16 pr">
								<div class="pa qybg center">
									<div class="h100 ovh" >
										<div class="fl" style="width: calc(100% + 10px);"><%=areaInfo %></div>
									</div>
									<img height="24px" src="img/qybg.png" >
								</div>
								<div class="h5"></div>
								<div class="ovh">
									<div class="fl">作品编号：<%=codeInfo %></div>
									<!--<div class="ovh fr" style="margin-top: 2px;">
										<div class="fl list_wb_i1 center" style="margin-left: 0px;"><i></i><div class="w5"></div><%=clickNum %></div>
										<div class="fl list_wb_i2 center <%=isDZ>0?"on":"" %>" style="margin-right: 0px;"><i></i><div class="w5"></div><span id="dzNum"><%=dNum %></span></div>
									</div>-->
								</div>
								
								<div class="h5"></div>
							</div>
							<div class="h10"></div>
                            <div class="h10"></div>
                            <div class="bfff bor5 p1220 f16 pr">
								<div class="pa qybg center">
									<div class="h100 ovh" >
										<div class="fl" style="width: calc(100% + 10px);">病例</div>
									</div>
									<img height="24px" src="img/qybg.png" >
								</div>
								<div class="h5"></div>
								<div class="ovh " id="loadImg">
									<!--<%=pptContent %>-->

                                    <div class="" style="overflow-x: auto; margin-top: 20px;">
							            <div class="center bl">
								
										            
							            </div>
						            </div>

                                    <section style="margin-top: 10px;margin-right: 0%; margin-left: 0%; box-sizing: border-box;" powered-by="xiumi.us"><section style="text-align: center;font-size: 12px;color: rgb(102, 102, 102);box-sizing: border-box;"><p style="box-sizing: border-box;" class="xzhd">滑动查看更多</p></section></section>
								</div>
								
								<div class="h5"></div>
							</div>
							<div class="h10"></div>
							<div class="bfff p1220 bor5500 o85">
								作品描述
							</div>
							<div class="h1"></div>
							<div class="bfff p1220 bor0055">
								<%=descriptInfo %>
							</div>
							<div class="h10"></div>
							<!--<div class="center">
								<div class="deradianzan cfff f16 center pr">
									<div class="icon2 dianzan"></div>
									点赞
									<div class="pa jiayi dn">+1</div>
								</div>
							</div>-->
							<div class="h20"></div>
							
						</div>
					</div>
				</div>
				<div class="swiper-scrollbar"></div>
			</div>
			<div class="pf qzpf center" style="display:none;">
				<div class="icon2"></div>
			</div>
		</div>

		<script type="text/javascript">
			$(function() {

                 var blArr=[<%=imgsSrc %>]
                if(blArr.length<2){
                    $(".xzhd").html("")
                }
                for(var i=0;i<blArr.length;i++){
                    $(".bl").css({"width":blArr.length+"00%"})
                    $(".bl").append('<div class="center" style="width: '+(100/blArr.length)+'%;"><img style="width:100%;" src="'+blArr[i]+'"></div>')
                }

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
				
				var toutime;
				var istouch = false
				
				$('.qzpf').on('touchstart', function(e) {
					var _touch = e.originalEvent.targetTouches[0];
					istouch = true
				});
				
				$(window).on('touchmove', function(e) {
					var _touch = e.originalEvent.targetTouches[0];
					if(istouch) {
						var _y=_touch.pageY
						if(_y<280){
							_y=280
						}
						qzpfupdate(_touch.pageX, _y, 1)
					}
				});
				
				$(window).on('touchend', function(e) {
					var _touch = e.originalEvent.changedTouches[0];
					
					if(istouch) {
						var _y=_touch.pageY
						if(_y<280){
							_y=280
						}
						qzpfupdate(_touch.pageX, _y, 0)
					}
					istouch = false
				});
				
				function qzpfupdate(u, p, e) {
					$('.qzpf').css({
						"top": (p - 28) + "px",
						"left": (u - 28) + "px"
					})
					$('.qzpf').removeClass("partialleft partialright")
				
					if(u - 28 > $(window).width() / 2) {
						$('.qzpf').addClass("partialright")
					} else {
						$('.qzpf').addClass("partialleft")
					}
					if(e == 1) {
						$('.qzpf').removeClass("tran300")
					} else {
				
						$('.qzpf').addClass("tran300")
						if(u - 28 > $(window).width() / 2) {
							$('.qzpf').css("left", "calc(100% - 45px)")
						} else {
							$('.qzpf').css("left", "5px")
						}
					}
				}
				
				var isdianzan=false
				$(".deradianzan").click(function(){
					if(!isdianzan){
                         $.ajax({
                                type: "POST",
                                url: 'setDzInfo.aspx',
                                async: false,
                                data: {"infoId": <%=id %> },
                                beforeSend: function (xmlHttpRequest) {

                                },
                                success: function (data, textStatus) {
                       
                                    if (data == "1") {
                                      	isdianzan=true
						                $(".jiayi").show()
						                setTimeout(function(){
							                alert("点赞成功！")
						                },1500)
                                        var n=$("#dzNum").html();
                                        
                                        $("#dzNum").html(parseInt(n)+parseInt(1));
                                        $(".list_wb_i2").addClass("on");
                                    }
                                    else if(data=="-1"||data=="2")
                                    {
                                      alert("非法请求！")
                                    }
                                    else if(data=="3")
                                    {
                                    	alert("您已点赞,无法重复点赞！")
                                    }
                                },
                                complete: function (xmlHttpRequest, textStatus) {
                                },
                                error: function () {
                                }
                       });
					

					}
				})
			})
		</script>

           <script src="fx.js?v=2" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('http://jjsv.atline.cn/iCataract_line/videoDetail.aspx?id=<%=id %>', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛")
   </script>
	</body>

</html>

