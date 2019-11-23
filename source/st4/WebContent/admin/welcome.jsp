<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="java.io.*"%>
<%@page import="com.DBpool.*"%>
<%@page import="com.Bean.*"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>我的桌面</title>
</head>
<body>
<%
  String user= (String)session.getAttribute("username");
  userloginBean userlogin=ConnecttionPooladmin.userloginBean(user);
  request.setAttribute("userlogin",userlogin);
  String count = ConnecttionPooladmin.countuserlogin(user);
%>
<div class="page-container">
	<p class="f-20 text-success">欢迎  ${username }！</p>
	<p>登录次数: <%=count %></p>
	<c:if test="${empty userlogin.ip }">
	这是你首次登陆!!!
	</c:if>
	<c:if test="${not empty userlogin.ip }">
	<p>上次登录IP: ${userlogin.ip } &nbsp;上次登录时间: ${userlogin.time }</p>
	</c:if>
	<br/>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th colspan="6" scope="col">信息统计</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>公告数</th>
				<th>相册库</th>
				<th>图片数</th>
				<th>评论数</th>
				<th>用户数</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<td>92</td>
				<td>9</td>
				<td>0</td>
				<td>8</td>
				<td>20</td>
			</tr>
			<tr class="text-c">
				<td>今日</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr class="text-c">
				<td>昨日</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr class="text-c">
				<td>本周</td>
				<td>2</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr class="text-c">
				<td>本月</td>
				<td>2</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
</body>
</html>