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
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script language="javascript">
layer.load();
//此处演示关闭
setTimeout(function(){
layer.closeAll('loading');
var pathName = document.location.pathname;
var index = pathName.substr(1).indexOf("/");
var result = pathName.substr(0,index+1);
parent.location.href=result+"/user/phone/index.jsp";
}, 1000);
</script>
</body>
</html>
