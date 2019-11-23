<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%= basePath%>">
<link rel="Bookmark" href="admin/favicon.ico" >
<link rel="Shortcut Icon" href="admin/favicon.ico" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>登录</title>
<link rel="stylesheet" href="user/phone/common/layui/css/layui.css">
<link rel="stylesheet" href="user/phone/common/css/sccl.css">
<style type="text/css">
.bbtn{
	border: 1px solid #C9C9C9;
    background-color: #fff;
    display: inline-block;
    vertical-align: middle;
    height: 36px;
    line-height: 36px;
    padding: 0 18px;
    white-space: nowrap;
    text-align: center;
    border: none;
    border-radius: 2px;
    cursor: pointer;
    opacity: 0.9;
    color:black;
    filter: alpha(opacity=90);
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
</style>
</head>
<body class="login-bg">
<div class="login-box">
<header>
   <h1>家庭相册管理系统</h1>
</header>
<div class="login-main">
<form action="" class="layui-form" method="post" id="form-login">           
	<div class="layui-form-item">
	<input type="text" name="user" id="user" placeholder="这里输入登录名" class="layui-input">
	</div>
	<div class="layui-form-item">
	<input type="password" name="password" id="password" placeholder="这里输入密码" class="layui-input">
	</div>
	<div class="layui-form-item">
	<div class="pull-left">
	<button class="layui-btn layui-btn-primary">登录</button>
	<i class="bbtn" onclick="register('注册','admin/register.jsp');">注册</i>
	<i onclick="findpwd('找回密码','admin/forget/index.jsp');" style="color:white;">忘记密码</i>
	</div>
	<div class="clear"></div>
	</div>
</form>        
</div>
<footer>
    <p>Copyright © 2017-2019 by chenstars</p>
</footer>
</div>
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="user/phone/common/layui/layui.js"></script>
<!--/_footer 作为公共模版分离出去-->
<script>
$(function(){
	$("#form-login").validate({
		rules:{
			user:{
				required:true,
			},
			password:{
				required:true,
				minlength: 6
			}
		},
		messages: {
			user:{
				required:"请输入用户名",
			},
			password:{
				required:"请输入密码",
				minlength:"密码至少6位以上"
			}
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'POST',
				url: 'ajax?way=loginphone',
				dataType: 'text',
				success: function(data){
					if(data==0){
						layer.msg("用户名或密码错误！",{icon:7,time:1000});
						$("#password").focus();
					}
					else if(data==1){
						window.location.href="user/phone/main.jsp";
					}
				},
				error:function(data) {
					layer.msg("发送失败",{icon:7,time:1000});
				},
			});
		}
	});
});

function findpwd(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
	});
	layer.full(index);
}

function register(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
	});
	layer.full(index);
}
</script>
</body>
</html>

