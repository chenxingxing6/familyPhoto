<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<%
   session.removeAttribute("username");
   session.invalidate(); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8">
<base href="<%= basePath%>">
</head>
<body>
<script>
   parent.location.href='<%= basePath%>index.jsp';
</script>
</body>
</html>
