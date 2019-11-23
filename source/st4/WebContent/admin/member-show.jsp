<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DBpool.*"%>
<%@page import="com.Bean.*" %>
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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
<title>用户查看</title>
</head>
<body>
<%
String name = new String(request.getParameter("user").getBytes("iso-8859-1"), "utf-8");
String count = ConnecttionPooladmin.countuserlogin(name);
userBean user=ConnecttionPooladmin.showoneuser(name);
request.setAttribute("user", user);
%>
<c:if test="${empty user.id }">
操作错误！
</c:if>
<c:if test="${not empty user.id}">
<div class="cl pd-20" style=" background-color:#5bacb6">
	<img class="avatar size-XL l" src="${user.img }">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18"><%=name %></span>
		</dt>
		<dd class="pt-10 f-12" style="margin-left:0">登陆系统次数： <%=count %>次</dd>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="80">ID编号：</th>
				<td>${user.id }</td>
			</tr>
			<tr>
				<th class="text-r" width="80">QQ号码：</th>
				<td>${user.email }</td>
			</tr>
			<tr>
				<th class="text-r">手机号码：</th>
				<td>${user.phone }</td>
			</tr>
			<tr>
				<th class="text-r">电子邮箱：</th>
				<td>${user.qq }</td>
			</tr>
			<tr>
				<th class="text-r">用户类型：</th>
				<td>${user.style }</td>
			</tr>
			<tr>
				<th class="text-r">注册时间：</th>
				<td>${user.birth }</td>
			</tr>
		</tbody>
	</table>
</div>
</c:if>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>