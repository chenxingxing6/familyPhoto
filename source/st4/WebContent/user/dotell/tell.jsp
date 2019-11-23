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
    <base href="<%= basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="user/CSS/smallstyle.css" />
	<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
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
            /* Enable use of floated navbar text */
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
  List<tellBean> tell=ConnecttionPoolTest.showtell();
  session.setAttribute("tells",tell);
  int size= tell.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	系统公告
	<span class="c-gray en">&gt;</span>
	系统公告
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<table class="definewidth">
<tr height="40">
	<td colspan="4"></td>
</tr>
<c:if test="${size==0}">
<tr>
    <td colspan="3">暂无公告！！！</td>
</tr>
</c:if>
<c:forEach items="${tells }" var="a" varStatus="i">
<tr>
	<td width="5%">${i.index+1 }</td>
	<td class="text" align="left"><i><img alt="" src="upload/news.png"/>${a.text }</i></td>
	<td width="20%">${a.data }</td>
	<td width="10%"><a href="javascript:void()" class="btnn">查看详情</a></td>
</tr>
<tr>
	<td colspan="4" align="left">
	  <div style="display:none; border:none; font-size:16px; padding:10px;" class="show">
	  <p style="color:blue; font-size:14px;">发布者:${a.people }&nbsp;发布时间:${a.data }</p>
	  <p>${a.text }</p>
	  </div>
	</td>
</tr>
</c:forEach>
</table>
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
$(function(){
$i=-1;
$(".btnn").click(function(){
	$i++;
	if($i%2==0){
		$(this).html("收起详情");
		$(this).parent().parent().next().children().children().slideDown(500);
	}else{
		$(this).html("查看详情");
		$(this).parent().parent().next().children().children().slideUp(500);
	}
}); 
});
</script>
</body>
</html>