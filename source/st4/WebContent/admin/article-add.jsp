<%@ page contentType="text/html;charset=utf-8" language="java"%>
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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
<title></title>
</head>
<body>
<%
String user = request.getParameter("author");
String text = request.getParameter("text");
String id = request.getParameter("id");
request.setAttribute("aauer", user);
request.setAttribute("aatext",text);
%>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">发布者：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${aauer }" placeholder="admin" id="author" name="author" readonly = "readonly">
				<input type="hidden" class="input-text" value="<%=id %>" id="idd" name="idd">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">公告内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<textarea id="editor" name="editor" class="textarea" placeholder="发布公告...100个字符以内" onKeyUp="$.Huitextarealength(this,100)">${aatext}</textarea>
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p>
		</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
			  <c:if test="${empty aatext }">
			     <button class="btn btn-primary radius" type="submit" name="btn" id="cxxx" value="1">
			     <i class="Hui-iconfont">&#xe632;</i>发布公告</button>
			   </c:if>
			   <c:if test="${not empty aatext }">
			     <button class="btn btn-primary radius" type="submit" name="btn" id="cxxx" value="3">
			     <i class="Hui-iconfont">&#xe632;</i>提交修改</button>
			   </c:if>
				<button  class="btn btn-default radius" type="reset">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	//表单验证
	$("#form-article-add").validate({
		rules:{
			author:{
				required:true,
			},
			editor:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'POST',
				url: "<%= basePath%>/adminaddtell?way="+$("#cxxx").val()+"",
				dataType: 'text',
				success: function(data){
					var index = parent.layer.getFrameIndex(window.name);
				    //parent.location.reload();
					parent.layer.close(index);
				},
				error:function(data) {
					alert("发送失败");
				},
			});
		}
	});
});
</script>
</body>
</html>