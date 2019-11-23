<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<base href="<%= basePath%>">
<link rel="Bookmark" href="admin/favicon.ico" >
<link rel="Shortcut Icon" href="admin/favicon.ico" />
<title>家庭相册管理系统</title>
<style>
*{padding:0;margin:0;}
body{
	height:100%;
	width:100%;
}
</style>
</head>
<%
boolean isLog=false;
try
{
   isLog=((String)session.getAttribute("isLog")).equals("1");
}
catch(Exception e){}
if(!isLog)
{
  out.println("<script language='javascript'>alert('您还没有登录');parent.location.href='index.jsp';</script>");
}
%>
<frameset rows="*" cols="*,1300,*" framespacing="1" frameborder="no" border="1">
	<frame src="user/blankleft.jsp" name="blankFrame" scrolling="NO" noresize>
	<frameset rows="100,*,40" cols="*" frameborder="NO" class="main" framespacing="0">
	  <frame src="user/top.jsp" name="topFrame" scrolling="NO" noresize>
	  <frameset rows="*" cols="190,*,4" framespacing="0" frameborder="NO" border="0" height="1000">
		  	<frame src="user/left.jsp" name="leftFrame" frameborder="no" scrolling="no" noresize>
		    <frame src="userwelcome/index.html" name="mainFrame" frameborder="no" scrolling="yes" noresize>
	  </frameset>
	  <frame src="user/bottom.jsp" name="topFrame" scrolling="NO" noresize>
    </frameset>
  <frame src="user/blankright.jsp" name="blankFrame" scrolling="NO" noresize>	
</frameset>
</html>
