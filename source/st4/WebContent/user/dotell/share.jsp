<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DBpool.*"%>
<%@page import="com.Bean.*"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%> 
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="user/assets/css/petshow.css">
    <link rel="stylesheet" type="text/css" href="user/CSS/smallstyle.css" />
    <link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>
<body>
<%
  String user=((String)session.getAttribute("username"));
  List<fadebackBean> back=ConnecttionPoolTest.showback(user);
  session.setAttribute("backs",back);
  String b[]=ConnecttionPoolTest.dosetshow(user);
  request.setAttribute("b",b);
  int size= back.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	分享图片
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-2">姓名:</label>
			<div class="formControls col-xs-8 col-sm-8">
				<input type="text" class="input-text" value="${username }" id="author" name="author" readonly = "readonly">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-2">标题:</label>
			<div class="formControls col-xs-8 col-sm-8">
				<input type="text" class="input-text" id="title" name="title" placeholder="在此输入分享标题!">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-2">图片:</label>
			<div class="formControls col-xs-8 col-sm-8">
		     <div id="preview" style="display:block; width:200px; height:150px; overflow:hidden; cursor: pointer;">
		         <img id="imghead" title="上传分享的图片" border="0" src="upload/add.png" width="80%" height="100%" onclick="$('#previewImg').click();">
		     </div>         
    		 </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-2">内容:</label>
			<div class="formControls col-xs-8 col-sm-8">
			<textarea id="editor" name="editor" class="textarea" placeholder="写出你的感悟...500个字符以内" onKeyUp="$.Huitextarealength(this,500)">${aatext}</textarea>
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p>
		</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-3 col-sm-offset-2">
			     <button class="btn btn-primary radius" type="submit" name="btn" value="1">
			     <i class="Hui-iconfont">&#xe632;</i>&nbsp;发布&nbsp;</button>
				<button  class="btn btn-default radius" type="reset">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				<button  onclick="upp();" class="btn btn-default radius" type="button">&nbsp;&nbsp;查看&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>
</body>
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
			title:{
				required:true,
			},
			editor:{
				required:true,
			},
		},
		messages: {
			editor:{
				required:"请输入你的感想!"
			},
			title:{
				required:"请输入分享文章的标题"
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var src = $("#imghead")[0].src;
			var arrUrl=src.split("/"); 
			var url="upload/"
			url+=arrUrl[arrUrl.length-1]; 
			$(form).ajaxSubmit({
				type: 'POST',
				url: 'addmessage?way=2&url='+url,
				dataType: 'text',
				success: function(data){
				if(data==1){
					layer.msg("发成布功！",{icon:6,time:2000});
					var pathName = document.location.pathname;
					var index = pathName.substr(1).indexOf("/");
					var result = pathName.substr(0,index+1);
					setTimeout(function(){
						window.location.href=result+"/user/dotell/shareshow.jsp";
					},2000);  
				}else if(data==0){
					layer.msg("发布失败！",{icon:7,time:1000});
				}

				},
				error:function(data) {
					layer.msg("发送失败！",{icon:7,time:1000});
				},
			});
		}
	});
});

$("#preview").on('click',function(){
	var index = layer.open({
		  title:'图片库',
		  type: 2,
		  content: 'user/dotell/medium.jsp'
		});
		layer.full(index);
});
function upp(){
	window.location.href="<%=basePath%>user/dotell/shareshow.jsp";  
    window.event.returnValue=false;
}
</script>
</html>