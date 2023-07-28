<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign_upTest.aspx.cs" Inherits="sign_upTest" %>

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
        #body,#bodys {
            width: 100%;
            height: 100%;
        }

            #body .swiper-slide {
                height: auto;
            }
    </style>
</head>

<body>
    <div id="overflow_hidden" class="pf whtl0">
    	<img class="scgb dn" style="width: 100%;" src="img/gbdl.jpg"/>
        <div class="swiper-container" id="body">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="center">
                        <img width="100%" src="img/signupi.png">
                    </div>
                    <div class="p1220">
                        <div class="center pr ninput">
                            <input type="text" id="name" value="" placeholder="姓名" />
                            <div class="center pa signik">
                                <div class="icon2 signi1"></div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput">
                            <input type="text" id="hospital" value="" placeholder="医院" />
                            <div class="center pa signik">
                                <div class="icon2 signi2"></div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput">
                            <select id="province">
                                <option value="0">选择省份</option>
                                <option value="北京">北京</option>
                                <option value="上海">上海</option>
                                <option value="天津">天津</option>
                                <option value="重庆">重庆</option>
                                <option value="四川">四川</option>
                                <option value="贵州">贵州</option>
                                <option value="云南">云南</option>
                                <option value="西藏">西藏</option>
                                <option value="河南">河南</option>
                                <option value="湖北">湖北</option>
                                <option value="湖南">湖南</option>
                                <option value="广东">广东</option>
                                <option value="广西">广西</option>
                                <option value="陕西">陕西</option>
                                <option value="甘肃">甘肃</option>
                                <option value="青海">青海</option>
                                <option value="宁夏">宁夏</option>
                                <option value="新疆">新疆</option>
                                <option value="河北">河北</option>
                                <option value="山西">山西</option>
                                <option value="内蒙古">内蒙古</option>
                                <option value="江苏">江苏</option>
                                <option value="浙江">浙江</option>
                                <option value="安徽">安徽</option>
                                <option value="福建">福建</option>
                                <option value="江西">江西</option>
                                <option value="山东">山东</option>
                                <option value="辽宁">辽宁</option>
                                <option value="吉林">吉林</option>
                                <option value="黑龙江">黑龙江</option>
                                <option value="海南">海南</option>
                                <option value="台湾">台湾</option>
                                <option value="香港">香港</option>
                                <option value="澳门">澳门</option>
                            </select>
                            <div class="center pa signik">
                                <div class="icon2 signi9"></div>
                            </div>
                            <div class="center pa signik" style="left: auto; right: 0px;">
                                <div class="icon2 signi11"></div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput" style="color: #999; border-radius: 5px; background: #fff; font-size: 16px; padding: 10px 10px 10px 40px; width: calc(100% - 50px);">
								<div class="center">
									<div style="width: 135px;">超声乳化手术经验</div>
									<input id="txtYear" style="text-align: center; background: #f3f1f1; padding: 10px; width: calc( 100% - 210px ); margin-left: 15px; margin-right: 40px;" type="tel" name="" id="" value="" />
								</div>
								<div class="center pa signik" style=" max-height: 62px;">
									<img width="18" src="img/tb1.png"/>
								</div>
								<div class="pa h100 center" style="top:0px; right:0px; width:50px;">年</div>
							</div>
							<div class="h12" style=" height: 3px;"></div>
							<div class="center pr ninput" style="color: #999; border-radius: 5px; background: #fff; font-size: 16px; padding: 10px 10px 10px 40px; width: calc(100% - 50px);">
								<div class="center">
									<div style="width: 135px;">屈光性白内障<br /><span style="color:rgb(223, 32, 25)">年手术量</span></div>
									<input id="txtNum" style="text-align: center; background: #f3f1f1; padding: 10px; width: calc( 100% - 210px ); margin-left: 15px; margin-right: 40px;" type="tel" name="" id="" value="" />
								</div>
								<div class="center pa signik" style=" max-height: 62px;">
									<img width="18" src="img/tb2.png"/>
								</div>
								<div class="pa h100 center" style="top:0px; right:0px; width:50px;">例</div>
							</div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput">
                            <input type="text" id="qiangsheng" value="" placeholder="强生眼力健负责销售" />
                            <div class="center pa signik">
                                <div class="icon2 signi1"></div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput">
                            <input type="text" id="videotitle" value="" placeholder="参赛标题" />
                            <div class="center pa signik">
                                <div class="icon2 signi4"></div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput">
                            <textarea rows="" cols="" id="descript" placeholder="手术描述" style=" height: 40px;"></textarea>
                            <div class="center pa signik">
                                <div class="icon2 signi5"></div>
                            </div>
                        </div>
                        
                        <div class="isdescribe dn">

                            <div class="h12" style=" height: 3px;"></div>
                            <div class="center pr ninput">
                                <select name="" id="describe">
                                    <option value="0">手术类型</option>
                                    <option value="1">青光眼合并白内障</option>
                                    <option value="2">糖尿病合并白内障</option>
                                    <option value="3">高度近视白内障</option>
                                    <option value="4">小瞳孔白内障</option>
                                    <option value="5">伴有晶状体位置异常的白内障</option>
                                    <option value="6">外伤性白内障</option>
                                    <option value="7">儿童白内障</option>
                                    <option value="8">其他</option>
                                </select>
                                <div class="center pa signik">
                                    <div class="icon2 signi10"></div>
                                </div>
                                <div class="center pa signik" style="left: auto; right: 0px;">
                                    <div class="icon2 signi11"></div>
                                </div>
                            </div>

                            <div class="h12" style=" height: 3px;"></div>
                            <div class="center pr ninput">
                                <input type="text" id="describetext" value="" placeholder="请输入手术类型" />
                                <div class="center pa signik">
                                    <div class="icon2 signi5"></div>
                                </div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center pr ninput">
                            <input type="text" id="mailbox" value="" placeholder="邮箱" />
                            <div class="center pa signik">
                                <div class="icon2 signi6"></div>
                            </div>
                        </div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="f12 o65">*您的邮箱将收到附有上传视频链接的邮件，请在电脑端点击该链接，按照要求上传视频作品。</div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center butsign f16">提交</div>
                        <div class="h12" style=" height: 3px;"></div>
                        <div class="center guizhe">比赛规则及隐私声明</div>
                        <div class="h20"></div>
                        <div class="h20"></div>
                        <div class="h20"></div>
                    </div>

                </div>
            </div>
            <div class="swiper-scrollbar"></div>
        </div>
