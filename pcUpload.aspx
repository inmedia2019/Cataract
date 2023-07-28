<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pcUpload.aspx.cs" Inherits="pcUpload" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style/style.css?v1" />
    <link rel="stylesheet" type="text/css" href="style/swiper.min.css" />
    <script src="//imgcache.qq.com/open/qcloud/js/vod/sdk/ugcUploader.js"></script>
    <script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/iAlert.js" type="text/javascript" charset="utf-8"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <style type="text/css">
        html, body
        {
            overflow: auto;
            background: url(img/bg2.jpg) no-repeat center;
            background-size: 100% auto;
	    height: auto;
        }

        .yqrzx.off{
            pointer-events: none;
            -webkit-filter: grayscale(100%);
            -moz-filter: grayscale(100%);
            -ms-filter: grayscale(100%);
            -o-filter: grayscale(100%);
            filter: grayscale(100%);
            filter: gray;
        }
    </style>
</head>
<body>
    <div class="pf pctop">
			<div class="pctopbg1"></div>
			<div class="pctopbg2 center">
				<div class="w1200 fs30 cfff ovh">
					<div class="center fl">
						<img style="margin-right: 20px; width: 213px;" src="img/logo.png?v1" >
						白内障手术达人赛视频上传
					</div>
				</div>
			</div>
		</div>
    <div class="h101">
    </div>
    <div class="h30">
    </div>
	
    <div class="w1200 ovh">
        <div class="fl pcfl">

	<img width="100%" style="border-radius:10px ;" src="img/signupi1.png" >
    <div class="h20"></div>
            <div class="bfff bor1200 p1220 f18">
                <div class="h10">
                </div>
                个人信息
                <div class="h10">
                </div>
            </div>
            <div class="h1">
            </div>
            <div class="bfff bor0012 p1220 f18">
                <div class="center pcinput">
                    <div class="pcinputname">
                        姓名：</div>
                    <input type="text" id="name" value="<%=name %>" /><div style=" width: 100px;"></div>
                </div>
                <div class="center pcinput">
                    <div class="pcinputname">
                        医院：</div>
                    <input type="text" id="hospital" value="<%=hospital %>" /><div style=" width: 100px;"></div>
                </div>
                <div class="center pcinput">
                    <div class="pcinputname">
                        省份：</div>
                    <select id="province">
                        <option value="0">请选择</option>
                        <option value="北京" <%=province=="北京"?"selected='selected'":"" %>>北京</option>
                        <option value="上海" <%=province=="上海"?"selected='selected'":"" %>>上海</option>
                        <option value="天津" <%=province=="天津"?"selected='selected'":"" %>>天津</option>
                        <option value="重庆" <%=province=="重庆"?"selected='selected'":"" %>>重庆</option>
                        <option value="四川" <%=province=="四川"?"selected='selected'":"" %>>四川</option>
                        <option value="贵州" <%=province=="贵州"?"selected='selected'":"" %>>贵州</option>
                        <option value="云南" <%=province=="云南"?"selected='selected'":"" %>>云南</option>
                        <option value="西藏" <%=province=="西藏"?"selected='selected'":"" %>>西藏</option>
                        <option value="河南" <%=province=="河南"?"selected='selected'":"" %>>河南</option>
                        <option value="湖北" <%=province=="湖北"?"selected='selected'":"" %>>湖北</option>
                        <option value="湖南" <%=province=="湖南"?"selected='selected'":"" %>>湖南</option>
                        <option value="广东" <%=province=="广东"?"selected='selected'":"" %>>广东</option>
                        <option value="广西" <%=province=="广西"?"selected='selected'":"" %>>广西</option>
                        <option value="陕西" <%=province=="陕西"?"selected='selected'":"" %>>陕西</option>
                        <option value="甘肃" <%=province=="甘肃"?"selected='selected'":"" %>>甘肃</option>
                        <option value="青海" <%=province=="青海"?"selected='selected'":"" %>>青海</option>
                        <option value="宁夏" <%=province=="宁夏"?"selected='selected'":"" %>>宁夏</option>
                        <option value="新疆" <%=province=="新疆"?"selected='selected'":"" %>>新疆</option>
                        <option value="河北" <%=province=="河北"?"selected='selected'":"" %>>河北</option>
                        <option value="山西" <%=province=="山西"?"selected='selected'":"" %>>山西</option>
                        <option value="内蒙古" <%=province=="内蒙古"?"selected='selected'":"" %>>内蒙古</option>
                        <option value="江苏" <%=province=="江苏"?"selected='selected'":"" %>>江苏</option>
                        <option value="浙江" <%=province=="浙江"?"selected='selected'":"" %>>浙江</option>
                        <option value="安徽" <%=province=="安徽"?"selected='selected'":"" %>>安徽</option>
                        <option value="福建" <%=province=="福建"?"selected='selected'":"" %>>福建</option>
                        <option value="江西" <%=province=="江西"?"selected='selected'":"" %>>江西</option>
                        <option value="山东" <%=province=="山东"?"selected='selected'":"" %>>山东</option>
                        <option value="辽宁" <%=province=="辽宁"?"selected='selected'":"" %>>辽宁</option>
                        <option value="吉林" <%=province=="吉林"?"selected='selected'":"" %>>吉林</option>
                        <option value="黑龙江" <%=province=="黑龙江"?"selected='selected'":"" %>>黑龙江</option>
                        <option value="海南" <%=province=="海南"?"selected='selected'":"" %>>海南</option>
                        <option value="台湾" <%=province=="台湾"?"selected='selected'":"" %>>台湾</option>
                        <option value="香港" <%=province=="香港"?"selected='selected'":"" %>>香港</option>
                        <option value="澳门" <%=province=="澳门"?"selected='selected'":"" %>>澳门</option>
                    </select>
                    <div style=" width: 100px;"></div>
                </div>
                 <div class="center pcinput">
                    <div class="pcinputname">
                        超声乳化手术经验：</div>
                    <input style="" type="text" id="txtYear" value="<%=yearInfo %>" /><div style=" width: 100px;">年</div>
                </div>
                 <div class="center pcinput">
                    <div class="pcinputname">
                        屈光性白内障<span style="color:rgb(223, 32, 25)">手术总量</span>：</div>
                    <input type="text" style="" id="txtNum" value="<%=tNumInfo %>" /><div style=" width: 100px;">例</div>
                </div>
                <div class="center pcinput">
                    <div class="pcinputname">
                        强生眼力健负责销售：</div>
                    <input type="text" id="qiangsheng" value="<%=qiangsheng %>" /><div style=" width: 100px;"></div>
                </div>
                <div class="center pcinput">
                    <div class="pcinputname">
                        参赛标题：</div>
                    <input type="text" id="videotitle" value="<%=videotitle %>" /><div style=" width: 100px;"></div>
                </div>
                <div class="center pcinput">
                    <div class="pcinputname">
                        手术描述：</div>
                    <textarea rows="" id="descript" cols="" style="height: 100px; font: 18px/1.5 Tahoma, Helvetica, Arial,\5fae\8f6f\96c5\9ed1, sans-serif;"><%=descriptInfo %></textarea><div style=" width: 100px;"></div>
                </div>
                <div class="dn">
                    <div class="center pcinput">
                    <div class="pcinputname">
                        手术类型：</div>
                    <select id="describe">
                        <option value="0">请选择</option>
                        <option value="1" <%=describe=="1"?"selected='selected'":"" %>>青光眼合并白内障</option>
                        <option value="2" <%=describe=="2"?"selected='selected'":"" %>>糖尿病合并白内障</option>
                        <option value="3" <%=describe=="3"?"selected='selected'":"" %>>高度近视白内障</option>
                        <option value="4" <%=describe=="4"?"selected='selected'":"" %>>小瞳孔白内障</option>
                        <option value="5" <%=describe=="5"?"selected='selected'":"" %>>伴有晶状体位置异常的白内障</option>
                        <option value="6" <%=describe=="6"?"selected='selected'":"" %>>外伤性白内障</option>
                        <option value="7" <%=describe=="7"?"selected='selected'":"" %>>儿童白内障</option>
                        <option value="8" <%=describe=="8"?"selected='selected'":"" %>>其他</option>
                    </select>
                    <div style=" width: 100px;"></div>
                </div>
                <div class="center pcinput isdescribe">
                    <div class="pcinputname">
                        输入类型：</div>
                    <input type="text" id="describetext" value="<%=describetext %>" />
                </div>
                </div>
                <div class="h20">
                </div>
            </div>
            <div class="h20">
            </div>
            <div class="bfff bor1200 p1220 f18">
                <div class="h10">
                </div>
                <div class="ovh">
                    <div class="center fl">
                        <div>
                            上传视频</div>
                        <div class="f16 o65" style="margin-left: 20px;">
                            视频格式要求： WMV、RM、MOV、MPEG、MP4、3GP、FLV、AVI、RMVB 等格式 ，文件小于2G，线上比赛采用盲评方式，视频及病例幻灯片中请勿出现医院及参赛医生的信息，谢谢配合！</div>
                    </div>
                </div>
                <div class="h10">
                </div>
            </div>
            <div class="h1">
            </div>
            <div class="bfff bor0012 p1220 f18">
                <div class="pcinput">
                    
                    <div class="pcvideo ovh pr" style="padding-bottom: 35px; margin-left: 64px; width: auto;">
                        <div class="pcvideoup center bor5 cp pr fl">
                            <input type="hidden" id="hfVideoId" value="<%=videoId %>" />
                            <input type="hidden" id="hfVideoUrl" value="<%=videoUrl %>" />
                            <input onchange="upload(this)" class="pa" type="file" accept="video/*" multiple />
                            <div class="">
                                <div class="center upvideo">
                                    <img width="44" src="img/upvideo.png">
                                </div>
                                <div class="h10">
                                </div>
                                <div class="tec f18">
                                    <%=videoId==""?"上传视频":"重新上传" %></div>
                            </div>
                        </div>
		<a target="_blank" class="pa" style="bottom: 0px; left: 0px;color: rgba(223,32,25,1); display:none;" href="pcvideo.html?id=<%=videoId %>">请查看文件</a>
                        <div class="fl" style="margin-left: 160px; margin-top: 50px;">
                            <div style="width: 190px;">
                                <!-- <div class="pcsqdload center pr" style="color: #fff;">
                                    <div class="icon2" style="-webkit-transform: rotate(180deg);">
                                    </div>
                                    专家授权书上传<input type="hidden" id="hfVideoBook" value="<%=bookInfo %>" />
                                    <input class="pa whtl0" style="width: 100%; height: 30px; opacity: 0;" id="book" name="book" type="file"
                                        accept="" multiple />
                                </div>
                                <span style="color:Red;" id="spT"></span>
		<a target="_blank" href="upload/<%=bookInfo %>" style="color: rgba(223,32,25,1); margin-top: 10px;    font-size: 14px;<%=bookInfo==""?"display:none;":"" %>">请查看文件</a>
                                <div class="h20">
                                </div> -->
                                <div class="pcmbdload center pr cp" style=" color: #fff; background: rgba(223,32,25,1); border-radius: 6px; border: 1px solid rgba(223,32,25,1);">
                                    <div>
                                        <svg t="1644828072129" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2083" width="22" height="22"><path d="M156.7 473.5l327.9-327.9V737c0 15.2 12.3 27.5 27.5 27.5s27.5-12.3 27.5-27.5V145.7l327.9 327.9c5.4 5.4 12.4 8 19.4 8 7 0 14.1-2.7 19.4-8 10.7-10.7 10.7-28.1 0-38.8L531.4 60c-10.7-10.7-28.1-10.7-38.8 0L117.8 434.7c-10.7 10.7-10.7 28.1 0 38.8 10.8 10.8 28.2 10.8 38.9 0z m839.8 443.7h-969C12.3 917.2 0 929.5 0 944.6c0 15.2 12.3 27.5 27.5 27.5h969.1c15.2 0 27.5-12.3 27.5-27.5-0.1-15.1-12.4-27.4-27.6-27.4z" fill="#ffffff" p-id="2084" data-spm-anchor-id="a313x.7781069.0.i0" class="selected"></path></svg>
                                    </div>
                                    病例幻灯片上传<input type="hidden" id="hfDemo" value="<%=demoInfo %>" />
                                    <input class="pa whtl0" style="width: 100%; height: 30px; opacity: 0;" id="demo" name="demo" type="file"
                                        accept="" multiple />
                                </div>
                                <span style="color:Red;" id="spD"></span>
	                        	<a target="_blank" href="upload/<%=demoInfo %>" style="color: rgba(223,32,25,1); margin-top: 10px; font-size: 14px; <%=demoInfo==""?"display:none;":"" %>">请查看文件</a>
                                <a href="dow/2022达人赛病例范例.pdf" target="_blank"  class="ter cp" style="color:#92b1dd; margin-top: 2px;display: block;">参考示例</a>
                            </div>
                            <!--<div style="color:Red; font-size:14px; margin-top:10px; width: 190px;">* 病例PPT中请勿叠加图片，勿添加动画效果。</div>-->
                        </div>
                        <div class="fl dn" style="margin-left: 40px; height: 195px;">
                            <div style="width: 190px;">
                                <div class="pcsqdload center pr" style="color: #fff;">
                                    <div class="icon2" style="-webkit-transform: rotate(180deg);">
                                    </div>
                                    专家授权书附件<input type="hidden" id="hfsqUrl" value="<%=sqUrl %>" />
                                    <input class="pa whtl0" style="width: 100%; height: 30px; opacity: 0;" id="sqUrl" name="sqUrl" type="file"
                                        accept="" multiple />
                                </div>
                                <span style="color:Red;" id="spU"></span>
		<a target="_blank" href="upload/<%=sqUrl %>" style="color: rgba(223,32,25,1); margin-top: 10px;    font-size: 14px;<%=sqUrl==""?"display:none;":"" %>">请查看文件</a>
                               
                            </div>
                        </div>
                    </div>
                </div>
                

                <div class="" style=" padding-left: 65px;">
                    <%=backReson %>
                  <%--  驳回说明：
                    <br />抱歉，您的视频未通过审核，根据规范调整并重新提交。
                    <br />抱歉，您的个人信息未通过审核，根据规范调整并重新提交。
                    <br />抱歉，您的病例幻灯片未通过审核，根据规范调整并重新提交。--%>
                </div>

                <div class="h30">
                </div>

            </div>
            <div class="" style="height: 50px;">
            </div>
            <div class="center f18">
            <input type="hidden" id="pptContent" value="<%=pptContent.Replace("\"","&quot;") %>" />
                <div data-type="<%=isShow%>" class="qcqrtj cfff center cp" >
                    确认提交</div>
                <div style="width: 100px;">
                </div>
                <div class="qcgz center cp">
                    比赛规则及隐私</div>
            </div>
            <div class="" style="height: 50px;">
            </div>
        </div>


        <!--
            全国预选赛比赛规则
