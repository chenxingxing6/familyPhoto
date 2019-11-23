<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title></title>
    <meta charset="UTF-8">
    <base href="<%= basePath%>">
    <link rel="stylesheet" href="user/CSS/amazeui.min.css">
    <link rel="stylesheet" href="user/CSS/petshow.css">
    <link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
</head>
<style>
body{
background:rgb(245,245,245);
}
</style>
<body>
<%
List<shareBean> share=ConnecttionPoolTest.showshare("1","2");
request.setAttribute("moreshares",share);

String name=((String)session.getAttribute("username"));
String a[]=ConnecttionPoolTest.dosetshow(name);
request.setAttribute("a",a);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	分享管理
	<span class="c-gray en">&gt;</span>
	动态列表
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div data-am-widget="tabs" class="am-tabs am-tabs-d2 am_news_tab">
  <div class="am-tabs-bd">
    <div data-tab-panel-0 class="am-tab-panel am-active">
    <div class="am-list-news-bd am_news_list_all">
    <ul class="am-list">
      <!--缩略图在标题左边-->
      <c:forEach items="${moreshares }" var="b">
      <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left am_list_li">
        <div class="am-u-sm-3 am-list-thumb am_list_thumb">
          <a href="javascript:;">
            <img src="${b.url }" class="am_news_list_img"/>
          </a>
        </div>
        <div class=" am-u-sm-9 am-list-main am_list_main">
          <h3 class="am-list-item-hd am_list_title">
            <a href="javascript:;" onClick="share_show('查看','admin/sharemore.jsp?id=${b.id }')">${b.title}</a>
          </h3>
          <div class="am_list_author"><a href="javascript:void(0)"><span class="am_list_author_ico" style="background-image: url(upload/default.png);"></span><span class="name">${b.user }</span></a><span class="am_news_time">&nbsp;•&nbsp;<time class="timeago">${b.data }</time></span></div>
          <div class="am-list-item-text am_list_item_text ">${b.text }</div>
        </div>
      </li>      
      </c:forEach>           
    </ul>
    <div class="am_news_load"><span><i  class="am-icon-spinner am-icon-spin"></i> 更多有趣的分享</span></div>
  </div>
 </div>
</div>
</div>
</body>
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script>
 $(function(){
  $('.am_news_tab').css('min-height',$(window).height() - 52 - 220);
  if ($(window).width() < 600 ) {
 $('.am_list_item_text').each(
  function(){
     if($(this).text().length >= 26){
        $(this).html($(this).text().substr(0,26)+'...');
     }});}

});
 
 function share_show(title,url,id,w,h){
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
</script>
</html>