<div class="tk" id="gz">
			
			<div class="swiper-container" id="bodys" style=" background: #fff;">
				<div class="pa center gb" style="cursor:pointer; top: 8px; right: 8px; width: 30px; height: 30px; background: #DF2019; border-radius: 100px; color: #fff; z-index: 3; font-size: 20px;">X</div>
			    <div class="swiper-wrapper">
			        <div class="swiper-slide" style="height: auto;">
			            
			            <div class="pr" style="padding: 10px; ">
			            	
			            	<div class="">
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
			    <div class="swiper-scrollbar"></div>
			</div>
		</div>

<div class="tk" id="ts">
						<div class="center h100">
							<div class="" style="padding: 20px 20px; font-size: 20px; background: #fff; border-radius: 10px; color: #DF2019;">
								<div class="tec" style="font-weight: bold; color: #000; font-size: 20px;">提示</div>
								<div style="height: 30px;"></div>
								<div class="tec" style="color: #000000; font-size: 24px;">报名成功!</div>
								<div style="height: 50px;"></div>
								<div class="center">
									<div onclick="JSBridge()" class="center" style="margin-right: 15px; font-size: 16px;width:117px;height:40px;background:rgba(214,214,214,1);border-radius:4px; color: #fff;">取消</div>
									<div class="center jxbm" style=" font-size: 16px;width:117px;height:40px;background:rgba(223,32,25,1);border-radius:4px; color: #fff;" >继续报名</div>
								</div>
							</div>
						</div>
					</div>
    </div>

    <script type="text/javascript">
   
       var name='<%=name %>'
       var hospital='<%=hospital %>'
       var province='<%=province %>'
       var txtYear='<%=txtYear %>'
       var txtNum='<%=txtNum %>'
       var saleName='<%=saleName %>'
       if(name!="")
       {
            $("#name").val(name)
       }

       if(hospital!="")
       {
         $("#hospital").val(hospital)
       }

       if(province!="")
       {
         $("#province").val(province)
       }

       if(txtYear!="")
       {
         $("#txtYear").val(txtYear)
       }

       if(txtNum!="")
       {
         $("#txtNum").val(txtNum)
       }

       if(saleName!="")
       {
         $("#qiangsheng").val(saleName)
       }
    	
    	function compareDate(s1,s2){
		  return ((new Date(s1.replace(/-/g,"\/")))>(new Date(s2.replace(/-/g,"\/"))));
		}
    	
    	var oDate1 = new Date();
		var oDate2 = new Date("2020/05/08 00:00:00".replace(/-/g,"\/"));
		if (oDate1.getTime() < oDate2.getTime()) {
		     
		}
		
		function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}
		
    	//$("#body").hide()
		//$(".scgb").show()
		
		if(getQueryVariable('admin')){
			$("#body").show()
			$(".scgb").hide()
		}
    	

    	
        $(function () {


$(".guizhe").click(function(){
			$("#gz").show()
sbodys.update()
		})
		$(".gb").click(function(){
			$("#gz").hide()
		})

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
                    touchStart: function () {
                        staY = sbody.translate
                    },
                    momentumBounce: function () { },
                    touchEnd: function () {
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
                setTimeout(function () {
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

var sbodys = new Swiper('#bodys', {
			    direction: 'vertical',
			    slidesPerView: 'auto',
			    freeMode: true,
			    scrollbar: {
			        el: '#bodys .swiper-scrollbar',
			    },
			    mousewheel: true,
			   
			});

            window.onpageshow = function (event) {
                setTimeout(function () {
                    sbody.update()
	
                }, 100)
            }

            $("#describe").change(function () {
                if ($(this).val() == "8") {
                    $(".isdescribe").show()
                } else {
                    $(".isdescribe").hide()
                }
                sbody.update()
            })


            $(".butsign").click(function () {
                var name = $.trim($("#name").val());
                var hospital = $.trim($("#hospital").val());
                var province = $.trim($("#province").val());
                var txtYear= $.trim($("#txtYear").val());
                var txtNum= $.trim($("#txtNum").val());
                var qiangsheng = $.trim($("#qiangsheng").val());
                var videotitle = $.trim($("#videotitle").val());
                var descript = $.trim($("#descript").val());
                var describe = 1;
                var describetext = $.trim($("#describetext").val());
                var mailbox = $.trim($("#mailbox").val());
                

                if (name == "") {
                	alert("请输入姓名！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (hospital == "") {
                	alert("请输入医院！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (province == 0) {
                	alert("请选择省份！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (txtYear == "") {
                	alert("请输入超乳手术经验！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                  if (txtNum == "") {
                  	alert("请输入屈光性白内障年手术量！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (qiangsheng == "") {
                	alert("请输入强生眼力健负责销售！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (videotitle == "") {
                	alert("请输入参赛标题！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (descript == "") {
                	alert("请输入手术描述！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (describe == 0) {
                	alert("请选择手术类型！")
                    //alert_Tips(, "", 1500)
                    return false;
                }
                if (describe == "其他" && describetext == "") {
                	alert("请输入手术类型！")
                    //alert_Tips(, "", 1500)
                    return false;
                }

                if (mailbox == "") {
                	alert("请输入邮箱！")
                    //alert_Tips(, "", 1500)
                    return false;
                }



                $.ajax({
                    type: "POST",
                    url: 'setSign.aspx',
                    async: false,
                    data: { "name": name, "hospital": hospital, "province": province, "qiangsheng": qiangsheng, "videotitle": videotitle, "describe": describe, "describetext": describetext, "mailbox": mailbox, "descript": descript,"txtYear":txtYear,"txtNum":txtNum },
                    beforeSend: function (xmlHttpRequest) {
                    },
                    success: function (data, textStatus) {
                  
                        if (data == "1")
	                 	$("#ts").fadeIn()
                        else if (data == "-1")
                        	alert("非法请求！")
                            //alert_Tips(, "", 2000)
                        else if (data == "2")
                        	alert("您已经报名,不能重复报名！")
                            //alert_Tips(, "", 2000)
                        else
                        	alert("网络繁忙,请稍后再试！")
                            //alert_Tips(, "", 2000)
                            
                    },
                    complete: function (xmlHttpRequest, textStatus) {
                    },
                    error: function () {
                    }
                });


            })
        })

	function JSBridge() {
		WeixinJSBridge.call('closeWindow');
            	}

$(".jxbm").click(function () {
                window.location.href="sign_up.aspx";
            })
    </script>

     <script src="fx.js?v=2" type="text/javascript"></script>
     <% fenxiang fengxiang = new fenxiang(); fengxiang.fenxiang1(0); string linkhead = "https://wx.linkmed.cn/iCataract_line/img/share.jpg"; %>
    
   <script type="text/javascript">
       loadfx('https://wx.linkmed.cn/iCataract_line/sign_up.aspx', '<%=fenxiang.appid%>', '<%=fenxiang.timestamp %>', '<%=fenxiang.nonceStr %>', '<%=fenxiang.signature %>', '<%=linkhead %>', "2022年度强生全视白内障手术达人赛")
   </script>
</body>

</html>
