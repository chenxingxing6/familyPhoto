<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="java.io.*"%>
<%@page import="com.DBpool.*"%>
<%@page import="com.Bean.*"%>
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
<base href="<%=basePath %>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
</head>
<style>
#addCommodityIndex .row .big-photo{
	width:150px;
	margin-left:16px;
}
</style>
<body>
<%
  String user = ((String)session.getAttribute("username"));
  List<allpictoshowBean> a=ConnecttionPooladmin.toshowpic(user,"all");
  session.setAttribute("picall",a);
  int size= a.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	<a href="javascript:;" onclick="datacho()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe615;</i> 确定</a> 
	</span> <span class="r">共有图片：<strong class="count">${size }</strong> 张</span> </div>
	<div class="portfolio-content">
		<ul class="cl portfolio-area">
			<li class="item">
			<div class="portfoliobox">
			<div id="addCommodityIndex">
  			<div class="input-group row">
  			<div class="col-sm-9 big-photo">
    		<form action="addpics?nana=1" method="post" ENCTYPE="multipart/form-data">
    		<div id="preview">
    		<a href="javascript:void()" title="请选择图片"><img id="imghead" border="0" src="upload/add.png" width="120" height="120" onclick="$('#previewImg').click();"></a>
    		</div> 
    		<input type="text" name="user"  value="<%=user %>" style="display:none">        
    		<input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg" name="image">
    		<input type="submit" value="确定上传" class="btn btn-success">
			</form>
   			</div>
    		</div>   
			</div>
			</div>
			</li>
			<c:forEach items="${picall }" var="a" varStatus="i">
			<li class="item">
				<div class="portfoliobox">
					<input class="checkbox" name="subChk" type="checkbox" value="${a.id }" data-url="${a.url }">
					<div class="picbox"><a href="javascript:;"  data-title="第${i.index+1 }张"><img src="${a.url }"></a></div>
					<div class="textbox">第${i.index+1 }张</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$.Huihover(".portfolio-area li");
});

function datadel(obj){
	var checkedNum = $("input[name='subChk']:checked").length; 
	if(checkedNum == 0) { 
		layer.msg('请选择至少一项!',{icon: 7,time:1500});
		return; 
	}
	layer.confirm('确定要删除所选项目？',function(index){
		var checkedList = new Array(); 
		$("input[name='subChk']:checked").each(function() { 
			checkedList.push($(this).val()); 
		});
		$.ajax({
			type: 'POST',
			url: 'adminpic?way=delmorepic',
			dataType: 'text',
			data: {'delitems':checkedList.toString()}, 
			success: function(data){
				layer.msg('删除成功!',{icon: 6,time:1500});
				$("[name ='subChk']:checkbox").attr("checked", false); 
				setTimeout("window.location.reload()",800);
			},
			error:function(data) {
			},
		});		
	});
}

function datacho(){
	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	var checkedNum = $("input[name='subChk']:checked").length; 
	if(checkedNum == 0) { 
		layer.msg('请选择一张图片!',{icon: 7,time:1500});
		return; 
	}else if(checkedNum >1){
		layer.msg('只能选择一张图片!',{icon: 7,time:1500});
		return;
	}else{
		 var val = $("input[name='subChk']:checked").data('url');
		 parent.$('#imghead').attr("src",val);
		 parent.layer.close(index);
	}	    
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
</body>
</html>