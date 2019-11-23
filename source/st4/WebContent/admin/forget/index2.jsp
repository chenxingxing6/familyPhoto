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
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
  <title></title>
</head>
<body>
<form method="post" id="form">
<div class="nav">
  <span><em class="mark"></em><i class="mark"></i>1&nbsp;账号</span>
  <span><em class="mark"></em><i></i>2&nbsp;邮箱验证</span>
  <span><em></em><i></i>3&nbsp;找回密码</span>
</div>
<div class="row cl">
<label class="form-label col-xs-4 col-sm-3">邮箱:</label>
	<div class="formControls col-xs-6 col-sm-8">
		<input type="text" class="input-text" value="" placeholder="" id="email" name="email">
	</div>
	<div class="col-3"></div>
</div>
<div class="footer">
  <a href="admin/forget/index.jsp"><input type="button" value="上一步"/></a>
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
		email:{
			required:true,
			email:true
		}
	},
	messages: {
		email:{
			required:"请输入邮箱！",
		}
	},
	onkeyup:false,
	focusCleanup:true,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			type: 'POST',
			url: 'ajax?way=email',
			dataType: 'text',
			success: function(data){
				if(data==1){
					layer.msg("信息错误！",{icon:6,time:1000});
					$("#email").focus();
				}else{
					window.location.href='<%= basePath%>/admin/forget/response.jsp'
				}
			},
			error:function(data) {
				layer.msg("注册失败",{icon:6,time:1000});
			},
		});
	}
});
</script>
</body>
</html>