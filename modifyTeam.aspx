<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifyTeam.aspx.cs" Inherits="UI_modifyTeam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background: url(images/ubg.jpg) no-repeat center bottom; background-size:100% 100% ;">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="yes" name="apple-touch-fullscreen" />
    <meta content="telephone=no,email=no" name="format-detection" />
    <meta content="fullscreen=yes,preventMove=no" name="ML-Config" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no; email=no" />
    <meta name="x5-fullscreen" content="true" />
    <meta name="viewport" content="width=750,user-scalable=no,target-densitydpi=device-dpi">
    <title></title>
    <link rel="stylesheet" href="css/animate.css">
    <!--<link href="css/h5.css?v202018" rel="stylesheet">-->
    <!--<script type="text/javascript" src="js/libraries.js"></script>-->
    <script src="JS/jquery-1.11.2.min.js"></script>
    <script src="js/jweixin-1.0.0.js"></script>
    <script src="js/wechatJSSDK.js"></script>
    <script src="js/wxShare.js"></script>
     <script src="js/iAlert.js"></script>
    <style type="text/css">
    	.input{ width: 80%; margin: 25px auto 0px; padding: 0 5%; background: #fff; height: 96px; border-radius: 8px; font-size: 32px; margin-top: 25px !important;}
    	.input span{ color: #252525;
    display: inline-block;
    width: 75px;}
    	.input input{ margin-left: 20px; background: none; width: 85%; border: none; height: 100%; font-size: 32px; outline: none;}
    	
    </style>

</head>

<body style="background: url(images/ubg.jpg) no-repeat center bottom; background-size:100% 100% ;">

	<div class="center" style="position: fixed; top: 0px; left: 0px; z-index: 3; background: #fff; width: 100%;font-size: 28px;">
		<div class="center" style="width: 50%;padding: 28px 0px;border-bottom: #e60012 solid 2px; color:#e60012">实名认证</div>
		<div class="center" style="width: 50%;padding: 28px 0px;border-bottom: #8a8a8a solid 2px; color:#8a8a8a;" onclick="javascript:window.location.href='insideLogin.aspx'">强生员工登录</div>
	</div>

   	<div style="height: 20px;"></div>
   	<div style="height: 20px;"></div>
   	<div style="height: 20px;"></div>
   	<div style="height: 20px;"></div>
   	<div style="height: 20px;"></div>
    <div class="input center" style="margin-top: 0;">
    	<span>姓名</span> <input type="text" name=""  value="" placeholder="请输入姓名" id="name"/>
    </div>
     <div class="input center">
    	<span>电话</span> <input type="tel" name=""  value="<%=phone %>" placeholder="请输入电话" id="phone"/>
	</div>
	
	<div class="input center">
    	<span style=" width: 120px;">验证码</span> 
	</div>
	
     <div class="input center" >
    	<span>邮箱</span> <input type="text" name=""  value="<%=email %>" placeholder="请输入邮箱" id="email"/>
    </div>
    <div class="input center">
    	<span>医院</span> <div id="hospital" style=" line-height: 96px; overflow: hidden;white-space: nowrap;text-overflow: ellipsis;-webkit-appearance: none;appearance: none;margin-left: 20px;background: none;width: 85%;border: none;height: 100%;font-size: 32px;outline: none;">请选择</div>
    </div>
     <div class="input center">
    	<span>职务</span> <select id="job" style="-webkit-appearance: none;appearance: none;margin-left: 20px;background: none;width: 85%;border: none;height: 100%;font-size: 32px;outline: none;"><option value="-1">请选择</option><%=groupId %></select>
    </div>
     <div class="input center">
    	<span>科室</span> <select id="stDepart" style="-webkit-appearance: none;appearance: none;margin-left: 20px;background: none;width: 85%;border: none;height: 100%;font-size: 32px;outline: none;"><option value="-1">请选择</option><%=groupId %></select>
    </div>
    <img src="images/t.png" class="h30" />
    
    <div class="an center">
        <img src="images/gou.png" />
        &nbsp;&nbsp; 确定
	
    </div>
    <div class="alert center dn">
        <div class="main">
            <img src="images/t1.png" class="icon" />
            <div class="w30 titleword">
                若您想更换分组与个人信息
			
            </div>
            <img src="images/close.png" class="close" />
            <div class="mainbox">
                <div class="tsword">
                    更换方式一：<br>
                    点击个人中心-修改信息<br>
                    更换方式二：<br>
                    点击活动日历-设置-修改信息<br>
                </div>
                <div class="btbpx">
                    <div class="an1 center back fl">
                        <img src="images/back.png" />
                        &nbsp;&nbsp; 返回
					
                    </div>
                    <div class="an center sure fr">
                        <img src="images/gou.png" />
                        &nbsp;&nbsp; 确定
					
                    </div>
                </div>
            </div>

        </div>
	</div>
	
	<div class="pf yytc dn" style="width: 100%; height: 100%; top: 0px; left: 0px; z-index: 9; background: #fff; font-size: 30px;">
		<div class="center" style="padding: 20px 20px; background: url(images/ssbg.jpg);">
			<div class="center" style="width: 50px; height: 17px;">
				<svg t="1590728699308" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1136" xmlns:xlink="http://www.w3.org/1999/xlink" width="200" height="85"><defs><style type="text/css"></style></defs><path fill="#fff" d="M629.376 160 330.624 467.968 330.624 467.968 288 512 330.624 555.968 330.688 555.968 629.376 863.936 672 819.968 373.312 512 672 204.032Z" p-id="1137"></path></svg>
			</div>
			<div class="center" style=" margin-left: 20px; width: calc(100% - 235px);">
				<input placeholder="请输入医院名称" type="text" style="width: 100%;padding: 16px 30px;font-size: 30px;border-radius: 5px;border: none;">
			</div>
			<div class="center butsearch" style=" padding: 10px 30px;background: #fff;border-radius: 5px;margin-left: 30px;">搜索</div>
		</div>
		<ul class="pf yylist" style="top: 100px; left: 0px; right: 0px; bottom: 0px; overflow-y: auto;">
			
		</ul>
	</div>
</body>
<script>


	$("#hospital").click(function(){
		$(".yytc").show()
	})

	

	$("svg").click(function(){
		
		$(".yytc").hide()
	})

	$(".butsearch").click(function(){
		
		$(".yylist").append('<li style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" data-type="上海长江医院上海长江医院上海长江医院上海长江医院上海长江医院">上海长江医院上海长江医院上海长江医院上海长江医院上海长江医院</li>')

		$(".yylist li").click(function(){
			$("#hospital").html($(this).data().type)
			$(".yytc").hide()
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
    $(".chooselist li").click(function () {
        $(".chooselist li").removeClass("on")
        if ($(this).hasClass("on")) {
            $(this).removeClass("on")
        }
        else {
            $(this).addClass("on")
        }
    })
    
    $(".an").click(function() {
    	// var t = $(".chooselist").find(".on").attr("dataid");
        var name=$.trim($("#name").val());
        var phone=$.trim($("#phone").val());
        var email=$.trim($("#email").val());
        var hospital=$.trim($("#hospital").val());
        var stDepart=$("#stDepart").val();
        var job=$("#job").val();
        
       if(name.length==0)
       {
           alert("请输入姓名!");  
	        return false; 
       }
       
       if(phone.length==0)
       {
           alert("请输入电话!");  
	        return false; 
       }
      
       if(!(/^1[3456789]\d{9}$/.test(phone))){ 
	        alert("手机号码有误，请重新填写");  
	        return false; 
       } 
    	
     //  if(email.length==0)
      // {
          // alert("请输入邮箱!");  
	       // return false; 
      // }
    	
    	//var myreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    	//if(!myreg.test(email)){ 
	     //   alert("邮箱格式有误，请重新填写");  
	      //  return false; 
    	//} 
    	
       if(hospital.length==0)
       {
           alert("请输入医院!");  
	        return false; 
       }
       
       if(stDepart=="-1")
       {
           alert("请选择科室!");  
	        return false; 
       }
       
       if(job=="")
       {
         alert("请输入职务!");  
	        return false; 
       }
    	
      //  var t = $(".chooselist").find(".on").attr("dataid");
     
       // if (isNaN(t)) {
           // iAlert.fnAdd({
             //   sTitle: '',
              //  aContent: ['请选择分组!'],
               // oButton: {
                 //   bType: 1,
                  //  oSingle: { sText: '关闭', aEvents: ['onclick="iAlert.fnDel()"'] },
                   // oMarried: {
                   //     oNegative: { sText: 'Cancel', aEvents: ['onclick="iAlert.fnDel();fnTemp.cancel()"'] },
                    //    oPositive: { sText: 'Confirm', aEvents: ['onclick="fnTemp.confirm()"'] }
                   // }
               // }
            //});
           // return false;
       // }
        $(".alert").css("display", "flex")
    })
    
    $(".back,.close").click(function () {
        $(".alert").hide()
    })

    $(".sure").click(function () {
     var t = $(".chooselist").find(".on").attr("dataid"); 
     $.ajax({
         type: "POST",
         url: 'modifyGroupNew.aspx',
         async: false,
         data: { "oid": '<%=oid%>', "groupId": stDepart,"name":$.trim($("#name").val()),"phone":$.trim($("#phone").val()),"email":$.trim($("#email").val()),"hospital":$.trim($("#hospital").val()),"job":job },
         beforeSend: function (xmlHttpRequest) {
         },
         success: function (data, textStatus) {
             if (data == "1") {
                 location.href = '<%=backUrl%>';
             }
             else {
                 iAlert.fnAdd({
                     sTitle: '',
                     aContent: ['网络错误!'],
                     oButton: {
                         bType: 1,
                         oSingle: { sText: '关闭', aEvents: ['onclick="iAlert.fnDel()"'] },
                         oMarried: {
                             oNegative: { sText: 'Cancel', aEvents: ['onclick="iAlert.fnDel();fnTemp.cancel()"'] },
                             oPositive: { sText: 'Confirm', aEvents: ['onclick="fnTemp.confirm()"'] }
                         }
                     }
                 });
             }
         },
         complete: function (xmlHttpRequest, textStatus) {
         },
         error: function () {
         }
     });
 })

	</script>
	<style>

		.yylist{  }
		.yylist li{ padding: 30px; border-bottom: #ccc solid 1px; }


		html,body{background:#e2e2e4;font:12px "microsoft yahei";width:100%; height: auto; min-height: 100vh;margin:0;padding:0;-webkit-tap-highlight-color:rgba(0,0,0,0); -webkit-user-select:none;-webkit-touch-callout:none;}
    	img{vertical-align:bottom;-webkit-user-select:none;-webkit-touch-callout:none;}
    	.load{font-size:50px;position:relative;z-index:9999;width:100%;height:100%;text-align:center;color:#fff;background:rgba(0,0,0,.8);}
    	ul,li{margin:0;padding:0;list-style:none;}
    	h1,h2,h3,h4,p,figure{margin:0;}
    	input{
    	
    	    -moz-box-sizing: border-box;
    	    box-sizing: border-box;
    	}
    	.music{    position: absolute;
    	    width: 31px;
    	    height: 31px;
    	    z-index: 2;
    	   top: 23px;
    	    right: 25px;}
    	.music.play{-webkit-animation:music 1.5s linear infinite;animation:music 1.5s linear infinite;}
    	a.arr{position:absolute;z-index:100;bottom:10px;left:50%;margin-left:-45px;-webkit-animation:arr2 1.2s linear infinite;animation:arr2 1.2s linear infinite;width:90px;height:67px;text-align:center;}
    	/*Loading CSS*/ 
    	.loadwrap{  width: 100%;height: 100%;background:url(../images/lbg.jpg) no-repeat; background-size:100% 100%;position: absolute;z-index: 9999;}
    	#caseBlanche {  height: 150px;  width : 150px;  float : left;  position: absolute;  z-index: 99;  left: 0;right: 0;top: -17%;bottom: 0;margin: auto;}
    	#caseBlanche #load {height: 150px;width: 100%;color : #fff;font-family : calibri;text-align : center;position : absolute;/* top: 53px; */font-size: 2rem;line-height: 50px;text-align: center;}
    	#load i{height: 100%;display: inline-block;width: 100%;text-align: center;line-height: 150px;}
    	#test {height : 10px;width : 10px;position : absolute;background-color : #fff;border-radius : 50%;top : 0px;left: 38px;}
    	#rond {height: 150px;width: 150px;border: 1px solid #fff;border-radius : 50%;position :absolute;animation : rond 2s infinite;-webkit-animation : rond 2s infinite;}
    	.loading{width: 100%;color: #fff;font-size: 2rem;position: absolute;top: 171px;text-align: center;}
    	.fl{ float: left;}
    	.fr{ float: right;}
    	.h10{ height: 10px;}
    	.h30{ margin-top: 30px;}
    	.h1000{ height: 1000px;}
    	.title{ height: 85px;  background-image: -webkit-linear-gradient(top, #df0012, #df0012); font-size: 33px; color: #fff; text-align: center; line-height: 85px;}
    	.tsview{     text-align: center;
    	    padding: 10px 0;
    	    font-size: 28px;
    	    line-height: 50px;
    	    background: #fff; }
    	.tsview .adview:last-child{ border-bottom: none;}
    	.progress{    height: 4px;
    	    width: 400px;
    	    /* margin: 70% auto; */
    	    background: #fff;
    	    position: absolute;
    	    top: 42%;
    	    left: 50%;
    	    margin: -1px auto 0 -200px; overflow: hidden;}
    	.progress-over{ width: 600px; height: 62px;position: absolute;
    	    top: 42%;
    	    left: 50%;
    	    margin: -31px auto 0 -300px;}
    	.progress-over img{ position: absolute; left:0%;-webkit-animation:rond 2s .2s  infinite; width: 200px;}
    	.move{ background: #1cf0f8; width: 100%; height: 100%;  position: absolute; left: 0;}
    	.loadword{    width: 750px;
    	    position: absolute;
    	    top: 45%;-webkit-animation:rond 2s .2s  infinite; }
    	    
    	.center{display: -webkit-box;
    			        display: -ms-flexbox;
    			        display: -webkit-flex;
    			        display: flex;
    			        -webkit-box-pack: center;
    			        -ms-flex-pack: center;
    			        -webkit-justify-content: center;
    			        justify-content: center;
    			        -webkit-box-align: center;
    			        -ms-flex-align: center;
    			        -webkit-align-items: center;
    			        align-items: center; margin-top: -1px;}
    			            
    	.chooselist{ overflow: hidden; width: 682px; margin: 30px auto;}
    	.chooselist li{ width: 330px; height: 60px ; text-align: center; line-height: 60px; background: #fff; border-radius: 8px; margin-bottom: 20px; font-size: 28px;}
    	.chooselist li:nth-child(odd) { float: left;}
    	.chooselist li:nth-child(even) { float: right;}
    	
    	.chooselist li.on{  background: -webkit-linear-gradient(top, #df0012, #df0012); color: #fff;}
    	.dn{ display: none;}
    	.an{ width: 215px; margin: 60px auto; text-align: center; height: 63px; line-height: 63px; color: #fff; background: -webkit-linear-gradient(top, #df0012, #df0012); clear: both; font-size: 28px; border-radius: 63px;}
    	.an img{ position: relative;}
    	.an2{ width: 140px; margin: 0px auto; text-align: center; height: 50px; line-height: 50px; margin-top: 20px;  color: #fff; background: -webkit-linear-gradient(top, #df0012, #df0012); font-size: 28px; border-radius: 63px;}
    	
    	
    	.alert,.alert2{ position: fixed; width: 100%; height: 100%; left: 0; top: 0; background: rgba(0,0,0,0.75);    z-index: 999;}
    	.alert .main,.alert2 .main{ width: 600px; position: relative;  border-radius: 8px; background: #dc0011;}
    	.alert .w30,.alert2 .w30{ font-size: 30px; color: #fff; font-weight: bold;}
    	.alert .icon,.alert2 .icon{ position: absolute; top: -25px; left: 15px;}
    	.alert .titleword,.alert2 .titleword{    margin-left: 130px;
    	    margin-top: 12px;}
    	.alert .close,.alert2 .close{ position: absolute; right: 20px ; top: 21px;}
    	.alert .mainbox,.alert2 .mainbox{ width: 586px;padding: 50px 0 30px 0; border-radius: 8px; background: #fff; margin-left: 7px; margin-top: 10px; margin-bottom: 10px;}
    	.alert .mainbox .tsword,.alert2 .mainbox .tsword{ font-size: 28px; line-height: 45px;    padding: 0px 30px 10px;}
    	.btbpx{ width: 480px; margin: 20px auto; overflow: hidden;}
    	.an1{ width: 215px; margin: 60px auto; text-align: center; height: 63px; line-height: 63px; color: #000; background:#efefef; clear: both; font-size: 28px; border-radius: 63px;}
    	.an1 img{ position: relative;}
    	
    	.an3{ width: 120px; margin: 0px auto; text-align: center; height: 63px; line-height: 63px; color: #fff;background:  -webkit-linear-gradient(top, #df0012, #df0012); font-size: 28px; border-radius: 8px;}
    	.an3 img{ position: relative;}
    	.btbpx div{ margin: 0 !important; clear: initial !important;}
    	
    	.aview{ width: 682px ; margin: 30px auto 0;  }
    	.atitle{    height: 81px;
    	    line-height: 70px;
    	    background: rgba(255,255,255,0.5);
    	    padding-left: 16px;
    	    border-bottom: 1px solid #b1b1b1;}
    	.atitle .fl{ height: 100%;    width: 507px; font-size: 30px; font-weight: bold; color: #e60012;}
    	.atitle .fl img{     position: relative;
    	    top: -16px;
    	    height: 43px;
    	    width: auto;}
    	.cbox { text-align: right; color: #b1b1b1; font-size: 24px;}
    	.cbox span img{  margin-right: 5px;}
    	.nrbox{ width: 650px; padding: 16px ; background: rgba(255,255,255,0.75);}
    	.anr{ border-radius: 12px; overflow: hidden;}
    	.adbox{ width: 680px; margin: 0 auto;}
    	.adbox1{ width: 680px; margin: 0 auto;}
    	.tsview .adview:last-child{ border-bottom: 0;}
    	.adview{ width: 660px; margin: 0 auto; padding: 12px 0; overflow: -moz-hidden-unscrollable; border-bottom: 1px solid #b1b1b1;}
    	.adviwe_title{ overflow: hidden; caption-side: #333; font-size: 30px;}
    	.adviwe_title .fl{ position: relative;
    	    top: 3px;
    	    display: none;}
    	.adviwe_title .fr{ width: 100%;
    	    text-align: left;
    	    }
    	.yy.center,.fx.center,.zbz.center{ font-size: 24px; margin-left: 10px; width: 138px; height: 42px; background: -webkit-linear-gradient(top, #df0012, #df0012); color: #fff; border-radius: 42px; float: right;}
    	.yyy.center{ margin-left: 10px; width: 132px; height: 42px; background: #999999; color: #fff; border-radius: 42px; float: right; font-size: 24px;}
    	.zbz.center{ width: 160px; font-size: 24px;}
    	
    	.yy.center img,.fx.center img,.zbz.center img{ margin-right: 6px;}
    	
    	.jjsx.center{    margin-left: 10px;
    	    width: 240px;
    	    height: 42px;
    	    background: #999999;
    	    color: #fff;
    	    border-radius: 42px;
    	    float: right; font-size: 24px;}
    	.ysx.center{  margin-left: 10px;
    	    width: 230px;
    	    height: 42px;
    	        background: -webkit-linear-gradient(top, #df0012, #df0012);
    	    color: #fff;
    	    border-radius: 42px;
    	    float: right; font-size: 24px;}
    	.adinfo{ clear: both; width: 100%; margin: 30px auto 10px;}
    	.adinfo{ clear: both; width: 100%; margin: 30px auto 10px;}
    	.adinfo.center .fl > img{ width: 100%;}
    	.adinfo .fl{ width: 222px; height: 146px; overflow: hidden;}
    	.adinfo .fr{ width: 432px;}
    	.adinfo .fr .word{ font-size: 28px; line-height: 35px; text-align: left; padding-left: 12px; margin: 5px 0;}
    	
    	.alert_sr input{     margin-left: 15px;    padding-left: 22px;
    	    font-size: 30px;
    	    width: 440px;
    	    height: 60px;
    	    background: #e1e1e1;
    	    border-radius: 60px;
    	    border: 0;
    	    box-shadow: 0 0 5px #e9e9e9; }
    	
    	.isearch{ height: 100px;  background: #333; overflow: hidden;}
    	.isearch >div{ width: 680px; margin: 18px auto ; height: 62px; background: #fff; border-radius: 8px;}
    	.isearch >div .sh{ float: left; background: none; border: none; outline: none; font-size: 30px; width: 450px; height: 100%; padding-left: 12px;}
    	.fx { display: none;}
    	.ma20{ margin-top: 20px;}
    	.imain{ width: 680px; margin: 0 auto; }
    	
    	.itag{ width: 100%; overflow: hidden; background: url(../images/tag1.png) no-repeat center bottom;}
    	.itag.on{ width: 100%; overflow: hidden; background: url(../images/tag2.png) no-repeat center bottom;}
    	.itag div{ width: 330px; height: 76px; background:  none;border: none; text-align: center; line-height: 86px;  font-size: 36px; margin-top: 25px; color: #e60012; outline: none;}
    	.itag div img:first-child{ display: none;}
    	.itag div img:last-child{ display: block;}
    	.itag div.on{ color: #fff;}
    	.itag div.on img:first-child{ display: block;}
    	.itag div.on img:last-child{ display: none;}
    	.itag div img{ margin-right: 10px;}
    			#btn{padding:14px;font-size: 14px;color: #fff;border-radius: 6px;background-color: #337ab7;border: none;}
    			#list{font-size: 26px;position: relative;height: 100%}
    			#list>section{overflow-y: auto;height:auto;}
    			#list>section>dl>dt{background: #f7f7f9;color: #999;height:40px;line-height:40px;padding-left: 15px;}
    			#list>section>dl>dd{font-size: 16px;color: #333;line-height:40px;padding-left: 15px;position: relative;}
    			#list>section>dl>dd:after{content:'';position: absolute;left: 0;bottom: 1px;width: 100%;height: 1px;background-color:#c8c7cc;transform:scaleY(.5);-webkit-transform:scaleY(.5);}
    			#list>section>dl>dd:last-of-type:after{display: none;}
    			#navBar{position: fixed;width:26px;height: 100%;right: 10px;top: 290px}
    			#navBar.active{background:rgba(211,211,211,.6);}
    			#navBar>a{text-align: center;display: block;text-decoration:none;height: 4.166%;line-height:100%;color: #333;font-size: 23px; color: red;}
    			#prompt{    text-align: center;
    	    display: block;
    	    text-decoration: none;
    	    height: 4.166%;
    	    line-height: 100%;
    	    color: #333;
    	    font-size: 26px;
    	    color: red;}
    			#prompt.active{display:block;}
    	.listtx{ width: 120px; height: 120px; border-radius: 122px ; border:5px solid #eeeeee; margin: 0 50px 0 0; overflow: hidden;}
    	.listy{ margin: 20px 0px; overflow: hidden;}
    	.listy .center div{ width: 100%;}
    	.anname{ font-size: 30px; margin-top: 20px;}
    	.anyiyuan{ font-size: 26px; color: #888888;}
    	
    	.listy1{ background: url(../images/t31.png); margin-top: 0; height: 168px;}
    	.listy1 .listtx { margin-left: 50px; margin-top: 10px;}
    	.listy1 .anname{ color: #fff; font-weight: bold; margin-top: 32px;}
    	.listy1 .anyiyuan{ color: #fff;}
    	.tag1{ margin: 23px auto; overflow: hidden;}
    	.tag1> div >div{    float: left;
    	    margin-right: 3px;
    	    min-width: 164px;
    	    height: 85px;
    	    border: 1px solid #d0cfd1;
    	    font-size: 30px;
    	    padding: 0 15px;
    	    width: 295px;
    	    margin-right: 13px;
    	    margin-bottom: 13px;}
    	 .tag1> div >div>div   {width: 80px;
    	    border-right: 1px solid #cdcdce;
    	    float: left;
    	}
    	 .tag1> div >div>span{
    		    display: inline-block;
    	    width: 217px;
    	    text-align: center;
    	}
    	.tag1 div:last-child{ margin-right: 0;}
    	.tag1 div img:first-child{ display: block; margin-right: 10px;}
    	.tag1 div img:last-child{ display: none;margin-right: 10px;}
    	.tag1 div.on{ background:  -webkit-linear-gradient(top, #df0012, #b3010f); color: #fff; }
    	.tag1 div.on img:first-child{ display: none;}
    	.tag1 div.on img:last-child{ display: block;}
    	.tag1 div.on div{  border-right: 1px solid #fff; } 
    	.ssinbox{ background: rgba(255,255,255,0.5); padding: 22px 0; margin-top: 22px;}
    	.ssinbox>img{ margin-left: 16px; width: 650px; border-radius: 8px;}
    	.ssinbox .titlelist{ margin-left: 16px; width: 650px; margin-top: 22px; overflow: hidden;}
    	.llist span{ display: inline-block; font-size: 26px;}
    	.llist .dot{ width: 10px; height: 10px; border-radius: 50%; background: #bdbdbd; margin-right: 10px;}
    	.llist .w{      width: 593px;;}
    	
    	.ctx{ width: 122px; height: 122px; border-radius: 122px; border: 4px solid #e0e0e0; overflow: hidden; display: inline-block; margin-bottom: 15px;}
    	.ctx img{ width: 100%;}
    	.uname{ font-size: 28px; color: #999;}
    	.red{ color: red;}
    	.gary{ color: #888;}
    	.show1{ width: 374px; float: left; text-align: center;    line-height: 32px;}
    	.show1 > div{ display: inline-block;}
    	.show1 .cw1{ font-size: 28px;}
    	.show1 .cw2{font-size: 26px;}
    	.show1 .cw3{font-size: 32px;}
    	.crlist{ padding: 25px;}
    	.crlist li{ padding: 18px; border-bottom: 1px solid #333;}
    	.crlist li .fl{     font-size: 28px;
    	    width: 450px;
    	    margin-right: 19px; line-height: 45px;}
    	    .crlist li:last-child{ border-bottom: 0;}
    	.imain .aa{ height: 100px; border-radius: 12px; background: #fff;}
    	.imain .aa .tbt{ margin-left: 20px; margin-right: 20px; width: 34px;}
    	.imain .aa span{  font-size: 32px; width: 530px;}
    	
    	.yzm.om { background: #cecece;}
    	
    	a:link {
    	color: #333; /*杩炴帴榛樿鐨勯鑹插彉鍖�*/
    	}
    	a:visited {
    	color: #333; /*杩炴帴璁块棶鐨勯鑹插彉鍖�*/
    	}
    	a:hover {
    	color: #333; /*榧犳爣缁忚繃鐨勯鑹插彉鍖�*/
    	}
    	a:active {
    	color: #333; /*榧犳爣鎸変笅鐨勯鑹插彉鍖�*/
    	}
    	a{ text-decoration: none;}
    	
    	
    	
    	
    	.alert1 {
    	    width: 100%;
    	    height: 100%;
    	    position: fixed;
    	    left: 0;
    	    top: 0;
    	    z-index: 2000;
    	    background: rgba(0,0,0,0.75);
    	}
    	.yxinput{     width: 450px;
    	    height: 60px;
    	    border-radius: 60px;
    	    border: none;
    	    margin-left: 60px;
    	    background: #eee; margin-bottom: 20px; font-size: 28px; padding-left: 30px;}
    	
    	.yzm{    background: -webkit-linear-gradient(top, #df0012, #df0012);
    	    font-size: 26px;
    	    color: #fff;
    	    height: 100%;
    	    width: 152px;
    	    text-align: center;
    	    line-height: 62px;
    	    border-radius: 0 62px 62px 0;}
    	    
    	.load{ bottom: -50px; left: 285px; width: 190px; height: 40px; padding: 5px 0px; background: rgba(0,0,0,0.4); z-index: 9; border-radius:50px; color: #fff; font-size: 20px; -webkit-transition:all 300ms; }
    	.load img{ margin-right: 10px; width: 32px; }
    	
    	.pf {
    	    position: fixed;
    	}
    	
    	#iAlert {display:none;position:fixed;top:0;right:0;bottom:0;left:0;z-index:999;background-color:rgba(0,0,0,0.4);-moz-user-select:none;-webkit-user-select:none; }
    	#iAlert * {margin:0;padding:0;}
    	#iAlert .iAlert-box {position:absolute;top:50%;left:50%;width:270px;-webkit-transform:translate(-50%,-50%) scale(1.5); }
    	#iAlert .iAlert-box .iAlert-box-content {padding:15px;background-color:rgba(255,255,255,0.95);border-radius:7px 7px 0 0;}
    	#iAlert .iAlert-box .iAlert-box-content h2 {font-size:16px;line-height:1.3rem;text-align:center;color:#000;margin-bottom:0.5rem; display: none;}
    	#iAlert .iAlert-box .iAlert-box-content p {font-size:18px;line-height:1.2rem;text-align:center;color:#000;}
    	#iAlert .iAlert-box .iAlert-box-actions {height:44px;border-top:1px #bababb solid;overflow:hidden;}
    	#iAlert .iAlert-box .iAlert-box-actions-button {height:100%;font-size:16px;line-height:44px;text-align:center;color:#007aff;background-color:rgba(255,255,255,0.95);z-index:2;-webkit-tap-highlight-color:rgba(255,255,255,0);}
    	#iAlert .iAlert-box .iAlert-box-actions-button.noChoice {width:100%;border-radius:0 0 7px 7px;}
    	#iAlert .iAlert-box .iAlert-box-actions-button.negative {width:50%;border-radius:0 0 0 7px;float:left;margin-right:-1px;border-right:1px #bababb solid;}
    	#iAlert .iAlert-box .iAlert-box-actions-button.positive {width:50%;border-radius:0 0 7px 0;float:left;margin-right:-1px;border-left:1px #bababb solid;}
    	#iAlert .iAlert-box .iAlert-box-actions-button:hover {background-color:#d9d9d9;z-index:3;}
    	
    	.loading{ width: 100%; height: 100%; position: fixed; left: 0; top: 0; z-index: 10;}
    	.loading div{ background: rgba(0,0,0,0.75); width: 300px; height: 270px;padding: 15px 0; border-radius: 23px; font-size: 30px;}
    	.loading div img{    margin: 45px 0 50px;}
    	@keyframes rond {
    	  0% {opacity: 0.3;}
    	  50%{opacity: 1;}
    	  100% {opacity: 0.3;}
    	}
    	
    	@-webkit-keyframes rond {
    	 0% {opacity: 0.3;}
    	  50%{opacity: 1;}
    	  100% {opacity: 0.3;}
    	}
    	@-webkit-keyframes arrmove{
    	  0%{-webkit-transform:translateY(30px);transform:translateY(30px);opacity:1;}
    	  100%{-webkit-transform:translateY(0px);transform:translateY(0px);opacity:0;}
    	}
    	@-webkit-keyframes addmove{
    	  0%{opacity: 0;}
    	  50%{opacity: 1; top: -24px;}
    	  100%{opacity:0;top: -24px;}
    	}
    	@-webkit-keyframes ml{
    	  0%{right:-200px ;}
    	 
    	  100%{right: 1000px;}
    	}
    	
    	@-webkit-keyframes ww{
    		0%{opacity: 1; width: 0;}
    		
    		100%{opacity: 1; width:238px;}
    	}
    	@-webkit-keyframes www{
    		0%{opacity: 1; width: 0;}
    		
    		100%{opacity: 1; width:402px;}
    	}
    	/* loading */
    	@-webkit-keyframes spin{
    	  0%{-webkit-transform:rotate(0deg);}
    	  50%{-webkit-transform:rotate(-180deg);}
    	  100%{-webkit-transform:rotate(-360deg);}
    	}
    	@-webkit-keyframes rotate-top-right{
    	  0%{-webkit-transform:rotate(0deg);}
    	  50%{-webkit-transform:rotate(-180deg);-webkit-transform-origin:20% 20%;}
    	  100%{-webkit-transform:rotate(-360deg);}
    	}
    	@-webkit-keyframes rotate-top-left{
    	  0%{-webkit-transform:rotate(0deg);}
    	  50%{-webkit-transform:rotate(180deg);-webkit-transform-origin:80% 20%;}
    	  100%{-webkit-transform:rotate(360deg);}
    	}
    	@-webkit-keyframes rotate-bottom-right{
    	  0%{-webkit-transform:rotate(0deg);}
    	  50%{-webkit-transform:rotate(-180deg);-webkit-transform-origin:80% 80%;}
    	  100%{-webkit-transform:rotate(-360deg);}
    	}
    	@-webkit-keyframes rotate-bottom-left{
    	  0%{-webkit-transform:rotate(0deg);}
    	  50%{-webkit-transform:rotate(180deg);-webkit-transform-origin:20% 80%;}
    	  100%{-webkit-transform:rotate(360deg);}
    	}
    	@-moz-keyframes spin{
    	  0%{-moz-transform:rotate(0deg);}
    	  50%{-moz-transform:rotate(-180deg);}
    	  100%{-moz-transform:rotate(-360deg);}
    	}
    	@-moz-keyframes rotate-top-right{
    	  0%{-moz-transform:rotate(0deg);}
    	  50%{-moz-transform:rotate(-180deg);-moz-transform-origin:20% 20%;}
    	  100%{-moz-transform:rotate(-360deg);}
    	}
    	@-moz-keyframes rotate-top-left{
    	  0%{-moz-transform:rotate(0deg);}
    	  50%{-moz-transform:rotate(180deg);-moz-transform-origin:80% 20%;}
    	  100%{-moz-transform:rotate(360deg);}
    	}
    	@-moz-keyframes rotate-bottom-right{
    	  0%{-moz-transform:rotate(0deg);}
    	  50%{-moz-transform:rotate(-180deg);-moz-transform-origin:80% 80%;}
    	  100%{-moz-transform:rotate(-360deg);}
    	}
    	@-moz-keyframes rotate-bottom-left{
    	  0%{-moz-transform:rotate(0deg);}
    	  50%{-moz-transform:rotate(180deg);-moz-transform-origin:20% 80%;}
    	  100%{-moz-transform:rotate(360deg);}
    	}
    	@-webkit-keyframes scaleInUp{
    	  0%{-webkit-transform:scale3d(0,0,0);transform:scale3d(0,0,0);-webkit-transform-origin:bottom;transform-origin:bottom;opacity:0;}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);-webkit-transform-origin:bottom;transform-origin:bottom;opacity:1;}
    	}
    	@keyframes scaleInUp{
    	  0%{-webkit-transform:scale3d(0,0,0);transform:scale3d(0,0,0);-webkit-transform-origin:bottom;transform-origin:bottom;opacity:0;}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);-webkit-transform-origin:bottom;transform-origin:bottom;opacity:1;}
    	}
    	@-webkit-keyframes lightSpeedIn{
    	  0%{-webkit-transform:translate3d(100%,0,0) skewX(-30deg);transform:translate3d(100%,0,0) skewX(-30deg);opacity:0;}
    	  60%{-webkit-transform:skewX(20deg);transform:skewX(20deg);opacity:1;}
    	  80%{-webkit-transform:skewX(-5deg);transform:skewX(-5deg);opacity:1;}
    	  100%{-webkit-transform:none;transform:none;opacity:1;}
    	}
    	@keyframes lightSpeedIn{
    	  0%{-webkit-transform:translate3d(100%,0,0) skewX(-30deg);transform:translate3d(100%,0,0) skewX(-30deg);opacity:0;}
    	  60%{-webkit-transform:skewX(20deg);transform:skewX(20deg);opacity:1;}
    	  80%{-webkit-transform:skewX(-5deg);transform:skewX(-5deg);opacity:1;}
    	  100%{-webkit-transform:none;transform:none;opacity:1;}
    	}
    	
    	/* loading end */
    	@-webkit-keyframes music{
    	  0%{-webkit-transform:rotate(0);transform:rotate(0);}
    	  100%{-webkit-transform:rotate(360deg);transform:rotate(360deg);}
    	}
    	@-webkit-keyframes flash{
    	  0%,50%,100%{opacity:1;}
    	  25%,75%{opacity:0;}
    	}
    	@keyframes flash{
    	  0%,50%,100%{opacity:1;}
    	  25%,75%{opacity:0;}
    	}
    	@-webkit-keyframes flash1{
    	  0%,50%,100%{opacity:0;}
    	  25%,75%{opacity:1;}
    	}
    	@keyframes flash1{
    	  0%,50%,100%{opacity:0;}
    	  25%,75%{opacity:1;}
    	}
    	@-webkit-keyframes shake{
    	  0%,100%{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
    	  10%,30%,50%,70%,90%{-webkit-transform:translate3d(-10px,0,0);transform:translate3d(-10px,0,0)}
    	  20%,40%,60%,80%{-webkit-transform:translate3d(10px,0,0);transform:translate3d(10px,0,0)}
    	}
    	@keyframes shake{
    	  0%,100%{-webkit-transform:translate3d(0,0,0);-ms-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
    	  10%,30%,50%,70%,90%{-webkit-transform:translate3d(-10px,0,0);-ms-transform:translate3d(-10px,0,0);transform:translate3d(-10px,0,0)}
    	  20%,40%,60%,80%{-webkit-transform:translate3d(10px,0,0);-ms-transform:translate3d(10px,0,0);transform:translate3d(10px,0,0)}
    	}
    	@-webkit-keyframes arr{
    	  0%{-webkit-transform:translateX(0);transform:translateX(0);opacity:1;}
    	  50%{-webkit-transform:translateX(-10px);transform:translateX(-10px);}
    	  100%{-webkit-transform:translateX(0);transform:translateX(0);}
    	}
    	@keyframes arr{
    	  0%{-webkit-transform:translateX(0);transform:translateX(0);opacity:1;}
    	  50%{-webkit-transform:translateX(-10px);transform:translateX(-10px);}
    	  100%{-webkit-transform:translateX(0);transform:translateX(0);}
    	}
    	@-webkit-keyframes arr1{
    	  0%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1;}
    	  50%{-webkit-transform:translateY(-10px);transform:translateY(-10px);}
    	  100%{-webkit-transform:translateY(0);transform:translateY(0);}
    	}
    	@keyframes arr1{
    	  0%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1;}
    	  50%{-webkit-transform:translateY(-10px);transform:translateY(-10px);}
    	  100%{-webkit-transform:translateY(0);transform:translateY(0);}
    	}
    	@-webkit-keyframes arr2{
    	  0%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1;}
    	  100%{-webkit-transform:translateY(30px);transform:translateY(30px);opacity:0;}
    	}
    	@keyframes arr2{
    	  0%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1;}
    	  100%{-webkit-transform:translateY(30px);transform:translateY(30px);opacity:0;}
    	}
    	@-webkit-keyframes zoomIn{
    	  0%{opacity:0;-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}
    	  50%,100%{opacity:1;}
    	}
    	@keyframes zoomIn{
    	  0%{opacity:0;-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}
    	  50%,100%{opacity:1;}
    	}
    	@-webkit-keyframes zoomInBig{
    	  0%{-webkit-transform:scale3d(5,5,5);transform:scale3d(5,5,5);opacity:1;}
    	  50%,100%{opacity:1;}
    	}
    	@-webkit-keyframes zoomInBig{
    	  0%{-webkit-transform:scale3d(5,5,5);transform:scale3d(5,5,5);opacity:1;}
    	  50%,100%{opacity:1;}
    	}
    	@-webkit-keyframes zoomInscale{
    	  0%{-webkit-transform:rotate(360deg) scale3d(.1,.1,.1);-webkit-transform-origin:center center;transform:rotate(360deg) scale3d(.1,.1,.1);opacity:0;transform-origin:center;}
    	  50%,100%{-webkit-transform-origin:center center;transform-origin:center;opacity:1;}
    	}
    	@-webkit-keyframes rotate3d360{
    	  0%{-webkit-transform:rotateY(360deg) perspective(300);transform:rotateY(360deg) perspective(300);opacity:1;}
    	  100%{-webkit-transform:none;transform:none;opacity:1;}
    	}
    	@keyframes rotate3d360{
    	  0%{-webkit-transform:rotateY(360deg) perspective(300);transform:rotateY(360deg) perspective(300);opacity:1;}
    	  100%{-webkit-transform:none;transform:none;opacity:1;}
    	}
    	@-webkit-keyframes zoomInscale{
    	  0%{-webkit-transform:rotate(360deg) scale3d(.1,.1,.1);transform:rotate(360deg) scale3d(.1,.1,.1);opacity:0;}
    	  50%,100%{opacity:1;}
    	}
    	@-webkit-keyframes bounceIn{
    	  0%,20%,40%,60%,80%,100%{-webkit-transition-timing-function:cubic-bezier(.215,.610,.355,1.000);transition-timing-function:cubic-bezier(.215,.610,.355,1.000);}
    	  0%{-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}
    	  20%{-webkit-transform:scale3d(1.1,1.1,1.1);transform:scale3d(1.1,1.1,1.1);}
    	  40%{-webkit-transform:scale3d(.9,.9,.9);transform:scale3d(.9,.9,.9);}
    	  60%{-webkit-transform:scale3d(1.03,1.03,1.03);transform:scale3d(1.03,1.03,1.03);opacity:1;}
    	  80%{-webkit-transform:scale3d(.97,.97,.97);transform:scale3d(.97,.97,.97);}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);opacity:1;}
    	}
    	@keyframes bounceIn{
    	  0%,20%,40%,60%,80%,100%{-webkit-transition-timing-function:cubic-bezier(.215,.610,.355,1.000);transition-timing-function:cubic-bezier(.215,.610,.355,1.000);}
    	  0%{-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}
    	  20%{-webkit-transform:scale3d(1.1,1.1,1.1);transform:scale3d(1.1,1.1,1.1);}
    	  40%{-webkit-transform:scale3d(.9,.9,.9);transform:scale3d(.9,.9,.9);}
    	  60%{-webkit-transform:scale3d(1.03,1.03,1.03);transform:scale3d(1.03,1.03,1.03);opacity:1;}
    	  80%{-webkit-transform:scale3d(.97,.97,.97);transform:scale3d(.97,.97,.97);}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);opacity:1;}
    	}
    	@-webkit-keyframes bounceInDown{
    	  0%,60%,75%,90%,100%{-webkit-animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000)}
    	  0%{opacity:0;-webkit-transform:translate3d(0,-3000px,0);transform:translate3d(0,-3000px,0)}
    	  60%{opacity:1;-webkit-transform:translate3d(0,25px,0);transform:translate3d(0,25px,0)}
    	  75%{-webkit-transform:translate3d(0,-10px,0);transform:translate3d(0,-10px,0)}
    	  90%{-webkit-transform:translate3d(0,5px,0);transform:translate3d(0,5px,0)}
    	  100%{-webkit-transform:none;transform:none;opacity:1;}
    	}
    	@keyframes bounceInDown{
    	  0%,60%,75%,90%,100%{-webkit-animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000)}
    	  0%{opacity:0;-webkit-transform:translate3d(0,-3000px,0);transform:translate3d(0,-3000px,0)}
    	  60%{opacity:1;-webkit-transform:translate3d(0,25px,0);transform:translate3d(0,25px,0)}
    	  75%{-webkit-transform:translate3d(0,-10px,0);transform:translate3d(0,-10px,0)}
    	  90%{-webkit-transform:translate3d(0,5px,0);transform:translate3d(0,5px,0)}
    	  100%{-webkit-transform:none;transform:none;opacity:1;}
    	}
    	@-webkit-keyframes bounceInUp{
    	  0%,60%,75%,90%,100%{-webkit-animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000)}
    	  0%{opacity:0;-webkit-transform:translate3d(0,3000px,0);transform:translate3d(0,3000px,0)}
    	  60%{opacity:1;-webkit-transform:translate3d(0,-20px,0);transform:translate3d(0,-20px,0)}
    	  75%{-webkit-transform:translate3d(0,10px,0);transform:translate3d(0,10px,0)}
    	  90%{-webkit-transform:translate3d(0,-5px,0);transform:translate3d(0,-5px,0)}
    	  100%{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);opacity:1;}
    	}
    	@keyframes bounceInUp{
    	  0%,60%,75%,90%,100%{-webkit-animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000)}
    	  0%{opacity:0;-webkit-transform:translate3d(0,3000px,0);transform:translate3d(0,3000px,0)}
    	  60%{opacity:1;-webkit-transform:translate3d(0,-20px,0);transform:translate3d(0,-20px,0)}
    	  75%{-webkit-transform:translate3d(0,10px,0);transform:translate3d(0,10px,0)}
    	  90%{-webkit-transform:translate3d(0,-5px,0);transform:translate3d(0,-5px,0)}
    	  100%{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);opacity:1;}
    	}
    	@-webkit-keyframes flipInY{
    	  0%{-webkit-transform:perspective(400px) rotate3d(0,1,0,90deg);transform:perspective(400px) rotate3d(0,1,0,90deg);-webkit-transition-timing-function:ease-in;transition-timing-function:ease-in;opacity:0;}
    	  100%{-webkit-transform:perspective(400px);transform:perspective(400px);opacity:1;}
    	}
    	@keyframes flipInY{
    	  0%{-webkit-transform:perspective(400px) rotate3d(0,1,0,90deg);transform:perspective(400px) rotate3d(0,1,0,90deg);-webkit-transition-timing-function:ease-in;transition-timing-function:ease-in;opacity:0;}
    	  100%{-webkit-transform:perspective(400px);transform:perspective(400px);opacity:1;}
    	}
    	@-webkit-keyframes flipInX{
    	  0%{-webkit-transform:perspective(400px) rotate3d(1,0,0,90deg);transform:perspective(400px) rotate3d(1,0,0,90deg);-webkit-transition-timing-function:ease-in;transition-timing-function:ease-in;opacity:0;}
    	  100%{-webkit-transform:perspective(400px);transform:perspective(400px);opacity:1;}
    	}
    	@keyframes flipInX{
    	  0%{-webkit-transform:perspective(400px) rotate3d(1,0,0,90deg);transform:perspective(400px) rotate3d(1,0,0,90deg);-webkit-transition-timing-function:ease-in;transition-timing-function:ease-in;opacity:0;}
    	  100%{-webkit-transform:perspective(400px);transform:perspective(400px);opacity:1;}
    	}
    	@-webkit-keyframes FbQ{
    	  0%,100%{-webkit-transform:translate3d(0,0px,0);transform:translate3d(0,0px,0);}
    	  50%{-webkit-transform:translate3d(45px,0,0);transform:translate3d(45px,0,0);}
    	}
    	@keyframes FbQ{
    	  0%,100%{-webkit-transform:translate3d(0,0px,0);transform:translate3d(0,0px,0);}
    	  50%{-webkit-transform:translate3d(45px,0,0);transform:translate3d(45px,0,0);}
    	}
    	@-webkit-keyframes fadeInUp{
    	  0%{opacity:0;-webkit-transform:translate3d(0,100%,0);transform:translate3d(0,100%,0);}
    	  100%{opacity:1;-webkit-transform:none;transform:none;}
    	}
    	@keyframes fadeInUp{
    	  0%{opacity:0;-webkit-transform:translate3d(0,100%,0);-ms-transform:translate3d(0,100%,0);transform:translate3d(0,100%,0);}
    	  100%{opacity:1;-webkit-transform:none;-ms-transform:none;transform:none;}
    	}
    	@-webkit-keyframes fadeInDown{
    	  0%{opacity:0;-webkit-transform:translate3d(0,-100%,0);transform:translate3d(0,-100%,0);}
    	  100%{opacity:1;-webkit-transform:none;transform:none;}
    	}
    	@keyframes fadeInDown{
    	  0%{opacity:0;-webkit-transform:translate3d(0,-100%,0);transform:translate3d(0,-100%,0);}
    	  100%{opacity:1;-webkit-transform:none;transform:none;}
    	}
    	@-webkit-keyframes flipy{
    	  0%{-webkit-transform:rotateY(-90deg);transform:rotateY(-90deg);opacity:1;}
    	  100%{-webkit-transform:rotateY(0deg);transform:rotateY(0deg);opacity:1;}
    	}
    	@keyframes flipy{
    	  0%{-webkit-transform:rotateY(-90deg);transform:rotateY(-90deg);opacity:1;}
    	  100%{-webkit-transform:rotateY(0deg);transform:rotateY(0deg);opacity:1;}
    	}
    	@-webkit-keyframes flipx{
    	  0%{-webkit-transform:rotateX(-90deg);transform:rotateX(-90deg);opacity:1;}
    	  100%{-webkit-transform:rotateX(0deg);transform:rotateX(0deg);opacity:1;}
    	}
    	@keyframes flipx{
    	  0%{-webkit-transform:rotateX(-90deg);transform:rotateX(-90deg);opacity:1;}
    	  100%{-webkit-transform:rotateX(0deg);transform:rotateY(0deg);opacity:1;}
    	}
    	@-webkit-keyframes rotateInfite{
    	  0%{-webkit-transform:rotate(0);transform:rotate(0);}
    	  100%{-webkit-transform:rotate(360deg);transform:rotate(360deg);}
    	}
    	@keyframes rotateInfite{
    	  0%{-webkit-transform:rotate(0);transform:rotate(0);}
    	  100%{-webkit-transform:rotate(360deg);transform:rotate(360deg);}
    	}
    	@-webkit-keyframes fadeInUp{
    	  0%{-webkit-transform:translateY(100%);transform:translateY(100%);opacity:0;}
    	  100%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1;}
    	}
    	@keyframes fadeInUp{
    	  0%{-webkit-transform:translateY(100%);transform:translateY(100%);opacity:0;}
    	  100%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1;}
    	}
    	@-webkit-keyframes fadeInLeft{
    	  0%{-webkit-transform:translateX(-100%);transform:translateX(-100%);opacity:0;}
    	  100%{-webkit-transform:translateX(0);transform:translateX(0);opacity:1;}
    	}
    	@keyframes fadeInLeft{
    	  0%{-webkit-transform:translateX(-100%);transform:translateX(-100%);opacity:0;}
    	  100%{-webkit-transform:translateX(0);transform:translateX(0);opacity:1;}
    	}
    	@-webkit-keyframes fadeInRight{
    	  0%{-webkit-transform:translateX(100%);transform:translateX(100%);opacity:0;}
    	  100%{-webkit-transform:translateX(0);transform:translateX(0);opacity:1;}
    	}
    	@keyframes fadeInRight{
    	  0%{-webkit-transform:translateX(100%);transform:translateX(100%);opacity:0;}
    	  100%{-webkit-transform:translateX(0);transform:translateX(0);opacity:1;}
    	}
    	@-webkit-keyframes roateScale{
    	  0%{-webkit-transform:scale3d(.1,.1,.1);transform:scale(.1,.1,.1);-webkit-transform-origin:top center;transform-origin:top center;opacity:0;}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);-webkit-transform-origin:top center;transform-origin:top center;opacity:1;}
    	}
    	@keyframes roateScale{
    	  0%{-webkit-transform:rotate(0);transform:rotate(0);}
    	  100%{-webkit-transform:rotate(360deg);transform:rotate(360deg);}
    	}
    	@-webkit-keyframes fadeIn{
    	  0%{opacity:0;}
    	  100%{opacity:1;}
    	}
    	@keyframes fadeIn{
    	  0%{opacity:0;}
    	  100%{opacity:1;}
    	}
    	@-webkit-keyframes bounce{
    	  0%,100%,20%,53%,80%{-webkit-transition-timing-function:cubic-bezier(0.215,.61,.355,1);transition-timing-function:cubic-bezier(0.215,.61,.355,1);-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
    	  40%,43%{-webkit-transition-timing-function:cubic-bezier(0.755,.050,.855,.060);transition-timing-function:cubic-bezier(0.755,.050,.855,.060);-webkit-transform:translate3d(0,-30px,0);transform:translate3d(0,-30px,0)}
    	  70%{-webkit-transition-timing-function:cubic-bezier(0.755,.050,.855,.060);transition-timing-function:cubic-bezier(0.755,.050,.855,.060);-webkit-transform:translate3d(0,-15px,0);transform:translate3d(0,-15px,0)}
    	  90%{-webkit-transform:translate3d(0,-4px,0);transform:translate3d(0,-4px,0)}
    	  100%{opacity:1;}
    	}
    	@keyframes bounce{
    	  0%,100%,20%,53%,80%{-webkit-transition-timing-function:cubic-bezier(0.215,.61,.355,1);transition-timing-function:cubic-bezier(0.215,.61,.355,1);-webkit-transform:translate3d(0,0,0);-ms-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
    	  40%,43%{-webkit-transition-timing-function:cubic-bezier(0.755,.050,.855,.060);transition-timing-function:cubic-bezier(0.755,.050,.855,.060);-webkit-transform:translate3d(0,-30px,0);-ms-transform:translate3d(0,-30px,0);transform:translate3d(0,-30px,0)}
    	  70%{-webkit-transition-timing-function:cubic-bezier(0.755,.050,.855,.060);transition-timing-function:cubic-bezier(0.755,.050,.855,.060);-webkit-transform:translate3d(0,-15px,0);-ms-transform:translate3d(0,-15px,0);transform:translate3d(0,-15px,0)}
    	  90%{-webkit-transform:translate3d(0,-4px,0);-ms-transform:translate3d(0,-4px,0);transform:translate3d(0,-4px,0)}
    	  100%{opacity:1;}
    	}
    	@-webkit-keyframes tada{
    	  0%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);}
    	  10%,20%{-webkit-transform:scale3d(.9,.9,.9) rotate3d(0,0,1,-3deg);transform:scale3d(.9,.9,.9) rotate3d(0,0,1,-3deg);}
    	  30%,50%,70%,90%{-webkit-transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,3deg);transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,3deg);}
    	  40%,60%,80%{-webkit-transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,-3deg);transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,-3deg);}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);}
    	}
    	@keyframes tada{
    	  0%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);}
    	  10%,20%{-webkit-transform:scale3d(.9,.9,.9) rotate3d(0,0,1,-3deg);transform:scale3d(.9,.9,.9) rotate3d(0,0,1,-3deg);}
    	  30%,50%,70%,90%{-webkit-transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,3deg);transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,3deg);}
    	  40%,60%,80%{-webkit-transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,-3deg);transform:scale3d(1.1,1.1,1.1) rotate3d(0,0,1,-3deg);}
    	  100%{-webkit-transform:scale3d(1,1,1);transform:scale3d(1,1,1);}
    	}
    	@media screen and (max-height:900px){
    	  .sect-inner{height:900px;-webkit-transform:scale3d(.9,.9,.9);transform:scale3d(.9,.9,.9);}
    	}
    	
    	@-webkit-keyframes xf{
    		0%{-webkit-transform: translate3d(0, 0, 0);}
    		50%{-webkit-transform: translate3d(0, 15px, 0);}
    		100%{-webkit-transform: translate3d(0px, 0, 0);}
    	}
    	@-webkit-keyframes showme{
    		0%{opacity: 0;}
    		50%{opacity: 1;}
    		100%{opacity: 0;}
    	}
    	@-webkit-keyframes showme1{
    		0%{opacity: 0;}
    		
    		100%{opacity: 1;}
    	}
    	@-webkit-keyframes movex{
    		0%{opacity:0;-webkit-transform: translate3d(20px, 0, 0);}
    		50%{opacity:1;-webkit-transform: translate3d(0, 0, 0);}
    		100%{opacity:0;-webkit-transform: translate3d(-20px, 0, 0);}
    	}
    	@-webkit-keyframes movey{
    		0%{opacity:0;-webkit-transform: translate3d(0, 20px, 0);}
    		50%{opacity:1;-webkit-transform: translate3d(0, 0, 0);}
    		100%{opacity:0;-webkit-transform: translate3d(0, -20px, 0);}
    	}
    	@keyframes star-ani {  
    	    0% {  
    	        opacity: 0;  
    	        transform: scale(1) rotate(0) translate3d(-10px, -10px, 0);  
    	    }  
    	    50% {  
    	        opacity: 1;  
    	        transform: scale(1) rotate(0) translate3d(20px, 20px, 0);  
    	    }  
    	    100% {  
    	        opacity: 0;  
    	        transform: scale(1) rotate(0) translate3d(50px, 50px, 0);  
    	    }  
    	}  
    	@-webkit-keyframes showme1{
    		0%{opacity: 0;}
    		
    		100%{opacity: 1;}
    	}
    	@-webkit-keyframes hh{
    		0%{opacity: 1; height: 0;}
    		
    		100%{opacity: 1; height:750px;}
    	}
    	
    	@-webkit-keyframes hhh{
    		0%{opacity: 1; height: 0;}
    		70%{opacity: 1; height: 332px;}
    		75%{opacity: 1; height: 465px;}
    		100%{opacity: 1; height:545px;}
    	}
	</style>
</html>
