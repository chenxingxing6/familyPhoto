<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="com.DBpool.*"%>
<%@page import="com.Bean.*"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%= basePath%>">
</head>
<style type="text/css">
	.commentList .item{list-style: none outside none;margin: 1.6rem 0 0}
	.commentList .item a i img{border-radius: 50%; width:70px; height:70px;}
	.commentList .avatar{border: 1px solid transparent;float: left}
	.comment-main{position:relative;margin-left:80px;border:1px solid #dedede;border-radius:2px}
	.comment-main:before,.comment-main:after{position:absolute;top:11px;left:-16px;right:100%;width:0;height:0;display:block;content:" ";border-color:transparent;border-style:solid solid outset;pointer-events:none}
	.comment-main:before{border-right-color:#dedede;border-width:8px}
	.comment-main:after{border-width:7px;border-right-color:#f8f8f8;margin-top:1px;margin-left:2px}
	.comment-header{padding:10px 15px;background:#f8f8f8;border-bottom:1px solid #eee}
	.comment-title{margin:0 0 8px 0;font-size:1.6rem;line-height:1.2}
	.comment-meta{font-size:13px;color:#999;line-height:1.2}
	.comment-meta a{color:#999}
	.comment-author{font-weight:700;color:#999}
	.comment-body{padding:15px;overflow:hidden}
	.comment-body>:last-child{margin-bottom:0}
	.commentList .comment-flip .avatar {float: right}
	.comment-flip .comment-main{margin-left: 0; margin-right: 64px}
	.comment-flip .comment-main:before {border-left-color: #dedede;border-right-color: transparent}
	.comment-flip .comment-main:before, .comment-flip .comment-main:after {left: 100%;position: absolute;right: -16px}
	.comment-flip .comment-main:after {border-left-color: #f8f8f8;border-right-color: transparent;margin-left: auto;margin-right: 2px}
</style>
<body>
<%
String id = request.getParameter("id");
String style = new String(request.getParameter("style").getBytes("iso-8859-1"), "utf-8");
ConnecttionPooladmin.updatetell(id,style);
String text = new String(request.getParameter("text").getBytes("iso-8859-1"), "utf-8");
String people = new String(request.getParameter("people").getBytes("iso-8859-1"), "utf-8");
String data = request.getParameter("data");
String hit = request.getParameter("hit");
userBean user=ConnecttionPooladmin.showoneuser(people);
request.setAttribute("user", user);
%>
<ul class="commentList">
	  <li class="item cl"> <a href="javascript:;" onclick="member_show('<%=people %>','admin/member-show.jsp','360','420')"><i class="avatar size-L radius"><img alt="<%=people %>" src="${user.img }"></i></a>
	    <div class="comment-main">
	      <header class="comment-header">
	        <div class="comment-meta"><a class="comment-author" href="#"><%=people %></a> 发布于
	          <time title="<%=data %>"><%=data %></time>  <i>浏览量:<%=hit %></i>
	        </div>
	      </header>
	      <div class="comment-body">
	        <p><%=text %></p>
	      </div>
	    </div>
	  </li>
	</ul>
</body>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->
<script type="text/javascript">
/*用户-查看*/
function member_show(title,url,w,h){
	var url=url+"?user="+title;
	layer_show("用户信息",url,w,h);
}
</script>
</html>