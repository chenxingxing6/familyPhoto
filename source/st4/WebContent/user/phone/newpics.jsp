<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DBpool.*" %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath %>">
<link rel="stylesheet" type="text/css" href="user/CSS/smallstyle.css" />
<script type="text/javascript" src="user/assets/js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
</head>
<body>
<form method="post" ENCTYPE="multipart/form-data" id="form1" action="">
<table class="definewidth me" >
<tr>
    <td colspan="3"></td>
</tr>
<tr class="tip">
    <td>相册名称</td> 
	<td width="80%" align="left">
	<input type="text" name="name" class="name">
	</td> 
</tr>
<tr class="tip">
	<td width="20%" style="padding-bottom:93px;">相册封面<input type="text"  class="url" style="display:none;"></td> 
	<td width="80%" align="left">
     <div id="preview" style="display:block; width:300px; height:200px; overflow:hidden; cursor: pointer;">
         <img id="imghead" border="0" src="user/dopic/imgs/add.png" width="80%" height="100%" onclick="$('#previewImg').click();">
     </div>         
     <input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg" name="file1">
	</td> 
</tr>
<tr>
    <td style="background:rgb(245,245,245);"></td>
	<td align="left">
	<div class="messbtn">
		<input type="submit" value="新建"/> &nbsp;
		<input type="button" value="返回" id="back"/> &nbsp;
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

$('#back').click(function() {
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0,index+1);
    window.location.href=result+"/user/phone/edit.jsp"
});

$("#form1").submit(function(){
	var name=$(this).find(".name").val();
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
	if(name==''){
		layer.msg('请输入相册名称！',{icon:7,time:1000});
        return false;
	}if(url=='upload/add.png'){
		layer.msg('请选择相册封面！',{icon:7,time:1000});
        return false;
	}
	else{
		  var action="newxcphoto?way=0&name="+name+"";         
		  $("#form1").attr("action",action);     
		  $("#form1").submit();
	}
});
</script>
</html>