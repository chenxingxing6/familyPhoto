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
  <title></title>
</head>
<body>
<%
	String pwd=request.getParameter("pwd");
%>
<script type="text/javascript">
  function show(){
    top.location.href="<%= basePath%>index.jsp";
  }
</script>
<form action=""  method="post" id="form1">
<div class="nav">
  <span><em class="mark"></em><i class="mark"></i>1&nbsp;账号</span>
  <span><em class="mark"></em><i class="mark"></i>2&nbsp;回答问题</span>
  <span><em class="mark"></em><i class="mark"></i>3&nbsp;找回密码</span>
</div>
<p>密码已经发送至你的邮箱，请注意查收！</p>
<br>
<div class="footer">
  <a href="javascript:show()">返回登陆界面</a>
  <a href="https://mail.qq.com/"  target="_blank">前往QQ邮箱</a>
</div>
</form>   
</body>
</html>