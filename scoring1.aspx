<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scoring.aspx.cs" Inherits="scoring" %>

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
              <script src="js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	    <script src="js/wechatJSSDK.js" type="text/javascript" charset="utf-8"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<style type="text/css">
			#body {
				width: 100%;
				top: 0px;
				left: 0px;
				right: 0px;
				bottom: 0px;
			}

			#body .swiper-slide {
				height: auto;
			}
			

            .tcp-skin.player-container-id-dimensions {
                width: 100%;
            }
            
            img{max-width:100%;}
		</style>
	</head>

	<body>
		<div id="overflow_hidden" class="pf whtl0">
			<video id="player-container-id"  preload="auto" width="100%"  playsinline webkit-playinline x5-playinline></video>
                         <script type="text/javascript">
                             var player = TCPlayer("player-container-id", { // player-container-id 为播放器容器ID，必须与html中一致  
                                 fileID: "<%=videoId %>", // 请传入需要播放的视频filID 必须  
                                 appID: "1400251075", // 请传入点播账号的appID 必须  
                                 autoplay: false //是否自动播放  
                                 //其他参数请在开发文档中查看  
                             }); 
                                   </script>
			<div class="swiper-container" id="body" style="position: absolute;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						
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
								<div>作品编号：<%=codeInfo %></div>
                              
								<div class="h5"></div>
							</div>
							<div class="h10"></div>
                            <div class="h10"></div>
                              <div class="bfff bor5 p1220 f16 pr">
								<div class="pa qybg center">
									<div class="h100 ovh" >
										<div class="fl" style="width: calc(100% + 10px);">参赛医生临床经验</div>
									</div>
									<img height="24px" src="img/qybg.png" >
								</div>
								<div class="h5"></div>
								<div class="ovh">
									<%=yearInfo %>
								</div>
								
								<div class="h5"></div>
							</div>
							<div class="h10"></div>
                            <div class="bfff bor5 p1220 f16 pr">
								<div class="pa qybg center">
									<div class="h100 ovh" >
										<div class="fl" style="width: calc(100% + 10px);">病例</div>
									</div>
									<img height="24px" src="img/qybg.png" >
								</div>
								<div class="h5"></div>
								<div class="ovh" id="loadImg">
									<%=pptContent %>
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
							<div class="h10" <%=counts1>=11?"style='display:none;'":"" %>></div>
							<div class="bfff p1220 bor5500 o85" <%=counts1>=11?"style='display:none;'":"" %>>
								作品评分
							</div>
							<div class="h1" <%=counts1>=11?"style='display:none;'":"" %>></div>
							<div class="bfff p1220 bor0055" <%=counts1>=11?"style='display:none;'":"" %>>
								<div class="center">
									<div style="width: calc(100% - 80px);">手术难度(满分30)</div>
									<div class="center pr ninput on" style="width: 80px;">
										<input type="tel" id="in1" class="tec" value="<%=in1 %>" maxlength="2" placeholder="输入评分">
									</div>
								</div>
								<div class="h10"></div>
								<div class="center">
									<div style="width: calc(100% - 80px);">诊疗思路及手术方式选择的合理性(满分20)</div>
									<div class="center pr ninput on" style="width: 80px;">
										<input type="tel" id="in2" class="tec" value="<%=in2 %>" maxlength="2" placeholder="输入评分">
									</div>
								</div>
								<div class="h10"></div>
								<div class="center">
									<div style="width: calc(100% - 80px);">手术操作规范性(满分20)</div>
									<div class="center pr ninput on" style="width: 80px;">
										<input type="tel" id="in3" class="tec" value="<%=in3 %>" maxlength="2" placeholder="输入评分">
									</div>
								</div>
								<div class="h10"></div>
								<div class="center">
									<div style="width: calc(100% - 80px);">病史资料完整、清晰(满分15)</div>
									<div class="center pr ninput on" style="width: 80px;">
										<input type="tel" id="in4" class="tec" value="<%=in4 %>" maxlength="2" placeholder="输入评分">
									</div>
								</div>
								<div class="h10"></div>
								<div class="center">
									<div style="width: calc(100% - 80px);">手术视频清晰度、剪辑是否得当(满分15)</div>
									<div class="center pr ninput on" style="width: 80px;">
										<input type="tel" id="in5" class="tec" value="<%=in5 %>" maxlength="2" placeholder="输入评分">
									</div>
								</div>
                                <div class="h10"></div>
								<div class="ter" style="text-align: right; font-size: 20px;">
									总分:<span id="spScore"><%=sumScore %></span>分
								</div>
								<div class="h10"></div>
								 <div class="center pr ninput on" style="width: 100%;">
									<textarea rows="" id="py" cols="" placeholder="专家评语..." ><%=py %></textarea>
								</div> 
							</div>
							<div class="h10" <%=counts1>=11?"style='display:none;'":"" %>></div>
							<div class="center butsign f16" <%=counts1>=11?"style='display:none;'":"" %>>提交</div>
							<div class="h10"></div>
						</div>
					</div>
				</div>
				<div class="swiper-scrollbar"></div>
			</div>
		</div>

		<script type="text/javascript">
           var isSelf='<%=isSelf %>';
            function backTo()
            {
                  var n='<%=N %>';
                  if(n==1)
                    window.location.href="userScoringlist.aspx";
                  else
                    window.location.href="scoringlist.aspx?tid=<%=tid %>";
            }
            
            
			
	        var winw=$("#overflow_hidden").width()
	        var winh=$("#overflow_hidden").height()
	        var bi=375/212;
	        var viheight=winw/bi-4;
	        
	        $(".tcp-skin").css("height",viheight+"px")
	        
	        $("#body").css("top",viheight+"px")
            
            
            
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
									loadpage()
								}
							}
						},
					}
				});

				function loadpage() {
					sbody.update()
//					sbody.allowTouchMove = false; //禁止触摸
//					$(".loadlist").attr("style", "bottom: 25px;");
//					setTimeout(function() {
//						sbody.params.virtualTranslate = true; //定住不给回弹
//						$(".loadlist").attr("style", "");
//						for (var i = 0; i < 10; i++) {
//							//$(".list").append(html);
//						}
//						sbody.params.virtualTranslate = false;
//						sbody.allowTouchMove = true;
//						sbody.update()
//					}, 1000)
				}

				window.onpageshow = function(event) {
					setTimeout(function() {
						sbody.update()
					}, 100)
					setTimeout(function() {
						sbody.update()
					}, 500)
				}

               
				
				$(".butsign").click(function() {
                    
                    if(isSelf==1)
                    {
                        //alert_Tips("评委不能给自己所属赛区评分！", "", 2000)
                        alert("评委不能给自己所属赛区评分！")
                        return false;
                    }

					var in1=$.trim($("#in1").val());
                    var in2=$.trim($("#in2").val());
                    var in3=$.trim($("#in3").val());
                    var in4=$.trim($("#in4").val());
                    var in5=$.trim($("#in5").val());

                    if(in1=="")
                    {
                      alert("请对手术难度进行打分！")
				      return false;
                    }

                    if(in2=="")
                    {
                      alert("请对诊疗思路及手术方式选择的合理性进行打分！")
				      return false;
                    }

                    if(in3=="")
                    {
                      alert("请对手术操作规范性进行打分！")
				      return false;
                    }

                    if(in4=="")
                    {
                      alert("请对病史资料完整、清晰进行打分！")
				      return false;
                    }

                    if(in5=="")
                    {
                      alert("请对手术视频清晰度、剪辑是否得当进行打分！")
				      return false;
                    }

                    if(parseInt(in1)>30)
                    {
                      //alert_Tips("手术难度最多可打30分！", "", 1500)
                      alert("手术难度最多可打30分！")
				      return false;
                    }

                    if(parseInt(in2)>20)
                    {
                     	//alert_Tips(, "", 1500)
                     	alert("诊疗思路及手术方式选择的合理性最多可打20分！")
				    	return false;
                    }

                    if(parseInt(in3)>20)
                    {
                       //alert_Tips(, "", 1500)
                       alert("手术操作规范性最多可打20分！")
				       return false;
                    }

                    if(parseInt(in4)>15)
                    {
                       //alert_Tips(, "", 1500)
                       alert("病史资料完整、清晰最多可打15分！")
				       return false;
                    }

                    if(parseInt(in5)>15)
                    {
                       //alert_Tips(, "", 1500)
                       alert("手术视频清晰度、剪辑是否得当最多可打15分！")
				       return false;
                    }

                    var py=$.trim($("#py").val());
                    if(py=="")
                    {
                       //alert_Tips(, "", 1500)
                       alert("请填写评语！")
				       return false;
                    }

			
                     $.ajax({
                                type: "POST",
                                url: 'setScoreInfo.aspx',
                                async: false,
                                data: {"in1": in1,"in2":in2,"in3":in3,"in4":in4,"in5":in5,"infoId":<%=id %>,"py":py },
                                beforeSend: function (xmlHttpRequest) {

                                },
                                success: function (data, textStatus) {
                      
                                    if (data == "1") {
                                       //alert_Tips(, "backTo", 2000)
                                       alert("提交成功！")
			backTo()
                                    }
                                    else if(data=="2")
                                    {
                                       //alert_Tips(, "", 2000)
                                       alert("非法用户！")
                                    }
                                    else if(data=="3")
                                    {
                                       //alert_Tips(, "", 2000)
                                       alert("该视频已评满,无法继续评分！")
                                    }
                                    else if(data=="4")
                                    {
                                       //alert_Tips(, "backTo", 2000)
                                       alert("修改评分成功！")
			backTo()
                                    }
                                    else if(data=="5")
                                    {
                                       //alert_Tips(, "", 2000)
                                       alert("您评分的视频已经超过11个,无法继续评分！")
                                    }
                                    else if(data=="6")
                                    {
                                       //alert_Tips(, "", 2000)
                                       alert("恭喜专家完成网络初赛评分！")
                                       window.location.href="userScoringlist.aspx";
                                    }
                                    
                                },
                                complete: function (xmlHttpRequest, textStatus) {
                                },
                                error: function () {
                                }
                       });

					
				})
                
               

                $("#py").click(function() {

                   
                    if(isSelf==1)
                    {
                       
                        alert("评委不能给自己所属赛区评分！")
                        return false;
                    }
                })

               $("input").bind('input propertychange', function() {
                    if(isSelf==1)
                    {
                       
                        alert("评委不能给自己所属赛区评分！")
                        return false;
                    }
					var id=$(this)[0].id
					if(id=="in1"&&$(this).val()>30){
						//alert_Tips(, "", 1500)
						alert("手术难度最多可打30分！")
						$(this).val("")
					}
					if(id=="in2"&&$(this).val()>20){
						//alert_Tips(, "", 1500)
						alert("诊疗思路及手术方式选择的合理性最多可打20分！")
						$(this).val("")
					}
					if(id=="in3"&&$(this).val()>20){
						//alert_Tips(, "", 1500)
						alert("手术操作规范性最多可打20分！")
						$(this).val("")
					}
					if(id=="in4"&&$(this).val()>15){
						//alert_Tips(, "", 1500)
						alert("病史资料完整、清晰最多可打15分！")
						$(this).val("")
					}
					if(id=="in5"&&$(this).val()>15){
						//alert_Tips("", "", 1500)
						alert("手术视频清晰度、剪辑是否得当最多可打15分！")
						$(this).val("")
					}
					if($(this).val()<100){
						
					}else{
						//alert_Tips(, "", 1500)
						alert("请输入纯数字！")
						$(this).val("")
					}
					
                   
                    var in1=$("#in1").val();
                    var in2=$("#in2").val();
                    var in3=$("#in3").val();
                    var in4=$("#in4").val();
                    var in5=$("#in5").val();
                    
                    if(in1==""){
                    	in1=0
                    }
                    if(in2==""){
                    	in2=0
                    }
                    if(in3==""){
                    	in3=0
                    }
                    if(in4==""){
                    	in4=0
                    }
                    if(in5==""){
                    	in5=0
                    }
                    
                    var score=parseInt(in1)+parseInt(in2)+parseInt(in3)+parseInt(in4)+parseInt(in5);
                    $("#spScore").html(score);
				})
               
               	$("#loadImg img").click(function(){
	               	var imgarr=[]
	               	var imgsrc='https://wx.linkmed.cn'+$(this).attr("src")
	               	for(var i=0;i<$("#loadImg img").length;i++){
	               		imgarr.push('https://wx.linkmed.cn'+$("#loadImg img").eq(i).attr("src"));
	               	}
	               	console.log(imgsrc)
	               	console.log(imgarr)
	               	
	               	wx.previewImage({
					    current: imgsrc, // 当前显示图片的http链接
					    urls: imgarr // 需要预览的图片http链接列表
					});
               	})

			})
		</script>
         <script src="fx.js?v=1" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "https://wx.linkmed.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('https://wx.linkmed.cn/iCataract_line/scoring.aspx?id=<%=id %>', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2020年度强生全视白内障手术达人赛")
   </script>
	</body>

</html>