1.2022第四届白内障达人赛重磅上线，覆盖全国各个省市，联动眼科知名大咖专家，共同推动屈光性白内障领域发展。
2.网络预选赛：线上面向全国收集屈光性白内障手术病例，每个参赛作品将获得全国知名白内障专家的专业评分及点评。
3.通过盲评，筛选出前24名参赛选手进入线下半决赛。
4.对未入选病例提供“创作激励”。
        -->
        <div class="fr pcfr">
            <div class="bfff bor1200 p1220 f18">
                <div class="h10">
                </div>
                线上初赛比赛规则
                <div class="h10">
                </div>
            </div>
            <div class="h1">
            </div>
            <div class="bfff bor0012 p1220 f18">
                <div>
	<p style="margin-bottom: 20px;">1.2022第四届白内障达人赛重磅上线，覆盖全国各个省市，联动眼科知名大咖专家，共同推动屈光性白内障领域发展。</p>
	<p style="margin-bottom: 20px;">2.网络预选赛：线上面向全国收集屈光性白内障手术病例，每个参赛作品将获得全国知名白内障专家的专业评分及点评。</p>
	<p style="margin-bottom: 20px;">3.通过盲评，筛选出前24名参赛选手进入线下半决赛。</p>
    <p>4.对未入选病例提供“创作激励”。</p>
	</div>
                <div class="h20">
                </div>
                <!-- <a href="dow/达人赛专家授权书.docx" class="pcsqdload center">
                    <div class="icon2">
                    </div>
                    视频授权书下载 </a>
                <div class="h20">
                </div> -->
                <a href="dow/2022年强生白内障达人赛--病例模板.pptx" target="_blank" class="pcmbdload center">
                    <div class="icon2">
                    </div>
                    病例模板下载 </a>
                <div class="h20">
                </div>
            </div>
        </div>
    </div>
	<div class="tk" id="gz">
		<div class="h100 center">
			<div class="pr" style="padding: 20px; height: 90%; max-width: 1000px; background: #fff; border-radius: 5px;">
				<div class="pa center gb" style="cursor:pointer; top: 10px; right: 10px; width: 40px; height: 40px; background: #DF2019; border-radius: 100px; color: #fff; z-index: 3; font-size: 20px;">X</div>
				<div class="h100" style="overflow-y: auto; overflow-x: hidden;">
					<div style="font-size: 20px; text-align: center; margin-bottom: 10px;">
						隐私政策
					</div>
					<div>
						眼力健（上海）医疗器械贸易有限公司及其关联公司（以下统称“眼力健”或“我们”）非常重视用户（以下简称“您”）的隐私和个人信息保护。您在使用我们的产品或服务时，我们可能会收集和使用您的相关信息。我们希望通过《眼力健隐私政策》(以下简称“本政策”)向您说明我们在您使用我们的产品或服务时如何收集、使用、保存、共享和转让您的个人信息，以及我们如何保护您的个人信息，和您如何管理您的个人信息。 
						<br/>在您使用眼力健的产品或服务前，请务必仔细阅读并理解本政策。我们会在网站、应用或其他产品或服务平台上为您展示本政策或提供便于阅读、获取本政策的链接或方式。当您使用或在本政策更新后继续使用我们的网站、应用或其他产品或服务时，即视为您已经阅读、理解并同意本政策及其不时更新的版本，并同意我们按照本政策收集和使用您的个人信息。 
						<br/>本政策将帮助您了解以下内容: 
						<br/>一、我们如何收集和使用您的个人信息 
						<br/>二、我们如何使用 Cookies 和同类技术 
						<br/>三、我们如何共享、转让、公开披露您的个人信息 
						<br/>四、我们如何存储和保护您的个人信息 
						<br/>五、您如何管理您的个人信息 
						<br/>六、未成年人的个人信息保护 
						<br/>七、您的个人信息如何在全球范围转移 
						<br/>八、本政策的更新 
						<br/>九、联络我们 
						<br/>
						<br/>一、我们如何收集和使用您的个人信息 
						<br/>个人信息是指以电子或者其他方式记录的能够单独或者与其他信息结合识别特定自然人身份或者反映特定自然人活动情况的各种信息。本政策中涉及的个人信息包括但不限于：基本信息（包括姓名、生日、性别、联系电话、联系地址、电子邮箱等）；个人身份信息（包括身份证、护照号码等）；生物识别信息（包括面部特征、虹膜等）；网络身份标识信息（包括系统账号、IP 地址、邮箱地址及与前述有关的密码、口令、口令保护答案等）；个人教育工作信息（包括工作单位、学历、学位教育经历、工作记录、培训记录等）；通讯录；个人上网信息（包括网站浏览记录、软件使用记录、点击记录等）；个人常用设备信息（包括设备号、硬件型号、设备MAC地址、操作系统类型、软件列表、唯一设备识别码（如IMEI／android ID／IDFA／OPENUDID／GUID、SIM卡IMSI信息等在内的描述个人常用设备基本情况的信息等）；个人位置信息（包括精准定位信息、经纬度等）；其他信息（包括参加我们的促销或营销活动生成的记录、使用我们的产品、服务过程中生成的记录、您主动向我们提供的其他个人信息等）。 
						<br/>1.我们如何收集您的个人信息 
						<br/>（1）您向我们提供的信息 
						<br/>您需要注册成为我们的会员，或以其他方式向我们提供相关个人信息，才能获得我们的产品或服务，或参与特定活动（例如观看/收听在线课程）。我们在收集时会告知您何种信息是必要的，何种信息是选择性提供的。如果您不提供必要的个人信息，您将无法获得我们提供的产品或服务。 
						<br/>（2）我们在您使用产品或服务过程中获取的信息 
						<br/>为了提高服务质量、优化用户体验，我们会采用技术手段留存您使用产品或服务以及相关使用方式的信息。我们会通过多数浏览器收集特定信息，如您的媒体访问控制（MAC）地址、计算机类型（Windows或Macintosh）、屏幕分辨率、操作系统版本和因特网浏览器类型及版本。如果您使用移动设备登陆网站，我们也可能收集类似的信息，例如您的设备类型和标识符。在未取得您明确同意的情况下，我们不会将上述信息用于本政策所述目的之外的任何用途。 
						<br/>（3）来自第三方的信息 
						<br/>在法律允许的情况下，我们还可能从第三方合作伙伴处获得您的个人信息。但我们会依据相关法律法规规定核实个人信息来源的合法性，并要求信息提供方向个人信息主体明确告知该等情况，同时征得个人信息主体同意。在此情况下，我们将依据与信息提供方约定的范围、方式、目的等使用您的个人信息。 
						<br/>2.我们如何使用您的个人信息 
						<br/>在符合相关法律法规规定的前提下，我们将出于以下目的，使用您的个人信息： 
						<br/>（1）实现特定服务功能并响应您的请求 
						<br/>　为您提供特定的服务功能并为您提供相关的客服服务； 
						<br/>　回复您的询问并响应您的请求，例如向您发送您所要求的文件或电子邮件； 
						<br/>　向您发送与我们与您的关系或服务相关的重要信息、条款、条件、政策和/或其他行政信息的变更。 
						<br/>（2）实现商业目的 
						<br/>　用于数据分析以提高服务效率; 
						<br/>　用于审计，以验证我们的内部流程是否按预期运行以及是否符合法律，法规或合同的要求; 
						<br/>　用于欺诈和安全的监控，例如探测和阻止网络攻击或窃取他人信息; 
						<br/>　开发新产品和服务; 
						<br/>　用于增强、改善或改进我们的网站或产品和服务; 
						<br/>　用于确认服务使用趋势，例如了解用户最感兴趣的服务; 
						<br/>　确认促销活动的有效性，以便我们能够根据用户的需求和兴趣调整我们的活动。 
						<br/>（3）分析您的个人信息以提供个性化服务 
						<br/>　为更好地了解您，以便我们个性化地与您互动，为您提供您所感兴趣的信息或优惠情况； 
						<br/>　为更好地了解您的偏好，以便我们可以通过本服务传递我们认为与您相关且有趣的内容； 
						<br/>　基于合法利益或在征得您同意的情况下，我们将会为您提供个性化的服务。 
						<br/>当我们要将您的个人信息用于本政策未载明的其他用途时，会事先征求您的同意。当我们要将基于特定目的收集来的您的个人信息用于其他目的时，也将事先征求您的同意。 
						<br/>
						<br/>二、我们如何使用 Cookies 和同类技术 
						<br/>1.Cookies 
						<br/>为使您获得更好的访问体验，我们会在您的计算机或移动设备上存储名为Cookies的小数据文件。Cookies是直接储存在您使用的计算机上的信息片段。使用Cookies，我们可以收集相关信息，例如浏览器类型、在网站停留的时间、造访的网页，以及语言首选项。我们和我们的服务提供商将信息用于安全目的，以提高导航性能，更有效地显示信息，在使用网站时实现个人化体验。我们也使用Cookies以识别您的计算机或装置，让您更轻松地使用网站。此外，我们使用Cookies收集与网站使用情况有关的统计信息，以便持续改进网站的设计和功能，了解个人如何使用网站，并帮助我们解决与网站有关的问题。Cookies允许我们选择特定广告，或提供对您最有吸引力的广告，并在您登陆网站时显示它们。我们也可能在在线广告中使用Cookies，以追踪消费者对我们的广告的回应。 
						<br/>您可以按照浏览器的说明拒绝接受这些Cookies；但是，如果您未接受，您可能在使用网站时遭遇某些不便。您也可不接收广告，或我们提供的与您的兴趣和需求相关的其他信息。如想了解Cookies详细信息，请访问 http://www.allaboutcookies.org (外部链接）。 
						<br/>2.Flash Cookies 
						<br/>我们使用Adobe Flash技术（包括“Flash LSOs”）为您提供更多个性化服务，以便您能够持续获得和使用我们的产品或服务，同时，我们会收集和存储关于您使用我们的产品或服务的信息。如果您不希望在您的计算机上保存Flash LSOs，您可以通过更改Flash 播放器的设置，用网站存储设置面板（Website Storage Settings Panel）上的工具阻止Flash LSOs的保存。您也可以按照操作指南通过全局存储设置面板（Global Storage Settings Panel）控制Flash LSOs。请注意，将Flash播放器设置为Flash LSOs禁止或限制的状态，可能会降低或者阻碍某些Flash应用程序的功能。 
						<br/>3.像素标签、网站信标、透明GIF，或其他类似技术 
						<br/>除Cookies外，我们还可能使用像素标签、网站信标、透明GIF等其他类似技术。这些技术可能用于连接某些网站页面及HTML格式电邮讯息，以追踪网站用户及电邮接收人的活动、衡量我们的营销活动之成效，以及搜集网站使用及响应率的统计数字。 
						<br/>基于您通过任何设备获取和使用我们的产品或服务及其他在线服务的相关信息，在您获取和使用我们的产品或服务或其他在线服务时，第三方广告商会替我们向您发送您可能感兴趣的产品或服务的广告。为此，这些公司可能会在您的浏览器上放置或识别特定的Cookies（包括像素标签）。除收集您在线使用服务的信息外，其还可能采取一些技术措施，通过您使用的设备（例如移动电话和笔记本电脑）识别您。 
						<br/>如果您希望了解关于该做法的更多信息，以及如何在您访问本政策的设备的桌面和浏览器中选择退出，请访问http://optout.aboutads.info/#/和http://optout.networkadvertising.org/#/。您还可以在www.aboutads.info/appchoices下载AppChoices应用程序，在移动应用程序中选择退出。 
						<br/>
						<br/>三、我们如何共享、转让、公开披露您的个人信息 
						<br/>1.共享 
						<br/>（1）为本政策中所述之目的，我们可能会与我们的关联公司共享您的个人信息。关联公司列表可由此处获取（单击“SEC文件归档”下方的Form 10K, Exhibit 21的链接）。但我们只会共享必要的个人信息，且受本政策中所声明目的的约束。我们的关联公司如要改变个人信息的处理目的，将再次征求您的授权同意。 
						<br/>（2）为本政策中所述之目的，我们可能会与我们的第三方合作伙伴共享您的个人信息。但我们仅会出于合法、正当、必要、特定、明确的目的共享您的个人信息且仅共享为实现共享目的所必须的个人信息。我们的第三方合作伙伴主要包括： 
						<br/>a)广告、推广类合作伙伴：我们可能会向与眼力健合作进行共同市场推广的第三方共享您的个人信息，例如使用您的个人信息以及您的非个人信息集合形成的间接用户画像与第三方共享。但我们仅会向其提供推广的覆盖面和有效性的信息，而不会提供您的个人身份信息，或者我们将这些信息进行汇总，以便其不会识别您个人。 
						<br/>b)第三方服务供应商：我们可能会与支持我们业务的供应商共享您的个人信息，如网站代管和调节、行动应用程序代管、数据分析、数据存储、数据传输、付款处理、订单履行、基础设施提供、信息科技服务、客户服务、售后服务、电邮和直邮递送服务、信用卡处理、审核服务等服务的服务提供商。 
						<br/>c)医疗和研究机构：为眼力健产品研发、升级、改进之目的，我们可能会与第三方医疗或研究机构共享您的个人信息。但我们仅会共享为实现共享目的所必须的个人信息，并将对信息进行匿名化处理，以便其不会识别您个人。 
						<br/>（3）我们还可能将您的个人信息披露给对我们的所有或部分业务、资产或股票进行任何重组、合并、销售、合资、分配、转让或其他处置（包括与任何破产或类似程序有关的处置）的第三方。 
						<br/>（4）此外，当我们认为有必要或合适时，我们将使用和披露透过网站收集的信息：a）根据适用法律，包括您居住国以外的法律；b）遵守法律程序；c）响应公共及政府机构的要求，包括您居住国以外的公共及政府机构；d）执行我们的条款及条件；e）保障我们或我们任何联属公司的营运；f）保护我们或我们联属公司、您或他人的权利、隐私、安全或财产；g）帮助我们寻求可用的补救措施或限制我们可能蒙受的损害。我们也可能在您的同意下，以其他方式使用和披露您的个人信息。 
						<br/>2.转让 
						<br/>我们不会将您的个人信息转让给任何公司、组织和个人，但以下情况除外： 
						<br/>（1）事先获得您的明确授权或同意； 
						<br/>（2）根据适用的法律法规规定，或按照政府主管部门的强制性要求进行提供；或 
						<br/>（3）在涉及资产转让、收购、合并、重组或破产清算时，如涉及到个人信息转让，我们会向您告知有关情况，并要求新的持有您个人信息的公司、组织继续受本政策的约束。如变更个人信息使用目的，我们将要求该公司、组织重新取得您的授权同意。 
						<br/>3.公开披露 
						<br/>我们仅会在以下情况下，公开披露您的个人信息: 
						<br/>（1）事先获得您的明确同意；或 
						<br/>（2）根据法律、法规的要求、强制性的行政执法或司法要求所必须提供您个人信息的情况下，我们可能会依据所要求的个人信息类型和披露方式公开披露您的个人信息。 
						<br/>
						<br/>四、我们如何存储和保护您的个人信息 
						<br/>眼力健重视个人信息安全，并采取一切合理可行的措施，保护您的个人信息： 
						<br/>1.我们采取符合业界标准的安全措施和技术手段存储和保护您的个人信息，以防止其遭到未经授权访问、披露、篡改、丢失或毁坏。例如，我们会使用加密技术确保数据的保密性；我们会使用受信赖的保护机制防止数据遭到恶意攻击；我们会部署访问控制机制，确保只有授权人员才可访问个人信息；以及我们会举办安全和隐私保护培训课程，加强员工对于保护个人信息重要性的认识。 
						<br/>2.我们会采取一切合理可行的措施，确保未收集无关的个人信息。我们仅在本政策所述目的所必需期间，且在法律法规及监管规定允许的时限内保存您的个人信息。 
						<br/>3.互联网并非绝对安全的环境，而且电子邮件、即时通讯、社交软件等与其他用户的交流方式无法确定是否完全加密，我们建议您使用此类工具时请使用复杂密码，并注意保护您的个人信息安全。 
						<br/>4.互联网环境并非百分之百安全，我们将尽力确保或担保您发送给我们的任何信息的安全性。如果我们的物理、技术、或管理防护设施遭到破坏，导致信息被非授权访问、公开披露、篡改、或毁坏，导致您的合法权益受损，我们将承担相应的法律责任。 
						<br/>5.在不幸发生个人信息安全事件后，我们将按照法律法规的要求，及时向您告知：安全事件的基本情况和可能的影响、我们已采取或将要采取的处置措施、您可自主防范和降低风险的建议、对您的补救措施等。我们将及时将事件相关情况以电子邮件、短信、电话、推送、公告等方式告知您，难以逐一告知个人信息主体时，我们会采取合理、有效的方式发布公告。同时，我们还将按照监管部门要求，主动上报个人信息安全事件的处置情况。 
						<br/>本政策未涉及（并且我们概不负责）任何第三方（包括经营任何网站或网络资产（透过本网站存取或本网站含有链接）的任何第三方）的隐私政策、信息或其他惯例（包括但不限于任何应用程序）。我们或我们的关联公司并不认可任何此类网站或网站上的资产（或相关链接的内含物）的可用性。 
						<br/>
						<br/>五、您如何管理您的个人信息 
						<br/>1.访问您的个人信息 
						<br/>除法律法规规定的例外情况，您可以随时访问您的个人信息： 
						<br/>（1）账户信息：如果您希望访问您的帐户中的个人资料信息、交易信息等，您可以登录您在我们的网站或平台注册的账户，通过“我的账户”或“个人中心”执行此类操作。 
						<br/>（2）参与活动信息：您可以登录您在我们的网站或平台注册的账户，通过“会员中心”查询您预约体验活动、参与推广活动等的相关记录。 
						<br/>2.更正您的个人信息 
						<br/>当您发现我们处理的关于您的个人信息有错误时，您可以登录您在我们的网站或平台注册的账户，选择“修改个人信息”自行进行更正（请注意，有些个人信息的修改只能依据本政策第九条列明的方式联络我们进行修改）。请您理解，在您自行修改或联络我们修改相关信息时，我们可能会要求您进行身份验证，以保障帐户的安全。 
						<br/>3.针对我们出于营销目的使用及披露个人信息作出选择 
						<br/>（1）您在收到我们以短信、邮件等形式向您发送的营销信息时，可以根据信息中的退订提示（如回复“TD”、选择“取消订阅”），要求眼力健不再向您发送此类营销信息。 
						<br/>（2）您在收到我们以微信推送或通过其他手机客户端推送的信息时，您可以通过修改手机设置来选择不接收此类推送信息，例如取消微信关注，或在手机应用客户端内的“设置”中选择不接收此类推送。 
						<br/>（3）如果您想退订我们邮寄的市场部活动信息，您可以依据本政策第九条列明的方式联络我们进行退订。在您给我们的回信中，请提供您的姓名，注明您不希望再收到的市场部活动信息的形式，并包括它／它们发送的地址。例如，如果您不希望再收到我们的营销信件／宣传手册，请告诉我们，并提供您的姓名和邮政地址。 
						<br/>（4）如果以后您不希望与我们的关联公司，或第三方合作伙伴分享您的个人信息以用于营销目的，您可以依据本政策第九条列明的方式联络我们撤回同意。 
						<br/>我们将在合理可行的范围内尽快努力满足您的要求。请注意，如果您选择了上述“退订”或“取消订阅”选项，我们将无法从我们已经与其共享您的个人信息的联属公司的数据库中清除您的个人信息（截至我们执行您的“退订”请求之日）。另请注意，如果您选择不接收我们的营销相关信息，我们仍可能向您发送提供服务所必须的信息或其他重要的交易和管理信息，您不能选择不接收这些信息。 
						<br/>4.注销您的个人账户 
						<br/>如果您希望注销您的个人帐户，您可以登录您在我们的网站或平台注册的账户，通过“我的账户”或“个人中心”执行此类操作。 
						<br/>在注销账户之后，您的账户积分将清零，同时，我们将停止为您提供产品或服务。 
						<br/>5.响应您的请求 
						<br/>如果您无法通过上述方式实现以上权利，您可以随时依据本政策第九条列明的方式与我们联系。为了保障安全，我们可能需要您提供书面请求，或以其他方式证明您的身份，我们将在收到您的反馈并验证您的身份后三十（30）日内答复您的请求。 
						<br/>对于您合理的请求，我们原则上不收取费用，但对多次重复、超出合理限度的请求，我们将视情收取一定成本费用。对于那些无端重复、需要过多技术手段（例如，需要开发新系统或从根本上改变现行惯例）、给他人合法权益带来风险或者非常不切实际（例如，涉及备份磁带上存放的信息）的请求，我们可能会予以拒绝。 
						<br/>在以下情形中，按照法律法规要求，我们将无法响应您的请求： 
						<br/>（1）与国家安全、国防安全有关的； 
						<br/>（2）与公共安全、公共卫生、重大公共利益有关的； 
						<br/>（3）与犯罪侦查、起诉和审判等有关的； 
						<br/>（4）有充分证据表明您存在主观恶意或滥用权利的； 
						<br/>（5）响应您的请求将导致您或其他个人、组织的合法权益受到严重损害的。 
						<br/>
						<br/>六、未成年人的个人信息的保护 
						<br/>1.我们的产品和服务主要面向成人。如果您是18周岁以下的未成年人，在使用我们的产品或服务前，应事先取得您家长或法定监护人的同意。我们根据国家相关法律法规的规定保护未成年人的个人信息。 
						<br/>2.对于经父母或法定监护人同意而收集的未成年人个人信息，我们只会在法律允许、父母或法定监护人明确同意或者保护未成年人所必要的情况下使用或公开披露此信息。 
						<br/>3.如果我们发现自己在未事先获得可证实的父母或法定监护人同意的情况下收集了未成年人的个人信息，则会设法尽快删除相关数据。 
						<br/>
						<br/>七、您的个人信息如何在全球范围转移 
						<br/>1.原则上，我们在中华人民共和国境内运营过程中收集和产生的个人信息，将存储在中华人民共和国境内。 
						<br/>2.由于我们通过遍布全球的资源和服务器提供我们的产品或服务，这意味着，在获得您的授权同意后，您的个人信息可能被转移到您使用我们的产品或服务所在国家或地区的境外管辖区，或者受到来自这些管辖区的访问。在此情况下，我们会确保您的个人信息得到在中华人民共和国境内足够同等的保护。例如，我们会请求您对跨境转移个人信息的同意，或者在跨境数据转移之前实施数据匿名化等安全举措。 
						<br/>
						<br/>八、本政策的更新 
						<br/>1.为了给您提供更好的服务，以及反映眼力健在个人信息保护实务方面的变动，我们可能适时更新本政策。我们会在我们的网站、移动端等发布修订后的版本，并以适当的方式提醒您相关内容的变更。如该等修订是对本政策的实质性变更，并将影响到您在本政策下的相关权利，我们将通过更为明显的方式通知您（包括但不限于向您发送邮件、推送信息、设置弹窗提醒等）。 
						<br/>2.如果您不同意更新后隐私政策，您有权注销您的账户；或者您可以联系我们反馈您的意见、提出您的要求。在本政策更新后，如您继续使用我们的网站、应用或其他产品或服务，即表示您同意接受变更后的本政策。如无特殊说明，本政策以及本政策的更新版本自发布之日起生效。 
						<br/>
						<br/>九、联络我们 
						<br/>如果您对本政策有任何疑问、意见或建议，可以通过以下方式联络我们。一般情况下，对于您的咨询、请求或投诉，我们会在三十（30）日内向您作出回复。 
						<br/>电话：400 880 5880 
						<br/>网址：<a href="https://www.surgical.jnjvision.com" styl="color: #f70707;">https://www.surgical.jnjvision.com</a>
					</div>
					
                    <div style="font-size: 20px; text-align: center; margin-bottom: 10px; margin-top: 30px; font-weight: bold;">
			            			2022年度强生眼力健屈光白内障手术视频达人赛 
			            		</div>
			            		<div>
			            			全国预选赛比赛规则
                                    <br/>1.2022第四届白内障达人赛重磅上线，覆盖全国各个省市，联动眼科知名大咖专家，共同推动屈光性白内障领域发展。
                                    <br/>2.网络预选赛：线上面向全国收集屈光性白内障手术病例，每个参赛作品将获得全国知名白内障专家的专业评分及点评。
                                    <br/>3.通过盲评，筛选出前24名参赛选手进入线下半决赛。
                                    <br/>4.对未入选病例提供“创作激励”。
			            		</div>
				</div>
			</div>
		</div>
	</div>


    <div class="tk" id="fltk">
        <div class="h100 center">
            <div class="pr" style="padding: 10px 20px; max-width: 800px; background: #fff; border-radius: 5px;">
                <div class="pa center gb" style="cursor:pointer; top: 10px; right: 10px; width: 40px; height: 40px; background: #DF2019; border-radius: 100px; color: #fff; z-index: 3; font-size: 20px;">X</div>
                
                <div class="center">
                    <img style="width: 60px;" src="img/ld.png" >
                </div>
                <div class="h10"></div>
                <div class="" style="background: #ebebeb; height: 400px; padding: 20px; border-radius: 10px;">
                    <div>
                        <div style="font-size: 24px; text-align: center; margin-bottom: 10px; border-bottom: #acacac solid 1px; padding-bottom: 10px; color: #373737;">
                            法律条款 
                        </div>
                        <div id="fltkove" class="" style="color: #373737; line-height: 1.8; height: 350px;overflow-y: auto; overflow-x: hidden;">
                            <div id="fltkoveH">
                                1.本人在此不可撤销地授予眼力健（上海）医疗器械贸易有限公司（以下简称“公司”）及其相应的过去、当前和将来母公司、子公司、部门、关联方、前任公司、继任公司及受让人（以下统称“被许可方”）在世界范围内翻译、复制、传播、发行、改编、摄制、汇编、出版、再版及以其他方式使用于本人上传于公司搭建的公众号：ConnectedBySight的手术视频（以下简称“图像”）的永久独家免费权利（并具有分许可权利）。本人授予被许可方以任何方式通过任何当前或将来的媒体永久使用本人姓名、本人声音及肖像的权利，该等使用无需获得本人事先批准，亦无需通知本人或给予本人补偿，除非法律禁止。
                                <br>2.本人同意，被许可方可利用、编辑或以其他方式修改图像，并且可将图像与其他方提供或创建的材料合并使用，而无需获得本人同意。被许可方可完全自行决定是否、何时以及如何出版或发布图像或其任何部分。本人承认和同意被许可方对于第三方未经授权使用图像不负任何责任。本人在此还明确承诺被许可方将不会因使用图像而遭受到任何和所有索赔和要求，包括但不限于诽谤、侵犯隐私或侵犯肖像权索赔。
                                <br>3.本人保证和声明：（i）本人具备签署本授权书的全部权利和权力；（ii）本人年龄超过18周岁；并且（iii）本授权书并未违背本人已经作出的任何承诺。
                                <br>4.本授权书的任何规定均不构成被许可方必须使用本授权书任何权利的义务。
                                <br>5.本人同意，本授权书的法律效力高于本人与被许可方先前就本授权书所授予权利所达成的所有协商结果，并且本授权书规定不得通过任何其他文书、发票、订购单或其他文件进行修改，除非以书面方式作出并且经由协议双方签署。
                                <br>6.本在线分享仅面向医疗卫生专业人士
                                <br>7.本在线分享所载的的信息、评论和其他内容均无意代替医疗卫生专业人员的医学判断并且亦无意作为可以信赖的建议，作为本在线分享的观众/听众您应该通过您自己的专业判断来评估本在线分享所提供的所有信息或咨询其他专业人士并查阅其他参考资料
                                <br>8.本在线分享的观点或链接倒的任何第三方的全部文字、图片和音、视频由分享人自行负责。本在线平台以及强生公司不对其中包含或引用的信息的准确性、可靠性或完整性提供任何明示或暗示的保证
                                <br>9.对于任何因使用本在线分享内容而可能遭致的意外、疏忽、侵权及其造成的损失，本在线分享平台剂强生公司（or眼力健公司）对其概不负责，亦不承担任何法律责任
                                <br>10.本在线分享的内容禁止转载、拍照、下载、传播
                            </div>
                        </div>
                    </div>
                </div>
                <div style=" width: 248px; margin: 30px auto 0px auto;" class="center yqrzx off cp pr">
                    <img width="100" src="img/yqr.png" >
