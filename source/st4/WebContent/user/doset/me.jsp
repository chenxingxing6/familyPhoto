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
<title></title>
<meta charset="UTF-8">
<base href="<%= basePath%>">
<link rel="stylesheet" type="text/css" href="user/CSS/smallstyle.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
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
#imghead{
	 border-radius: 50%;
}
.breadcrumb {
    border-bottom: 1px solid #e5e5e5;
    line-height: 39px;
    height: 39px;
    overflow: hidden;
}

.list-view>.item .Hui-iconfont {
	background-size:9px auto;
	margin-top:-7px;
	position:absolute;
	right:15px;
	top:50%
}

.btn {
    display: inline-block;
    box-sizing: border-box;
    cursor: pointer;
    text-align: center;
    padding: 4px 12px;
    height: 31px;
    border-radius: 4px;
    color: #fff;
    background-color: #5eb95e;
    border-color: #5eb95e;
    font-weight: 400;
    border: solid 1px #ddd;
    float: right!important;
    width: auto;
}
</style>
</head>
<body>
<%
  String name=((String)session.getAttribute("username"));
  String a[]=ConnecttionPoolTest.dosetshow(name);
  session.setAttribute("a",a);
%> 
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	账号管理
	<span class="c-gray en">&gt;</span>
	个人信息
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<form method="post" ENCTYPE="multipart/form-data" id="form1">
<table class="definewidth me" >
<tr height="10px">
    <td colspan="3"></td>
</tr>
<tr class="tip">
	<td width="20%" style="padding-bottom:68px;">头像<input type="text"  class="url" style="display:none;"></td> 
	<td width="80%" align="left">
     <div id="preview" style="display:block; width:200px; height:150px; overflow:hidden; cursor: pointer;">
         <img id="imghead" title="点击我，更换头像" border="0" src="${a[4] }" width="80%" height="100%" onclick="$('#previewImg').click();">
     </div>         
     <input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg" name="file1">
	</td> 
</tr>
<tr>
    <td style="background:rgb(245,245,245);"></td>
	<td align="left">
	<div class="messbtn">
		<input type="submit" value="修改头像"/>
	</div>
	</td> 
</tr>
</table>
</form>

<form action="" method="post" id="form2">
<table class="definewidth me">
<tr class="tip">
	<td>姓名</td>
	<td width="80%" align="left"><input type=text name="name" id="name" class="name" value="${username}" disabled></td> 
</tr>
<tr class="tip">
	<td width="20%">电话</td> 
	<td width="80%" align="left"><input type=text name="phone" id="phone" class="phone" value="${a[0]}"></td> 
</tr>
<tr class="tip">
	<td width="20%">邮箱</td> 
	<td width="80%" align="left"><input type=text name="email" id="email" class="mail" value="${a[2]}"></td> 
</tr>
<tr class="tip">
	<td width="20%">QQ</td> 
	<td width="80%" align="left"><input type=text name="qq" id="qq" class="qq" value="${a[1] }"></td> 
</tr>
<tr class="tip">
	<td width="20%">注册时间</td> 
	<td width="80%" align="left"><input type="text" name="birth" class="birth" value="${a[3] }" disabled></td> 
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


<form action="" method="post" id="form3">
<table class="definewidth me" >
<tr>
    <td colspan="3"></td>
</tr>
<tr>
    <th colspan="4">密码修改</th>
</tr>
<tr class="tip">
	<td width="20%">旧密码</td> 
	<td width="80%" align="left"><input type=text name="pwd" id="pwd"><i id="tip2"></i></td> 
</tr>
<tr class="tip">
	<td width="20%">新密码</td> 
	<td width="80%" align="left"><input type=text name="newpwd" id="newpwd"></td> 
</tr>
<tr class="tip">
	<td width="20%">确认密码</td> 
	<td width="80%" align="left"><input type=text name="renewpwd" id="renewpwd"></td> 
</tr>
<tr>
    <td style="background:rgb(245,245,245);"></td>
	<td align="left">
	<div class="messbtn">
		<input type="submit" value="修改密码"/> &nbsp; <span id="tip3"></span>
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
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script>
$("#form1").submit(function(){
	var name=$("#form2").find(".name").val();
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
	else{
		  var action="newxcphoto?way=1";         
		  action+="&name="+name;  
		  $("#form1").attr("action",action);     
		  $("#form1").submit();
	}
});

$("#form2").validate({
	rules:{
		phone:{
			required:true,
			minlength: 11,
			isMobile : true
		},
		email:{
			required:true,
			email: true
		},
		qq:{
			required:true,
		}
	},
	messages: {
		phone:{
			required:"请输入手机号！",
			minlength:"确认手机不能小于11个字符",
			isMobile : "请正确填写您的手机号码"
		},
		email:{
			required:"请输入电子邮箱！"
		},
		qq:{
			required:"请输入QQ号",
		}
	},
	onkeyup:false,
	focusCleanup:true,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			type: 'POST',
			url: "updateUser.do?nana="+$("#name").val()+"",
			dataType: 'text',
			success: function(data){
				if(data==1){
					layer.msg("修改成功！",{icon:7,time:1000});
				}else if(data==0){
					layer.msg("修改失败",{icon:7,time:1000});
				}
			},
			error:function(data) {
				layer.msg("发送失败",{icon:7,time:1000});
			},
		});
	}
});

$("#form3").validate({
	rules:{
		pwd:{
			required:true,
			remote:"ajaxpwd?name="+$("#form2").find(".name").val()+""
		},
		newpwd:{
			required:true,
			minlength: 6
		},
		renewpwd:{
			required:true,
			minlength: 6,
			equalTo:"#newpwd"
		}
	},
	messages: {
		pwd:{
			required:"请输入原来的密码",
			remote: "密码输入错误！"
		},
		newpwd:{
			required:"请输入新密码",
			minlength:"密码至少6位以上"
		},
		renewpwd:{
			required:"请再次输入密码",
			minlength:"密码至少6位以上",
			equalTo:"两次密码不一致！"
		}
		
	},
	onkeyup:false,
	focusCleanup:true,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			type: 'POST',
			url: "updatePwd.do?name="+$("#form2").find(".name").val()+"",
			dataType: 'text',
			success: function(data){
				if(data==1){
					layer.msg("修改成功!请重新登陆！",{icon:7,time:1000});
					setTimeout(function(){
	    				  top.location.href="user/doset/userexit.jsp";
	    			  },2000); 
				}
				else if(data==0){
					layer.msg("修改失败！",{icon:7,time:1000});
				}else if(data==2){
					layer.msg("密码与原来一致！",{icon:7,time:1000});
				}
			},
			error:function(data) {
				layer.msg("发送失败",{icon:7,time:1000});
			},
		});
	}
});

function showlogin(title,url,w,h){
	layer_show(title,url,w,h);
}

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