<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="java.io.*"%>
<%@page import="com.DBpool.*"%>
<%@page import="com.Bean.*"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<base href="<%= basePath%>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
<title>用户注册</title>
</head>
<body>
<div class="page-container">
<form action="" method="post" class="form form-horizontal" id="form1">
<div id="tab-category" class="HuiTab">
<div class="tabBar cl">
	<span>普通用户</span>
	<span>管理员</span>
</div>
	<div class="tabCon">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="user" name="user" placeholder="请输入用户名">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入手机号" id="phone" name="phone">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">QQ：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入QQ号" id="qq" name="qq">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
			<span class="c-red">*</span>
			性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<span class="select-box">
			<select class="select" id="sel_Sub" name="sel_Sub" onchange="SetSubID(this);">
				<option value="man">男</option>
				<option value="woman">女</option>
			</select>
			</span>
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入邮箱号" id="email" name="email">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="至少6位数以上" id="password" name="password">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
		    <label class="form-label col-xs-4 col-sm-3">确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="请输入确认密码" id="repassword" name="repassword">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<div class="col-9 col-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;注册&nbsp;&nbsp;">
			</div>
		</div>
	</div>
</form>

<form action="" method="post" class="form form-horizontal" id="form2">		
	<div class="tabCon">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="user" name="user">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入手机号码" id="phone" name="phone">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">QQ：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入QQ号" id="qq" name="qq">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
			<span class="c-red">*</span>
			性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<span class="select-box">
			<select class="select" id="sel_Sub" name="sel_Sub" onchange="SetSubID(this);">
				<option value="man">男</option>
				<option value="woman">女</option>
			</select>
			</span>
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入邮箱地址" id="email" name="email">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">邀请码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入邀请码" id="yaoqma" name="yaoqma">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="至少6位数以上" id="pwd" name="password">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
		    <label class="form-label col-xs-4 col-sm-3">确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" value="" placeholder="请输入确认密码" id="repwd" name="repassword">
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row cl">
			<div class="col-9 col-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;注册&nbsp;&nbsp;">
			</div>
		</div>	
	</div>	
</form>			
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

<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$.Huitab("#tab-category .tabBar span","#tab-category .tabCon","current","click","0");
	
	$("#form1").validate({
		rules:{
			user:{
				required:true,
			},
			password:{
				required:true,
				minlength: 6
			},
			repassword:{
				required:true,
				equalTo: "#password"
			},
			email:{
				required:true,
				email:true
			},
			phone:{
				required:true,
				minlength: 11,
				isMobile : true
			},
			qq:{
				required:true,
			}
		},
		messages: {
			password:{
				required:"请输入密码！",
				minlength: "至少6位数以上"
			},
			user:{
				required:"请输入用户名！",
			},
			repassword:{
				required:"请输入确认密码！",
				minlength:"密码至少6位以上",
				equalTo:"两次密码不一致！"
			},
			email:{
				required:"请输入电子邮箱！"
			},
			phone:{
				required:"请输入手机号！",
				minlength:"确认手机不能小于11个字符",
				isMobile : "请正确填写您的手机号码"
			},
			qq:{
				required:"请输入QQ号！"
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'POST',
				url: 'ajax?way=register&sty=user',
				dataType: 'text',
				success: function(data){
					if(data==0){
						layer.msg("该用户存在！",{icon:6,time:1000});
						$("#user").focus();
					}else if(data==1){
						layer.msg("注册成功！",{icon:7,time:1000});	
						var index = parent.layer.getFrameIndex(window.name);
						parent.$('.btn-refresh').click();
						setTimeout(function(){
							parent.layer.close(index);
						},3000);
					}
				},
				error:function(data) {
					layer.msg("注册失败",{icon:6,time:1000});
				},
			});
		}
	});
	
	
	$("#form2").validate({
		rules:{
			user:{
				required:true,
			},
			password:{
				required:true,
				minlength: 6
			},
			repassword:{
				required:true,
				equalTo: "#pwd"
			},
			yaoqma:{
				required:true,
			},
			email:{
				required:true,
				email:true
			},
			phone:{
				required:true,
				minlength: 11,
				isMobile : true
			},
			qq:{
				required:true,
			}
		},
		messages: {
			password:{
				required:"请输入密码！",
				minlength: "至少6位数以上"
			},
			repassword:{
				required:"请输入确认密码！",
				equalTo:"两次密码不一致！",
				minlength:"密码至少6位以上"
			},
			user:{
				required:"请输入用户名！",
			},
			yaoqma:{
				required:"请输入邀请码！",
			},
			email:{
				required:"请输入电子邮箱！"
			},
			phone:{
				required:"请输入手机号！",
				minlength:"确认手机不能小于11个字符",
				isMobile : "请正确填写您的手机号码"
			},
			qq:{
				required:"请输入QQ号！"
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'POST',
				url: 'ajax?way=register&sty=admin',
				dataType: 'text',
				success: function(data){
					if(data==0){
						layer.msg("该用户存在！",{icon:6,time:1000});
						$("#user").focus();
					}else if(data==1){
						layer.msg("注册成功！",{icon:7,time:1000});	
						var index = parent.layer.getFrameIndex(window.name);
						parent.$('.btn-refresh').click();
						setTimeout(function(){
							parent.layer.close(index);
						},3000);
					}else if(data==3){
						layer.msg("邀请码错误！",{icon:6,time:1000});
						$("#yaoqma").focus();
					}
				},
				error:function(data) {
					layer.msg("注册失败",{icon:6,time:1000});
				},
			});
		}
	});
});
</script>
</body>
</html>