<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.Bean.*"%>
<%@page import="java.util.*" %>
<%@page import="com.DBpool.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<base href="<%= basePath%>">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link rel="Bookmark" href="admin/favicon.ico" >
<link rel="Shortcut Icon" href="admin/favicon.ico" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
<title>家庭相册后台管理系统</title>	
<style type="text/css">
	.logo a{
		font-size: 18px;
		padding-left: 5px;
		color: white;
		text-decoration: none;
	}
	@media(max-width:768px) {
	#cxx{
		display:none;
	}
    }
</style>
</head>
<body>
<%
  List<newsBean> news=ConnecttionPooladmin.shownews();
  int size= news.size();
  request.setAttribute("size",size);
%>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
			<span class="logo navbar-slogan"><a href="admin/index.jsp">家庭相册后台管理系统</a></span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover" id="cxx"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="article_add('发布公告','admin/article-add.jsp?author=${username }')"><i class="Hui-iconfont">&#xe616;</i> 公告</a></li>
						</ul>
				</li>
			</ul>
		</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>超级管理员</li>
					<li class="dropDown dropDown_hover">
						<a href="javascript:;" class="dropDown_A"> ${username }&nbsp;<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="member_show('${username }','admin/member-show.jsp','360','420')">个人信息</a></li>
							<li><a href="admin/exit.jsp">退出</a></li>
					    </ul>
				</li>
				<c:if test="${size==0 }"></c:if>
				<c:if test="${size!=0 }">
				<li id="Hui-msg"> <a href="javascript:;" onclick="show_news('最新消息','admin/news.jsp')" title="最新消息"><span class="badge badge-danger">
				${size }
				</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
				</c:if>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 公告管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="admin/article-list.jsp" data-title="公告管理" href="javascript:void(0)">公告管理</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 图片管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="admin/picture-list.jsp" data-title="图片管理" href="javascript:void(0)">图片管理</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="admin/reply-list.jsp" data-title="评论列表" href="javascript:;">评论列表</a></li>
				</ul>
		</dd>
	</dl>
	<dl id="menu-tongji">
		<dt><i class="Hui-iconfont">&#xe725; </i>分享管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
		<dd>
		<ul>
			<li><a data-href="admin/share-list.jsp" data-title="管理动态" href="javascript:void(0)">管理动态</a></li>
			<li><a data-href="admin/share-alllist.jsp" data-title="动态详情" href="javascript:void(0)">动态详情</a></li>
		</ul>
	</dd>
	</dl>
	
	
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="admin/admin-information.jsp?nana=${username }" data-title="个人信息" href="javascript:void(0)">个人信息</a></li>
					<li><a data-href="admin/admin-list.jsp" data-title="用户列表" href="javascript:void(0)">用户列表</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="admin/system-base.html" data-title="系统设置" href="javascript:void(0)">系统设置</a></li>
					<li><a data-href="admin/system-shielding.html" data-title="屏蔽词" href="javascript:void(0)">屏蔽词</a></li>
					<li><a data-href="admin/system-log.jsp" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
			</ul>
		</dd>
	</dl>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="admin/welcome.jsp">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
		<div style="display:none" class="loading"></div>
		<iframe scrolling="yes" frameborder="0" src="admin/welcome.jsp"></iframe>
	</div>
</div>
</section>
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
/*个人信息*/
function myselfinfo(){
	var tt='<div>111111111111</div>';
	layer.open({
		type: 1,
		area: ['600px','400px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content:tt
	});
}

function member_show(title,url,w,h){
	var url=url+"?user="+title;
	layer_show("用户信息",url,w,h);
}

function show_news(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
		end: function () {
            location.reload();
        }
	});
	layer.full(index);
}

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
	   window.location.href='index.jsp';
   },2000);
  </script>
<%
}
%>
</html>