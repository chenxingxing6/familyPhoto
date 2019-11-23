<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DBpool.*" %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html lang="en">
<head>
<title>家庭相册管理系统</title>
<meta charset="UTF-8">
<base href="<%= basePath%>">
<link rel="Bookmark" href="admin/favicon.ico" >
<link rel="Shortcut Icon" href="admin/favicon.ico" />
<link href="admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="admin/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="admin/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.header{
	position: relative;
}
.header a{
  color: white;
  position: absolute;
  right: 0;
  top: 18px;
}
.stylee{
	width:108px;
	height:40px;
	padding-left:20px;
	font-size:14px;
}
}
</style>
</head>
<script type="text/javascript">
function goPAGE() {
if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
	window.location.href="http://www.superboycxx.top:8080/st4/user/phone/index.jsp";
}
else {}
}
goPAGE();
</script>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header">
<a href="http://www.superboycxx.top/plan/">预览->移动端正在设计中</a>
</div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" id="form-login">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="user" name="user" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" style="width:150px;" name="yzm" id="yzm">
          <img src="getCode" id="img" onclick="change()" title="看不清，换一张" style="cursor: pointer;">
          <select class="stylee" id="stylee" name="stylee">
		  <option value ="user">普通用户</option>
		  <option value ="admin">&nbsp;管理员</option>
		  </select>
          </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input type="submit" class="btn btn-success radius size-L" value="登&nbsp;录">
          <input type="button" onclick="showlogin('欢迎注册','admin/register.jsp','500','500')" class="btn btn-success radius size-L" value="注&nbsp;册">
          <input type="reset" class="btn btn-default radius size-L" value="取&nbsp;消">
          <input type="button" onclick="showlogin('找回密码','admin/forget/index.jsp','500','420')" class="btn btn-default radius size-L" value="忘记密码">
        </div>
      </div>
    </form>
  </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-login").validate({
		rules:{
			user:{
				required:true,
			},
			password:{
				required:true,
				minlength: 6
			},
			yzm:{
				required:true,
				minlength: 4,
				maxlength: 4
			}
		},
		messages: {
			yzm:{
				required:"请输入验证码",
				minlength: "请正确输入",
				maxlength: "请正确输入"
			},
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
				url: 'ajax?way=login',
				dataType: 'text',
				success: function(data){
					if(data==0){
						layer.msg("验证码错误！",{icon:7,time:1000});
						$("#yzm").focus();
					}
					else if(data==2){
						layer.msg("用户名或密码错误！",{icon:7,time:1000});
						$("#password").focus();
					}
					else if(data=='admin'){
						window.location.href="admin/index.jsp";
					}else if(data=='user'){
						window.location.href="<%= basePath%>user/main.jsp";
					}
				},
				error:function(data) {
					layer.msg("发送失败",{icon:7,time:1000});
				},
			});
		}
	});
});

function showlogin(title,url,w,h){
		layer_show(title,url,w,h);
}

function change(obj) { 
	var timenow = new Date().getTime();  
	$("#img").attr('src',"getCode?d="+timenow+"");
}

function closewin()
{
self.opener=null;
self.close();
}	
</script>
</body>
</html>