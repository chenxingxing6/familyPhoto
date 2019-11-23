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
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%= basePath%>">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>家庭相册管理系统</title>
<link rel="stylesheet" href="user/phone/common/css/sccl.css">
<link rel="stylesheet" type="text/css" href="user/phone/common/skin/blue/skin.css" id="layout-skin"/>
</head>
<body>
<div class="layout-admin">
<header class="layout-header">
<span class="header-logo"><a href="javascript:location.replace(location.href);" style="color:white;">家庭相册管理系统</a></span> 
<a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
<ul class="header-bar">
<li class="header-bar-nav">
<a href="javascript:;">${username }<i class="icon-font" style="margin-left:5px;">&#xe60c;</i></a>
<ul class="header-dropdown-menu">
	<li><a href="javascript:;" onclick="show_me('${username }','admin/member-show.jsp')">个人信息</a></li>
	<li><a href="user/phone/userexit.jsp">&nbsp;&nbsp;退&nbsp;&nbsp;出</a></li>
	<li><a id="change">&nbsp;&nbsp;换&nbsp;&nbsp;肤</a>
	<ul class="header-dropdown-menu right dropdown-skin" id="llist" style="display:none;">
	<li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
	<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
	<li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>	
	</ul>
   </li>
</ul>
</li>
<li class="header-bar-nav"> 
	<a href="javascript:;"><i class="icon-font">&#xe608;</i></a>
	<ul class="header-dropdown-menu right dropdown-skin">
		<li><a href="javascript:;" data-val="qingxin" title="清新" class="tt">清新</a></li>
		<li><a href="javascript:;" data-val="blue" title="蓝色" class="tt">蓝色</a></li>
		<li><a href="javascript:;" data-val="molv" title="墨绿" class="tt">墨绿</a></li>	
	</ul>
</li>
</ul>
</header>
<aside class="layout-side">
	<ul class="side-menu"></ul>
</aside>
<div class="layout-side-arrow"><div class="layout-side-arrow-icon"><i class="icon-font">&#xe60d;</i></div></div>
<section class="layout-main">
<div class="layout-main-tab">
	<button class="tab-btn btn-left"><i class="icon-font">&#xe60e;</i></button>
    <nav class="tab-nav">
    <div class="tab-nav-content">
        <a href="javascript:;" class="content-tab active" data-id="user/dotell/showallmssage.jsp">附近分享</a>
    </div>
    </nav>
    <button class="tab-btn btn-right"><i class="icon-font">&#xe60f;</i></button>
</div>
<div class="layout-main-body">
	<iframe class="body-iframe" name="iframe0" width="100%" height="99%" src="user/phone/showallmssage.jsp" frameborder="0" data-id="user/dotell/showallmssage.jsp" seamless></iframe>
</div>
</section>
<div class="layout-footer" style="font-size:12px;">Copyright  ©  2017-2019  By  Chenstars</div>
</div>
<script type="text/javascript" src="user/phone/common/lib/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="user/phone/common/js/sccl.js"></script>
<script type="text/javascript" src="user/phone/common/js/sccl-util.js"></script>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/
});
function show_me(title,url,w,h){
	var url=url+"?user="+title;
	var title="用户信息";
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
	});
	layer.full(index);
}


$("#change").on({
    click:function(){$("#llist").slideToggle();}  
  });


/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script> 
</body>
<%
boolean isLog=false;
try
{
   isLog=((String)session.getAttribute("isLog")).equals("1");
}
catch(Exception e){}
if(!isLog)
{
%>
  <script>layer.msg("你还没有登陆!",{icon:7,time:2000});</script>
  <script>
   setTimeout(function(){
	   window.location.href='user/phone/index.jsp';
   },2000);
  </script>
<%
}
%>
</body>
</html>


