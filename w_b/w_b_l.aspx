<%@ Page Language="C#" AutoEventWireup="true" CodeFile="w_b_l.aspx.cs" Inherits="w_b_l" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <base target="mainFrame" />

    <title>服务平台管理系统</title>


        <!-- CSS -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/w_b_l_style.css">

      
</head>
<body oncontextmenu="return false">
    <!-- 主体 -->
	<form id="form1" runat="server" target="_self">
		
          <div class="page-container">
         
            <form action="" method="post">
				<div>
					<asp:TextBox ID="txtLoginName" CssClass="username" placeholder="请输入用户名" runat="server"></asp:TextBox>
				</div>
                <div>
                	<asp:TextBox ID="txtPwd" CssClass="password" placeholder="请输入密码" TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn-large" Text="登 陆" OnClientClick="return vaALL()" onclick="btnSubmit_Click"></asp:Button>
                
            </form>
            
        </div>
        
          
          
         <%-- <div class="controls">
                  <input type="checkbox" id="checkbox" class="regular-checkbox"><label for="checkbox"></label>自动登陆
                </div>--%>
          
       </form>
       
<div class="connect">
                <p>服务平台管理系统</p>
				
            </div>
            
<script type="text/javascript">
                   function vaALL()
                   {
                      if($.trim($("#txtLoginName").val())=="")
                      {
                         alert("请输入用户名!");
                         return false;
                      }
                      
                      if($.trim($("#txtPwd").val())=="")
                      {
                         alert("请输入密码!");
                         return false;
                      }
                      return true;
                   }
                 </script>
		</script>
</body>
</html>
