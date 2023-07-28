<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoDetailList.aspx.cs" Inherits="videoDetailList" %>

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
				height: calc(100% - 57px);
			}

			#body .swiper-slide {
				height: auto;
			}

			.worknav .swiper-slide {
				width: 80px;
			}

			.worknav .swiper-slide.on {
				color: #DF2019;
				font-size: 16px;
			}

			.worknav .swiper-slide.on span {
				display: block;
				background: #DF2019;
				width: 50px;
				height: 3px;
				bottom: 0px;
				border-radius:5px;
				position: absolute;
				left: 15px;
			}
			.lwbh{ z-index: 1000000;}
			.ccH5PlayBtn{-webkit-transform:scale(0.5);}
			.ctitle{width: calc(100% - 40px);    padding: 15px 20px; font-size: 18px;}
			.lwshow {width: 90%; height: auto; padding: 2.5% 5%;}
			.lwtt {
    width: 45%;
    height: 70px; ;
}
.lwbh {
    width: 90px;
    height: 18px;
    position: absolute;
    top: 8px;
    left: 47%; font-size: 14px;
    background: none; color: #333;
}
.lwbt1{ font-size: 14px; padding:3px 5px ; font-size: 16px; color: #fff; background: red;} 
.lwbt1 {
    font-size: 14px;
    padding: 2px 5px;
    font-size: 12px;
    color: #fff;
    background: red;
    position: absolute;
    left: 30px;
    position: absolute;
    top: 56px;
    left: 48.5%;
    border-radius: 3px;
}
		</style>
	</head>

	<body>
		<div id="overflow_hidden" class="pf whtl0" style="bottom: 0px;">
			<!--<div class="sx bfff pf center" style="z-index: 3; padding: 15px 20px; width: calc(100% - 40px);">
				<select name="" style="width: 100%; padding: 10px 10px;" id="stArea" >
					<option value="0">请选择区域</option>
                    <%=areaInfo %>
				</select>
			</div>-->
			<div class="ctitle">
				<%=sName %>作品
			</div>
			<div class="swiper-container" id="body">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						
						
						<div class="lwmain">
                           <asp:Repeater ID="rptData" runat="server">
                            <ItemTemplate>
							<div class="lwshow fl" onclick="window.location.href='videoDetail.aspx?id=<%#Eval("Id") %>'">
								<div class="lwbh">
									编号：<%#GetCode(Eval("Id").ToString(),Eval("code").ToString()) %>
								</div>
								<div class="lwbt1" style="background: #DF2019;">
									查看作品
								</div>
								<div class="lwtt center ovh pr" style="border-radius: 5px;">
								    <video id="player-container-id_<%#Eval("Id") %>" class="video" d="<%#Eval("Id") %>" t="<%#Eval("videoId") %>" preload="auto" width="600px" height="400px" playsinline webkit-playinline x5-playinline></video>
									<div class="spzd pa whtl0" style=" z-index: 100000;"></div>
								</div>
								<div class="ovh dn" style="padding: 6px 10px;">
									<div class="fl list_wb_i1 center" style="margin-left: 0px;"><i></i>
										<div class="w5"></div><%#Eval("clickNum") %>
									</div>
									<div class="fr list_wb_i2 center" style="margin-right: 0px;"><i></i>
										<div class="w5"></div><%#Eval("dNum") %>
									</div>
								</div>
							</div>
						 </ItemTemplate>
                        </asp:Repeater>

							<div style="clear:both;"></div>
						</div>
						<div style="height: 70px;"></div>
					</div>
				</div>
				<div class="swiper-scrollbar"></div>
			</div>
			<div class="pf loadlist center">
				<img src="img/load.gif" />
				<div>开始加载...</div>
			</div>
		</div>

		<script type="text/javascript">

            function loadVideo()
            {
               jQuery.getScript("//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.min.js")
                 .done(function() {
                       
                           var videoList=$(".video");
                     
                            for (var i = 0; i < videoList.length; i++) {
                                  try{
                                 var player = TCPlayer("player-container-id_"+$(videoList[i]).attr("d"), { // player-container-id 为播放器容器ID，必须与html中一致  
                                      fileID: $(videoList[i]).attr("t"), // 请传入需要播放的视频filID 必须  
                                      appID: "1400251075", // 请传入点播账号的appID 必须  
                                      autoplay: false //是否自动播放  
                                                       //其他参数请在开发文档中查看  
                                 }); 
                                 }catch(e){}
                            }
                      
                        


                 })
                 .fail(function() {
                  
                });
                
            }

          

			$(function() {

				var isload=true

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
							console.log(isload)
							if(isload){
								if (sbody.isEnd) {
								if (staY - sbody.translate > 30) {
									
									isload=false
										loadpage()
								}
							}	
									}
							
						},
					}
				});

                

                var pageIndex=1;


                
				function loadpage() {
                    var stArea='<%=tid %>';
                    //sbody.allowTouchMove = false; //禁止触摸
					$(".loadlist").attr("style", "bottom: 25px;");
                     $.ajax({
                                type: "POST",
                                url: 'getInfo.aspx',
                                async: false,
                                data: { "stArea": stArea, "pageIndex": pageIndex },
                                beforeSend: function (xmlHttpRequest) {

                                },
                                success: function (data, textStatus) {
                                     var temp=data.split('|||');
                                    if (temp[0].length>0) {
                                      
                                       setTimeout(function() {
						                    //sbody.params.virtualTranslate = true; //定住不给回弹
						                    $(".loadlist").attr("style", "");
                                            if(pageIndex==0)
                                               $(".lwmain").html(temp[0]);
                                            else
                                              $(".lwmain").append(temp[0]);
                                            pageIndex=parseInt(temp[1]);
						                    //for (var i = 0; i < 10; i++) {
							                    //$(".list").append(html);
						                    //}
                                            loadVideo();
						                    sbody.params.virtualTranslate = false;
						                    sbody.allowTouchMove = true;
						                    sbody.update()
											isload=true
					                    }, 1000)
                                    }
                                    else
                                    {
                                       
                                         setTimeout(function() {
						                    sbody.params.virtualTranslate = true; //定住不给回弹
						                    $(".loadlist").attr("style", "");
                                            if(pageIndex==0)
                                               $(".lwmain").html("暂无数据");
                                            
                                        
						                    sbody.params.virtualTranslate = false;
						                    sbody.allowTouchMove = true;
						                    sbody.update()
											
					                    }, 1000)
                                    }

                                },
                                complete: function (xmlHttpRequest, textStatus) {
                                },
                                error: function () {
                                }
                         });

				
					
				}

                   $("#stArea").change(function(){
                          pageIndex=0;
                          loadpage();
                    });

				window.onpageshow = function(event) {
					setTimeout(function() {
						sbody.update()
					}, 100)
					setTimeout(function() {
						sbody.update()
					}, 500)
				}

				$(".worknav .swiper-slide").click(function() {
					var type = $(this).data().type
					$(".worknav .swiper-slide").removeClass("on")
					$(this).addClass("on")
					worknav.slideToLoop(type, 1000, false); //切换到第一个slide，速度为1秒
				})


			
			})

		
            loadVideo();
        </script>

         <script src="fx.js?v=1" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('http://jjsv.atline.cn/iCataract_line/videoDetailList.aspx?tid=<%=tid %>', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛")
   </script>
	</body>

</html>
