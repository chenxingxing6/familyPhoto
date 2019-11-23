<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <base href="<%= basePath%>">
  <link rel="stylesheet" href="admin/forget/css/style.css">
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
  <title></title>
</head>
<body>
<form method="post" id="form">
<div class="nav">
  <span><em class="mark"></em><i class="mark"></i>1&nbsp;账号</span>
  <span><em></em><i></i>2&nbsp;邮箱验证</span>
  <span><em></em><i></i>3&nbsp;找回密码</span>
</div>
<div class="row cl">
<label class="form-label col-xs-4 col-sm-3">用户名:</label>
	<div class="formControls col-xs-6 col-sm-8">
		<input type="text" class="input-text" value="" placeholder="" id="user" name="user">
	</div>
	<div class="col-3"></div>
</div>
<br>
<div class="row cl">
<label class="form-label col-xs-4 col-sm-3">手机号:</label>
	<div class="formControls col-xs-6 col-sm-8">
		<input type="text" class="input-text" value="" placeholder="" id="phone" name="phone">
	</div>
	<div class="col-3"></div>
</div>
<div class="footer">
  <a><input type="submit" value="下一步" /></a>
</div>
</form> 
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
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$("#form").validate({
	rules:{
		user:{
			required:true,
		},
		phone:{
			required:true,
			minlength: 11,
			isMobile : true
		}
	},
	messages: {
		user:{
			required:"请输入用户名！",
		},
		phone:{
			required:"请输入手机号！",
			minlength:"确认手机不能小于11个字符",
			isMobile : "请正确填写您的手机号码"
		}
	},
	onkeyup:false,
	focusCleanup:true,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			type: 'POST',
			url: 'ajax?way=forget',
			dataType: 'text',
			success: function(data){
				if(data==3||data==2){
					layer.msg("信息错误！",{icon:6,time:1000});
					$("#user").focus();
				}else if(data==1){
					var user=$("#user").val();
					window.location.href='<%= basePath%>/admin/forget/index2.jsp'
				}
			},
			error:function(data) {
				layer.msg("发送失败",{icon:6,time:1000});
			},
		});
	}
});
</script>
</body>
</html>