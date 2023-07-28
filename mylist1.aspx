<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mylist.aspx.cs" Inherits="mylist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
		<title>参赛作品</title>
		<link rel="stylesheet" type="text/css" href="style/style.css" />
        <link rel="stylesheet" type="text/css" href="style/swiper.min.css" />
        <script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
    	<script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <style type="text/css">
            #body,#bodys {
                width: 100%;
                height: 100%;
            }

                #body .swiper-slide {
                    height: auto;
                }
        </style>
		
		
		<link href="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.css" rel="stylesheet">
		<!-- 如需在IE8、9浏览器中初始化播放器，浏览器需支持Flash并在页面中引入 -->  
		<!--[if lt IE 9]>  
		<script src="//imgcache.qq.com/open/qcloud/video/tcplayer/ie8/videojs-ie8.js"></script>  
		<![endif]-->  
		<!-- 如果需要在 Chrome Firefox 等现代浏览器中通过H5播放hls，需要引入 hls.js -->  
		<script src="//imgcache.qq.com/open/qcloud/video/tcplayer/lib/hls.min.0.8.8.js"></script>  
		<!-- 引入播放器 js 文件 -->  
		<script src="//imgcache.qq.com/open/qcloud/video/tcplayer/tcplayer.min.js"></script> 

		<link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_3184295_xqqq1kimvqe.css"/>

	</head>

	<body>
		<div id="overflow_hidden" class="pf whtl0">
            <div style="padding: 20px 20px 5px 20px; font-size: 16px; font-weight: bold;">参赛作品</div>

            <div class="swiper-container" id="body" style="height: calc(100% - 64px);">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <ul id="" class="mylist">
                          <asp:Repeater ID="rptData" runat="server">
                            <ItemTemplate>
                        	<li>
								<div class="center">
									<div class="scorlistimg center pr" style="background: url(img/jx1.png) center no-repeat; background-size:cover ;">
										 <video id="player-container-id_<%#Eval("Id") %>" class="video" d="<%#Eval("Id") %>" t="<%#Eval("videoId") %>" preload="auto" width="600px" height="400px" playsinline webkit-playinline x5-playinline></video>
										<div class="spzd pa whtl0" style=" z-index: 100000;"></div>
									</div>
									<div style="margin-left: 10px; width: calc(100% - 155px);">
										<div class="f12" style="color: #959595;">
											作品编号：<%#GetCode(Eval("Id").ToString(),Eval("code").ToString()) %><br />
											上传时间：<%#General.Utils.ToDateTime(Eval("createDate")).ToString("yyyy年MM月dd日") %><br />
                                            邮件验证码：<b style="color:Red;"><%#Eval("moreCol1") %></b>
										</div>
										<div class="center" style=" margin-top: 5px; width: 83px; background: #de1f26; color: #fff; height: 28px; border-radius: 5px; ">
											审核进度
										</div>
									</div>
								</div>
								<div class="shjd f12 dn">
									<div class="h10"></div>
									<div class="h10"></div>
									<div class="center">
										<div class="">
											<div class="center iconfont icon-shenhezhong m0aoto <%#Eval("state").ToString()=="0"?"on":"" %> <%#Eval("state").ToString()=="1"?"on":"" %>" style="font-size: 43px; height: 50px; "></div>
											<div class="tec" style="color: #213446;">审核中</div>
										</div>
										<div class="" style=" margin: 0px 50px;">
											<div class="center iconfont icon-duihao2 m0aoto <%#Eval("state").ToString()=="4"?"on":"" %>" style="font-size: 43px; height: 50px; "></div>
											<div class="tec" style="color: #213446;">审核通过</div>
										</div>
										<div class="">
											<div class="center iconfont icon-guanbi2fill m0aoto <%#Eval("state").ToString()=="2"?"on":"" %>" style="font-size: 43px; height: 50px; "></div>
											<div class="tec" style="color: #213446;">驳回</div>
										</div>
									</div>
									<div class="h10"></div>
									<div class="" style="color: #959595; <%#Eval("state").ToString()=="2"?"":"display:none" %>">
                                        驳回说明：<br />
                                        <%#GetDescriptInfo(Eval("reason").ToString()) %>
                                       <%-- <br />抱歉，您的视频未通过审核，请凭邮件验证码登录后台，根据规范调整并重新提交。
                                        <br />抱歉，您的个人信息未通过审核，请凭邮件验证码登录后台，根据规范调整并重新提交。
                                        <br />抱歉，您的病例幻灯片未通过审核，请凭邮件验证码登录后台，根据规范调整并重新提交。--%>
									</div>
								</div>
							</li>
                             </ItemTemplate>
                        </asp:Repeater>
                        </ul>
                        <div style="text-align: center; font-size: 26px; color: #b6b6b6; margin-top: 50px; <%=countNum==0?"":"display:none;"%>">暂无参赛作品</div>
                    </div>
                </div>
                <div class="swiper-scrollbar"></div>
            </div>


        <script>
//			function loadVideo()
//			  {
//			      var videoList=$(".video");
//			      for (var i = 0; i < videoList.length; i++) {
//			         
//			           var player = TCPlayer("player-container-id_"+$(videoList[i]).attr("d"), { // player-container-id 为播放器容器ID，必须与html中一致  
//			                fileID: $(videoList[i]).attr("t"), // 请传入需要播放的视频filID 必须  
//			                appID: "1400251075", // 请传入点播账号的appID 必须  
//			                autoplay: false //是否自动播放  
//			                                 //其他参数请在开发文档中查看  
//			           }); 
//			      }
//			  }
//			  loadVideo()

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
		 loadVideo()
		
            var body = new Swiper('#body', {
			    direction: 'vertical',
			    slidesPerView: 'auto',
			    freeMode: true,
			    scrollbar: {
			        el: '#body .swiper-scrollbar',
			    },
			    mousewheel: true,
			});
			
			
			$(".mylist li").click(function(){
				$(".mylist li .shjd").addClass("dn")
				
				if($(this).find(".shjd").hasClass("dn")){
					$(this).find(".shjd").removeClass("dn")
				}
			})
        </script>
     <script src="fx.js?v=2" type="text/javascript"></script>
    <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead="http://jjsv.atline.cn/iCataract_line/img/share.jpg"; %>
    <script type="text/javascript">
        loadfx('http://jjsv.atline.cn/iCataract_line/mylist.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2022年度强生眼力健白内障手术达人赛")
    </script>
	</body>

</html>
