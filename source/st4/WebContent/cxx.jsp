<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%= basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="admin/static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<title>家庭相册管理系统</title>
</head>
<body>
<div class="page-container">
  <h1 class="text-c">你在使用移动端访问,移动端还在开发中,<a href="http://www.superboycxx.top/plan/" style="font-size:35px; color:blue;">点击这访问</a></h1>
  <br>
  <h1 class="text-c">2017-06-14 By Chenstars</h1>
</div>
</body>
</html>