<%--                    <input onchange="upload(this)" class="pa whtl0" type="file" style="opacity: 0;" accept="video/*" multiple />--%>
                </div>
            </div>
        </div>
    </div>

<div class="tk" id="ts">
			<div class="center h100">
				<div class="" style="padding: 60px 80px; font-size: 30px; background: #fff; border-radius: 10px; color: #DF2019;">您的报名视频已上传成功!</div>
			</div>
		</div>
    <script type="text/javascript">



            $("#fltkove").scroll(function() {
			    if ($("#fltkove").scrollTop() >= $("#fltkoveH").height() - $("#fltkove").height()-30) {
			        $(".yqrzx").removeClass("off")
			    }
			});

			var n = 0;
			$(".qcgz").click(function () {
			    if (n == 0) {
			        $("#gz").show()
			    }
			})
        $(".gb").click(function () {
			$("#gz,#fltk").hide()
        })

        $(".yqrzx").click(function () {
            $("#gz,#fltk").hide()
            $(".pcvideoup input").attr("style", "")
            n = 1;
        })


        $(".pcvideoup input").attr("style","pointer-events: none;")
        //$(".pcvideoup input").attr("style","")

        $(".pcvideoup").click(function () {
            if (n == 0) {
                $("#fltk").show()
                
            }
        })

		$("#book").on("change", function () {

		    $("#spT").html("<span style='font-size:14px;'>正在上传文件,请稍后...</span>")
		    $.ajaxFileUpload({
		        url: 'inputFile.aspx?m=book',
		        type: 'post',
		        data: {},
		        secureuri: false, //一般设置为false
		        fileElementId: 'book', // 上传文件的id、name属性名
		        dataType: 'JSON', //返回值类型，一般设置为json、application/json  这里要用大写  不然会取不到返回的数据
		        success: function (data, status) {
		            if (data.indexOf("div") >= 0) {

		                $("#spT").html("<span style='font-size:14px;'>文件上传失败.</span>")
		                $("#hfVideoBook").val("");
		            }
		            else {
		                $("#spT").html("<span style='font-size:14px;'>文件上传成功.</span>")
		                $("#hfVideoBook").val(data);
                    }
		        },
		        error: function (data, status, e) {

		        }
		    });
		});

        $("#demo").on("change", function () {
            $("#spD").html("<span style='font-size:14px;'>正在载入文件,请稍后...</span>")
            $.ajaxFileUpload({
                url: 'inputFile.aspx?m=demo',
                type: 'post',
                data: {},
                secureuri: true, //一般设置为false
                fileElementId: 'demo', // 上传文件的id、name属性名
                dataType: 'JSON', //返回值类型，一般设置为json、application/json  这里要用大写  不然会取不到返回的数据
                success: function (data, status) {
                    if (data.indexOf("div") >= 0) {
                        $("#spD").html("<span style='font-size:14px;'>文件上传失败.</span>")
                        $("#hfDemo").val("");
                    }
                    else {
                        $("#spD").html("<span style='font-size:14px;'>文件上传成功.</span>")
                        $("#hfDemo").val(data);
                    }
                },
                error: function (data, status, e) {
                  
                }
            });
        });

        $("#sqUrl").on("change", function () {
            $("#spU").html("<span style='font-size:14px;'>正在载入文件,请稍后...</span>")
            $.ajaxFileUpload({
                url: 'inputFile.aspx?m=sqUrl',
                type: 'post',
                data: {},
                secureuri: false, //一般设置为false
                fileElementId: 'sqUrl', // 上传文件的id、name属性名
                dataType: 'JSON', //返回值类型，一般设置为json、application/json  这里要用大写  不然会取不到返回的数据
                success: function (data, status) {
                    if (data.indexOf("div") >= 0) {
                        $("#spU").html("<span style='font-size:14px;'>文件上传失败.</span>")
                        $("#hfsqUrl").val("");
                    }
                    else {
                        $("#spU").html("<span style='font-size:14px;'>文件上传成功.</span>")
                        $("#hfsqUrl").val(data);
                    }

                },
                error: function (data, status, e) {

                }
            });
        });

        var getSignature = function(callback) {

        $.ajax({
            type: "POST",
            url: 'GetSign.aspx',
            async: false,
            data: {},
            beforeSend: function(xmlHttpRequest) {
            },
            success: function(data, textStatus) {
            console.log(data)
              callback(data);

            },
            complete: function(xmlHttpRequest, textStatus) {
            },
            error: function() {

            }
          });
        };
        var isupvideo = false




        if ($("#describe").val() == "8") {
            $(".isdescribe").show()
        } else {
            $(".isdescribe").hide()
        }

        $("#describe").change(function () {
            if ($(this).val() == "8") {
                $(".isdescribe").show()
            } else {
                $(".isdescribe").hide()
            }
        })
        var loadjd = 0
        var settime;
        function upload(obj) {

            var videoFile = obj.files[0];
            console.log(videoFile)
            var resultMsg = qcVideo.ugcUploader.start({
                videoFile: videoFile,
                getSignature: getSignature,
                allowAudio: 1,
                isTranscode: 1,
                success: function (result) {

                    $(".pcvideoup input").show()
                    //isupvideo = true
                    //clearTimeout(settime);
                    $(".upvideo").html("100%");
                    $(".pcvideoup .tec").html("文件上传成功!")

                    $("#fltk").hide()
                    $(".pcvideoup input").attr("style","")

                },
                error: function (result) {
                    //...
                    console.log(result.msg);
                },
                progress: function (result) {
                    $(".pcvideoup input").hide()
                    var progressNum = result.shacurr;
                    console.log(progressNum)
                    progressNum = progressNum * 100;
                    if (progressNum > 99)
                        progressNum = 99;
                    $(".upvideo").html(parseInt(progressNum) + "%")
                    $(".pcvideoup .tec").html("视频上传中...")
                    //$("#my-bar-success").css("width", parseInt(progressNum) + "%");
                    // $("#sp").html(parseInt(progressNum) + "%");
                },
                finish: function (result) {
                   
                    $("#hfVideoId").val(result.fileId);
                    $("#hfVideoUrl").val(result.videoUrl);
                   
                    //console.log(result)
                    //alert(result.fileId)
                    //alert(result.videoName)
                    //alert(result.videoUrl)

                }
            });
           
//            var files = obj.files;
//            loadjd = 0
//            isupvideo = false
//            $(".pcvideoup input").hide()

//            settime = setInterval(function () {
//                loadjd++
//                $(".upvideo").html(loadjd + "%")
//                $(".pcvideoup .tec").html("视频载入中...")
//                if (loadjd == 100) {
//                    $(".pcvideoup input").show()
//                    isupvideo = true
//                    clearTimeout(settime);
//                    $(".pcvideoup .tec").html("视频载入成功!")
//                }
//            }, 15)


        }
        $(".qcqrtj").click(function () {
	//alert("正在提交")
            //	if($(this).data().type==1){
            //	alert_Tips("您已经上传,不能重复上传！", "", 1500)
            //                return false;
            //	}

            var name = $.trim($("#name").val());
            var hospital = $.trim($("#hospital").val());
            var province = $.trim($("#province").val());
            var txtYear = $.trim($("#txtYear").val());
            var txtNum = $.trim($("#txtNum").val());
            var qiangsheng = $.trim($("#qiangsheng").val());
            var videotitle = $.trim($("#videotitle").val());
            var descript = $.trim($("#descript").val());
            var describe = 1;
            var describetext = $.trim($("#describetext").val());
            var hfVideoId = $("#hfVideoId").val();
            var hfVideoUrl = $("#hfVideoUrl").val();
            var hfVideoBook = $("#hfVideoBook").val();
            var hfDemo = $("#hfDemo").val();
            var hfsqUrl = $("#hfsqUrl").val();
            var pptContent = $("#pptContent").val();
            if (name == "") {
                alert("请输入姓名！")
                return false;
            }
            if (hospital == "") {
                alert("请输入医院！")
                return false;
            }
            if (province == 0) {
                alert("请选择省份！")
                return false;
            }

            if (txtYear == "") {
                alert("请输入超声乳化手术经验！")
                return false;
            }

            if (isNaN(txtYear)==true) {
                alert("超声乳化手术经验只能输入数字！")
                return false;
            }

            if (txtNum == "") {
                alert("请输入超声乳化年手术量 ！")
                return false;
            }

            if (isNaN(txtNum)==true) {
                alert("超声乳化年手术量只能输入数字！")
                return false;
            }

            if (qiangsheng == "") {
                alert("请输入强生眼力健负责销售！")
                return false;
            }
            if (videotitle == "") {
                alert("请输入视频标题！")
                return false;
            }
            if (descript == "") {
                alert("请输入手术描述！")
                return false;
            }

            if (describe == 0) {
                alert("请选择手术类型！")
                return false;
            }
            if (describe == "8" && describetext == "") {
                alert("请输入手术类型！")
                return false;
            }

           
            if (hfVideoId == "") {
                alert("请上传视频！")
                return false;
            }
//            if (hfVideoBook == "") {
//                alert("请上传专家授权书！")
//                return false;
//            }
//            if (hfVideoBook == "-1") {
//                alert("非法上传专家授权书！")
//                return false;
//            }
            if (hfDemo == "") {
                alert("请上传病例模板！")
                return false;
            }
            if (hfDemo == "-1") {
                alert("非法上传病例模板！")
                return false;
            }
//            if (hfsqUrl == "") {
//                alert("请上传专家授权书附件！")
//                return false;
//            }
//            if (hfsqUrl == "-1") {
//                alert("非法上传专家授权书附件！")
//                return false;
//            }
			
            $.ajax({
                type: "POST",
                url: 'upVideo.aspx',
                async: false,
                data: { "name": name, "hospital": hospital, "province": province, "qiangsheng": qiangsheng, "videotitle": videotitle, "describe": describe, "describetext": describetext, "hfVideoId": hfVideoId, "hfVideoUrl": hfVideoUrl, "hfVideoBook": "", "hfDemo": hfDemo, "descript": descript, "hfsqUrl": hfsqUrl, "pptContent": pptContent, "txtYear": txtYear, "txtNum": txtNum },
                beforeSend: function (xmlHttpRequest) {
                },
                success: function (data, textStatus) {
                    if (data == "1")
                        $("#ts").show()
                    else if (data == "-1")
                        alert("非法请求！")
                    else if (data == "2")
                        alert("您已经上传,不能重复上传！")
                   else if (data == "-2")
                        alert("由于您长时间未操作,请重新登陆！")
                    else
                        alert("网络繁忙,请稍后再试！")
                },
                complete: function (xmlHttpRequest, textStatus) {
                },
                error: function () {
                }
            });
	

        })
    </script>
</body>
</html>
