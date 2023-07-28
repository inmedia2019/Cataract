<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher_videoList.aspx.cs" Inherits="teacher_videoList" %>

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
        #body {
				width: 100%;
				top: 100px;
				bottom: 0px;
				left: 0px;
				right: 0px;
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
        .wei{background: rgba(223,32,25,1);
    padding: 2px 5px;
    font-size: 13px;
    text-align: center;
    position: absolute;
    border-radius: 5px;
    left: -10px;
    top: -10px;}
    .lwlist{ overflow: initial;     margin-bottom: 00px; margin-top: 15px;}
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
        <div class="swiper-container" id="body" style="position:absolute;">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="lwmain">
                      
                        <asp:Repeater ID="rptData" runat="server">
                            <ItemTemplate>
                                <a href="scoringlist.aspx?tid=<%#Eval("Id") %>" >
                                	
                                    <div class="lwlist center <%#areaId.IndexOf(Eval("Id").ToString()+",")<0?"off":"" %> <%#GetStyles(Eval("Id").ToString())==0?"off":"" %>" style="background: url(<%#areaId.IndexOf(Eval("Id").ToString()+",")<0?Eval("tname").ToString():Eval("moreCol1").ToString() %>) no-repeat;background-size: 100% 100%;">
                                        <div class="wei" style="display: none;">
                                		未打分：<%#GetUnScore(Eval("Id").ToString()) %>
                                	</div>
                                        <div class="lwnum" style="width: calc( 100% - 140px );">
                                            <%#Eval("sname") %>
                                        </div>
                                        <div class="lwbt center">
                                            <%#GetStyles(Eval("Id").ToString())==0?"已评满":"了解更多" %>
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
    	
    	
             var areaId=<%=areaId %>;
             function validateInfo(y)
             {
                if(areaId.indexOf(y+",")<0)
                {
                   alert_Tips("评委只能给自己所属赛区评分！", "", 2000)
                   return false;
                }
                return true;
             }

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
       loadfx('http://jjsv.atline.cn/iCataract_line/teacher_videoList.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生眼力健白内障手术达人赛")
   </script>
</body>
</html>
