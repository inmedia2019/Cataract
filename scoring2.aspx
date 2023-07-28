<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scoring.aspx.cs" Inherits="scoring" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head runat="server">
		<meta charset="UTF-8">
		<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
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
			
			img {
				max-width: 100%;
			}
			
			.fixed {
				position: fixed;
				width: 100%;
				height: 100%;
				background: rgba(0, 0,0, 0.75);
				z-index: 999;
			}
			
			.fixedmain {
				width: calc(100% - 40px);
				height: calc(100% - 40px);
				background: #fff;
				border-radius: 8px;
			}
			
			.title {
				font-size: 16px;
				font-weight: bold;
				color: rgba(85, 85, 85, 1);
				line-height: 16px;
				position: relative;
				padding: 15px 0;
				border-bottom: 1px solid rgba(235, 235, 235, 1);
				text-align: center;
			}
			
			.title img {
				position: absolute;
				right: 11px;
				top: 11px;
			}
			
			.qbox {
				width: calc(100% - 35px);
				margin: 20px auto;
			}
			
			.qtitle {
				font-size: 15px;
				margin-top: 20px;
				font-weight: bold;
				color: rgba(85, 85, 85, 1);
				line-height: 20px;
				margin-bottom: 12px;
				width: 100%;
				word-break: break-all;
			}
			
			.qbox {
				height: calc(100% - 88px);
				overflow-y: auto;
				-webkit-overflow-scrolling: touch;
			}
			
			.xx {
				width: calc(100% - 2px);
				height: 28px;
				background: rgba(249, 249, 249, 1);
				border: 1px solid rgba(249, 249, 249, 1);
				margin-bottom: 10px;
				border-radius: 6px;
			}
			
			.cbox {
				width: 15px;
				height: 15px;
				border-radius: 15px;
				background: rgba(255, 255, 255, 1);
				overflow: hidden;
			}
			
			.nocheck {
				background: rgba(255, 255, 255, 1);
				width: 13px;
				height: 13px;
				border-radius: 15px;
				border: 1px solid rgba(231, 231, 231, 1);
			}
			
			.xx.on {
				border: 1px solid rgba(223, 32, 25, 1);
			}
			
			.xx .nocheck div {
				display: block;
			}
			
			.xx .nocheck img {
				display: none;
			}
			
			.xx.on .cbox div {
				display: none;
			}
			
			.xx.on .cbox img {
				display: fle;
			}
			
			.text {
				width: calc(100% - 55px);
				margin-left: 10px;
			}
			
			.xx input {
				border: none;
				height: 100%;
				background: none;
				font-size: 14px;
				width: calc(100% - 105px);
			}
			.tj{width:100%;
height:40px;
background:rgba(223,32,25,1);
border-radius:4px;font-size:16px;

font-weight:400;
color:rgba(255,255,255,1);
 text-align: center; line-height: 40px; margin-top: 30px;}
		</style>
		
	</head>

	<body>
		<div class="fixed center" style="display: none;">
			<div class="fixedmain">
				<div class="title">
					专家问卷调查 
				</div>
				<div class="qbox">
					<div class="qtitle" style="margin-top: 0;">
						1. 对于今年达人赛的整体设置和安排 ，您的整体评价是 (单选)
					</div>
					<div class="checkbox" num="1" can="1">

						<div class="xx center">
							<div class="cbox">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="5">5分 非常满意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="4">4分 满意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="3">3分 一般</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="2">2分 不满意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="1">1分 非常不满意</div>
						</div>
					</div>
					<div class="qtitle">
						2. 针对今年网络点评的形式，您觉得 (单选）
					</div>
					<div class="checkbox" num="2" can="1">
						<div class="xx center">
							<div class="cbox">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="5">5分 非常满意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="4">4分 满意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="3">3分 一般</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="2">2分 不满意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="1">1分 非常不满意</div>
						</div>
					</div>
					<div class="qtitle">
						3. 作为专家评委，参与到手术录像比赛的点评工作，您最看重的前三项是 (多选）
					</div>
					<div class="checkbox" num="3" can="3" id="ss1">
						<div class="xx center">
							<div class="cbox">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">参赛选手及视频的数量</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">参赛视频的质量</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">评分标准规则的公平公正</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">活动形式的创新与不同</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">比赛内容主题设置的科学合理</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">评审团阵容的权威</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">赛事的宣传和推广</div>
						</div>
						<div class="xx center xx1" style="justify-content: left;">
							<div class="cbox "  style="    margin-left: 15px;">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" style=" width: 40px;" name="you">其他 :</div>
							<input type="text" name="" value="" placeholder="请输入您的想法" style="" id="san"/>
						</div>
					</div>
					<div class="qtitle">
						4. 很多参赛选手希望能得到对本区域专家的线上赛事辅导，您的想法是 (单选)
					</div>
					<div class="checkbox" num="4" can="1">
						<div class="xx center">
							<div class="cbox">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="5">非常愿意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="4">愿意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="3">一般</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="2">不愿意</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="1">非常不愿意</div>
						</div>
					</div>
					<div class="qtitle">
						5. 针对邀请其它的国家及地区的点评专家及选手参与到今后的比赛，您的想法是 (单选）
					</div>
					<div class="checkbox" num="5" can="1">
						<div class="xx center">
							<div class="cbox">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="5">非常有必要</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="4">有必要</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="3">一般</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="2">没必要</div>
						</div>
						<div class="xx center ">
							<div class="cbox ">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" name="1">非常没必要</div>
						</div>
					</div>
					<div class="qtitle">
						6. 您是否愿意推荐同事或下属参加本次比赛
					</div>
					<div class="checkbox" num="6" can="1" id="ss2">
						<div class="xx center">
							<div class="cbox">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text">是</div>
						</div>

						<div class="xx center xx2" style="justify-content: left;">
							<div class="cbox " style="    margin-left: 15px;">
								<div class="nocheck">
								</div>
								<img src="img/gou.png" width="15px" />
							</div>
							<div class="text" style=" width: 40px;"  name="you">否</div>
							<input type="text" name="" value="" placeholder="请填写原因" style="" id="six"/>
						</div>
					</div>
					
 
					<div class="tj">
						提交
					</div>
				</div>
			</div>
		</div>
		<div id="overflow_hidden" class="pf whtl0">
			<video id="player-container-id" preload="auto" width="100%" playsinline webkit-playinline x5-playinline></video>
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
									<div class="h100 ovh">
										<div class="fl" style="width: calc(100% + 10px);">
											<%=areaInfo %>
										</div>
									</div>
									<img height="24px" src="img/qybg.png">
								</div>
								<div class="h5"></div>
								<div>作品编号：
									<%=codeInfo %>
								</div>

								<div class="h5"></div>
							</div>
							<div class="h10"></div>
							<div class="h10"></div>
							<div class="bfff bor5 p1220 f16 pr">
								<div class="pa qybg center">
									<div class="h100 ovh">
										<div class="fl" style="width: calc(100% + 10px);">参赛医生临床经验</div>
									</div>
									<img height="24px" src="img/qybg.png">
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
									<div class="h100 ovh">
										<div class="fl" style="width: calc(100% + 10px);">病例</div>
									</div>
									<img height="24px" src="img/qybg.png">
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
							<div class="bfff p1220 bor5500 o85" <%=counts1>=11?"style='display:none;'":"" %>> 作品评分
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
									<textarea rows="" id="py" cols="" placeholder="专家评语..."><%=py %></textarea>
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
		
		<script>

        var counts1='<%=counts1 %>';
        var isTj='<%=isTj %>';
        if(counts1==6&&isTj==0)
        {
           $(".fixed").show();
        }
			$(function () {
 document.body.addEventListener('focusout', () => {
        // 软键盘收起的事件处理
        setTimeout(() => {
          const scrollHeight =
            document.documentElement.scrollTop || document.body.scrollTop || 0
          window.scrollTo(0, Math.max(scrollHeight - 1, 0))
        }, 100)
      })
})
			window.alert = function(name){
 var iframe = document.createElement("IFRAME");
iframe.style.display="none";
iframe.setAttribute("src", 'data:text/plain,');
document.documentElement.appendChild(iframe);
window.frames[0].window.alert(name);
iframe.parentNode.removeChild(iframe);
}
			var num1=""
			var num2=""
			var num3=""
			var num4=""
			var num5=""
			var num6=""
			var f1=false
			var f2=false
			$(".xx").click(function(){
				var index=$(this).parents().attr("num")
				var can=parseInt($(this).parents().attr("can"))
				
				
				if(can==1){
					
					$(this).siblings().removeClass("on")
					$(this).addClass("on")
					if(index==1){
						num1=$(this).find(".text").attr("name")
					}
					if(index==2){
						num2=$(this).find(".text").attr("name")
					}
					if(index==4){
						num4=$(this).find(".text").attr("name")
					}
					if(index==5){
						num5=$(this).find(".text").attr("name")
					}
					if(index==6){
						if($(this).find(".text").attr("name")=="you"){
							f1=true
							num6=$(this).find(".text").html() +"("+$("#six").val()+")"
						}
						else{
							f1=false
							num6=$(this).find(".text").html()
						}
						
					}
				}
				if(can==3){
					
					var gs
					
					if($(this).hasClass("on")){
							console.log(111)
						$(this).removeClass("on")
						return false;
					}
					gs=$(this).parent().find(".on")
					
					if(gs.length>=3){
						alert("不能超过三项")
						return false;
					}
					else{
						
						    
							$(this).addClass("on")
							gs=$(this).parent().find(".on")
							console.log(gs.eq(0).find(".text").html())
							
							num3=""
							for(var i=0;i<gs.length;i++){
								
								if(gs.eq(i).find(".text").attr("name")=="you"){
									f2=true
									num3+=gs.eq(i).find(".text").html()+"("+$("#san").val()+"),"
								}
								else{
									f2=false
									num3+=gs.eq(i).find(".text").html()+","
								}
							}
							console.log(num3)
						
					}
				}
				
			})
			$("#san,#six").click(function(e){
				e.stopPropagation()
			})
			$(".tj").click(function(){
				console.log(f1)
				console.log(f2)
				if($(".xx1").hasClass("on")){
					num3=""
					var gs=$("#ss1").find(".on")
					console.log(gs)
					for(var i=0;i<gs.length;i++){
								console.log(gs.eq(i).find(".text").attr("name")=="you")
								if(gs.eq(i).find(".text").attr("name")=="you"){
									f2=true
									num3+=gs.eq(i).find(".text").html()+"("+$("#san").val()+"),"
								}
								else{
									f2=false
									num3+=gs.eq(i).find(".text").html()+","
								}
							}
				}
				if($(".xx2").hasClass("on")){
					num6=$(".xx2").find(".text").html() +"("+$("#six").val()+")"
				}
				if(num1==""){
					alert("请对第一题作答")
					return false;
				}
				if(num2==""){
					alert("请对第二题作答")
					return false;
				}
				if(num3==""){
					alert("请对第三题作答")
					return false;
				}
				var gs=$("#ss1").find(".on")
				console.log(gs.length+"...")
				if(gs.length<3){
					alert("第三题选择必须选3个")
					return false;
				}
				console.log($(".xx1").hasClass("on"))
				console.log($("#san").val()=="")
				if($(".xx1").hasClass("on") && $("#san").val()==""){
					
					alert("请您对第三题说明具体原因 谢谢！")
					return false;
				}
				if(num4==""){
					alert("请对第四题作答")
					return false;
				}
				if(num5==""){
					alert("请对第五题作答")
					return false;
				}
				if(num6==""){
					alert("请对第六题作答")
					return false;
				}
				
				if($(".xx2").hasClass("on") && $("#six").val()==""){
					alert("请您对第六题说明具体原因 谢谢！")
					return false;
				}
				var alldeta= num1+"|"+num2+"|"+ num3+"|"+num4+"|"+num5+"|"+num6
              
				console.log(alldeta)
				$.ajax({
						type: "POST",
						url: 'setFormInfo.aspx',
						async: false,
						data: {
							"answer": alldeta,
							"infoId": <%=id %>
						},
						beforeSend: function(xmlHttpRequest) {
                          
						},
						success: function(data, textStatus) {
							 if(data=="2")
                             {
                                alert("您已经提交过,不能重复提交!")
					
                             }
                             else if(data=="1")
                             {
                                alert("提交成功!");
                                $(".fixed").hide();
                             }
                             else if(data=="3")
                             {
                                alert("提交成功!");
                                backTo();
                             }
						},
						complete: function(xmlHttpRequest, textStatus) {},
						error: function() {}
					});
			
			})
			
		</script>
		<script type="text/javascript">
			var isSelf = '<%=isSelf %>';

			function backTo() {
				var n = '<%=N %>';
				if(n == 1)
					window.location.href = "userScoringlist.aspx";
				else
					window.location.href = "scoringlist.aspx?tid=<%=tid %>";
			}

			var winw = $("#overflow_hidden").width()
			var winh = $("#overflow_hidden").height()
			var bi = 375 / 212;
			var viheight = winw / bi - 4;

			$(".tcp-skin").css("height", viheight + "px")

			$("#body").css("top", viheight + "px")

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
							if(sbody.isEnd) {
								if(staY - sbody.translate > 30) {
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

					if(isSelf == 1) {
						//alert_Tips("评委不能给自己所属赛区评分！", "", 2000)
						alert("评委不能给自己所属赛区评分！")
						return false;
					}

					var in1 = $.trim($("#in1").val());
					var in2 = $.trim($("#in2").val());
					var in3 = $.trim($("#in3").val());
					var in4 = $.trim($("#in4").val());
					var in5 = $.trim($("#in5").val());

					if(in1 == "") {
						alert("请对手术难度进行打分！")
						return false;
					}

					if(in2 == "") {
						alert("请对诊疗思路及手术方式选择的合理性进行打分！")
						return false;
					}

					if(in3 == "") {
						alert("请对手术操作规范性进行打分！")
						return false;
					}

					if(in4 == "") {
						alert("请对病史资料完整、清晰进行打分！")
						return false;
					}

					if(in5 == "") {
						alert("请对手术视频清晰度、剪辑是否得当进行打分！")
						return false;
					}

					if(parseInt(in1) > 30) {
						//alert_Tips("手术难度最多可打30分！", "", 1500)
						alert("手术难度最多可打30分！")
						return false;
					}

					if(parseInt(in2) > 20) {
						//alert_Tips(, "", 1500)
						alert("诊疗思路及手术方式选择的合理性最多可打20分！")
						return false;
					}

					if(parseInt(in3) > 20) {
						//alert_Tips(, "", 1500)
						alert("手术操作规范性最多可打20分！")
						return false;
					}

					if(parseInt(in4) > 15) {
						//alert_Tips(, "", 1500)
						alert("病史资料完整、清晰最多可打15分！")
						return false;
					}

					if(parseInt(in5) > 15) {
						//alert_Tips(, "", 1500)
						alert("手术视频清晰度、剪辑是否得当最多可打15分！")
						return false;
					}

					var py = $.trim($("#py").val());
					if(py == "") {
						//alert_Tips(, "", 1500)
						alert("请填写评语！")
						return false;
					}

					$.ajax({
						type: "POST",
						url: 'setScoreInfo.aspx',
						async: false,
						data: {
							"in1": in1,
							"in2": in2,
							"in3": in3,
							"in4": in4,
							"in5": in5,
							"infoId": <%=id %>,
							"py": py
						},
						beforeSend: function(xmlHttpRequest) {

						},
						success: function(data, textStatus) {
                            var temp=data.split('|');
							if(temp[0] == "1") {
								//alert_Tips(, "backTo", 2000)
								alert("提交成功！")
                                if(temp[1]=="6")
                                {
                                   $(".fixed").show();
                                }
								else{
                                  backTo()
                                }
							} else if(temp[0] == "2") {
								//alert_Tips(, "", 2000)
								alert("非法用户！")
							} else if(temp[0] == "3") {
								//alert_Tips(, "", 2000)
								alert("该视频已评满,无法继续评分！")
							} else if(temp[0] == "4") {
								//alert_Tips(, "backTo", 2000)
								alert("修改评分成功！")
                                if(temp[1]=="6")
                                {
                                   $(".fixed").show();
                                }
								else{
                                  backTo()
                                }
							} else if(temp[0] == "5") {
								//alert_Tips(, "", 2000)
								alert("您评分的视频已经超过11个,无法继续评分！")
							} else if(temp[0] == "6") {
								//alert_Tips(, "", 2000)
								alert("您已完成11个参赛作品的评分，感谢您对达人赛的大力支持！")
								window.location.href = "userScoringlist.aspx";
							}

						},
						complete: function(xmlHttpRequest, textStatus) {},
						error: function() {}
					});

				})

				$("#py").click(function() {

					if(isSelf == 1) {

						alert("评委不能给自己所属赛区评分！")
						return false;
					}
				})

				$("#overflow_hidden input").bind('input propertychange', function() {
					if(isSelf == 1) {

						alert("评委不能给自己所属赛区评分！")
						return false;
					}
					var id = $(this)[0].id
					if(id == "in1" && $(this).val() > 30) {
						//alert_Tips(, "", 1500)
						alert("手术难度最多可打30分！")
						$(this).val("")
					}
					if(id == "in2" && $(this).val() > 20) {
						//alert_Tips(, "", 1500)
						alert("诊疗思路及手术方式选择的合理性最多可打20分！")
						$(this).val("")
					}
					if(id == "in3" && $(this).val() > 20) {
						//alert_Tips(, "", 1500)
						alert("手术操作规范性最多可打20分！")
						$(this).val("")
					}
					if(id == "in4" && $(this).val() > 15) {
						//alert_Tips(, "", 1500)
						alert("病史资料完整、清晰最多可打15分！")
						$(this).val("")
					}
					if(id == "in5" && $(this).val() > 15) {
						//alert_Tips("", "", 1500)
						alert("手术视频清晰度、剪辑是否得当最多可打15分！")
						$(this).val("")
					}
					if($(this).val() < 100) {

					} else {
						//alert_Tips(, "", 1500)
						alert("请输入纯数字！")
						$(this).val("")
					}

					var in1 = $("#in1").val();
					var in2 = $("#in2").val();
					var in3 = $("#in3").val();
					var in4 = $("#in4").val();
					var in5 = $("#in5").val();

					if(in1 == "") {
						in1 = 0
					}
					if(in2 == "") {
						in2 = 0
					}
					if(in3 == "") {
						in3 = 0
					}
					if(in4 == "") {
						in4 = 0
					}
					if(in5 == "") {
						in5 = 0
					}

					var score = parseInt(in1) + parseInt(in2) + parseInt(in3) + parseInt(in4) + parseInt(in5);
					$("#spScore").html(score);
				})

				$("#loadImg img").click(function() {
					var imgarr = []
					var imgsrc = 'https://wx.linkmed.cn' + $(this).attr("src")
					for(var i = 0; i < $("#loadImg img").length; i++) {
						imgarr.push('https://wx.linkmed.cn' + $("#loadImg img").eq(i).attr("src"));
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