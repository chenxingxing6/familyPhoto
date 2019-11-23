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
            background:rgb(245,245,245);
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
	系统公告
	<span class="c-gray en">&gt;</span>
	信息反馈
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">姓名:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${username }" id="author" name="author" readonly = "readonly">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">电子邮箱:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="email" name="email" placeholder="必填，以便联系到你!">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">反馈信息:</label>
			<div class="formControls col-xs-8 col-sm-9">
			<textarea id="editor" name="editor" class="textarea" placeholder="发布你在使用系统遇到的问题...100个字符以内" onKeyUp="$.Huitextarealength(this,100)">${aatext}</textarea>
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p>
		</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
			     <button class="btn btn-primary radius" type="submit" name="btn" value="1">
			     <i class="Hui-iconfont">&#xe632;</i>&nbsp;发布&nbsp;</button>
				<button  class="btn btn-default radius" type="reset">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>

<c:if test="${size!=0}">
<div class="am_tuya" style="width:63%;">
<div class="am_tuya_user_ico"><img src="${b[4] }" alt=""></div>
  <div class="am_tuya_user_info">
  <div class="am_tuya_user_info_name">我的反馈信息&nbsp;<span style="font-size:13px;">共<i id="cxx2">${size }</i>条</span></div>
  <div class="am_tuya_user_info_coordinate"><span class="am_tuya_user_info_time"></span>
  </div>
</div>
<div class="am_tuya_content">
<c:forEach items="${backs }" var="a" varStatus="i">
<div class="am_tuya_content_l" style="background:white; padding:10px; width:100%;">
	<h4>&nbsp;${a.text }</h4>
	<p style="font-size:11px;">&nbsp;&nbsp;&nbsp;发布时间:${a.data }
	 第${size-i.index }条&nbsp;&nbsp;<a onclick="delback(this,${a.id });"  herf="javascript:;">删除</a>
	</p>
	<div class="am_tuya_comment_user_l">
	<img src="upload/default.png" alt="">系统管理员【回复】
	</div>
	<div class="am_tuya_comment_text">	${a.reply }</div>
	<hr style="background:gray; margin-top:5px;">
</div>
</c:forEach>
</div>
</div>
</c:if>
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
	var method = $(".btn").val();
	$("#form-article-add").validate({
		rules:{
			author:{
				required:true,
			},
			email:{
				required:true,
				email:true
			},
			editor:{
				required:true,
			},
		},
		messages: {
			editor:{
				required:"请输入你要反馈的信息!"
			},
			email:{
				required:"请输入你email!",
				email:"请输入正确的电子邮箱!"
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'POST',
				url: 'addmessage?way=1',
				dataType: 'text',
				success: function(data){
				if(data==1){
					layer.msg("发送成功！",{icon:6,time:2000});
					window.location.reload();
				}else if(data==0){
					layer.msg("发送失败！",{icon:7,time:1000});
				}

				},
				error:function(data) {
					layer.msg("发送失败！",{icon:7,time:1000});
				},
			});
		}
	});
});

function delback(obj,id){
	var t=$("#cxx2").text();
	t--;
	$.ajax({
		type: 'POST',
		url: 'ajax?way=6&id='+id+'',
		dataType: 'text',
		success: function(data){
			if(data==1){
				$(obj).parent().parent().remove();
			    $("#cxx2").html(t);
				layer.msg("删除成功！",{icon:6,time:1000});
			}else{
				layer.msg("删除失败！",{icon:7,time:1000});
			}
		},
		error:function(data) {
			console.log(data.msg);
		},
	});		
}
</script>
</html>