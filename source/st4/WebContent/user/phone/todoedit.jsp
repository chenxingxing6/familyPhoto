<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DBpool.*"%>
<%@page import="java.util.*" %>
<%@page import="com.Bean.*"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8">
<base href="<%=basePath %>">
<link rel="stylesheet" type="text/css" href="user/CSS/smallstyle.css" />
<script type="text/javascript" src="user/assets/js/jquery-1.8.2.min.js"></script>
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
	String title = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
	String url= request.getParameter("url");
	String id= request.getParameter("id");
	pictureBean a=ConnecttionPoolTest.dopicshowone(id);
	session.setAttribute("pic",a);
%> 
<form method="post" id="form1">
<table class="definewidth me" >
<tr>
    <td colspan="3"></td>
</tr>
<tr class="tip">
	<td>相册名称</td>
	<td width="80%" align="left">
	<input type=text name="name" class="name" value="<%=title %>">
	<input type=hidden name="oldname" class="oldname" value="<%=title %>">
	</td> 
</tr>
<tr class="tip">
	<td width="20%" style="padding-bottom:93px;">相册封面<input type="text" value="<%=url %>" class="url" style="display:none;"></td> 
	<td width="80%" align="left">
     <div id="preview" style="display:block; width:300px; height:200px; overflow:hidden; cursor: pointer;">
         <img id="imghead" border="0" src="<%=basePath %>${pic.url }" width="80%" height="100%" onclick="$('#previewImg').click();">
     </div>      
     <input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg">
	</td> 
</tr>
<tr class="tip">
	<td width="20%">上次修改时间</td> 
	<td width="80%" align="left"><input type=text name="email" value="${pic.time }" class="mail" disabled></td>
</tr>
<tr>
    <td style="background:rgb(245,245,245);"></td>
	<td align="left">
	<div class="messbtn">
		<input type="submit" value="修改"/> &nbsp; <span id="tip1"></span>
	</div>
	</td> 
</tr>
</table>
</form>
</body>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script>

$("#form1").submit(function(){
	var name=$(this).find(".name").val();
	var oldname=$(this).find(".oldname").val();
	var src = $('#previewImg').val();
	var pos=src.lastIndexOf("\\");
	var url="upload/"
	url+=src.substring(pos+1);  
	if(src==''){
		src=$('#imghead')[0].src;
		var arrUrl=src.split("/"); 
		var url="upload/"
		url+=arrUrl[arrUrl.length-1]; 
	}
	if(name!=''){
		layer.confirm('您确定要修改吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				$.ajax({
		    		type: "POST", //用POST方式传输
		    		dataType: "text", //数据格式:JSON
		    		url: "ajaxpic?name="+name+"&oldname="+oldname+"&url="+url+"", //目标地址
		    		data: "id="+<%=id %>,  
		    		error: function (XMLHttpRequest, textStatus, errorThrown) {},
		    		success: function (msg){
		    			layer.msg('修改成功！',{icon:1,time:1000});
		    			parent.location.reload();
		    		}
		    	});
			}, function(){
				layer.msg('取消成功！', {icon: 1,time:1000});
			});
		return false;
	}else{ return false;}
});

function previewImage(file)
{
   if (file.files && file.files[0])
   {
      var img = document.getElementById('imghead');
      var reader = new FileReader();
      reader.onload = function(evt){img.src = evt.target.result;}
      reader.readAsDataURL(file.files[0]);
}
}
</script>
</html>