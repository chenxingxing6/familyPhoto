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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%= basePath%>">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="user/CSS/amazeui.min.css">
    <link rel="stylesheet" href="user/CSS/petshow.css">
    <link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="user/CSS/smallstyle.css" />
    <link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
	</head>
	<style>
	body{
		background:rgb(245,245,245);
	}
	</style>
<body>
<%
String id = request.getParameter("id");
List<shareBean> share=ConnecttionPoolTest.showshare(id,"1");
request.setAttribute("moreshares",share);

String name=((String)session.getAttribute("username"));
String a[]=ConnecttionPoolTest.dosetshow(name);
request.setAttribute("a",a);
%>
<c:forEach items="${moreshares }" var="b">
<article data-am-widget="paragraph" class="am-paragraph am-paragraph-default article_nr"
data-am-paragraph="{ tableScrollable: true, pureview: true }">
<h1 class="article_nr_title">${b.title }</h1>
<div class="am_list_author"><a href="javascript:void(0)"><span class="am_list_author_ico" style="background-image: url(${a[4] });"></span><span class="name">${b.user }</span></a><span class="am_news_time">&nbsp;•&nbsp;<time class="timeago">${b.data }</time></span></div>
  <div class="article_nr_content">
   <p><img src="${b.url }"></p>
   <p>${b.text }</p>
</div>
<div class="article_nr_more">
<div class="article_nr_l">
  <a href="javascript:;" onclick=" add_like(${b.id },this)" id="xxx" class="zan"><i class="am-icon-btn am-icon-thumbs-o-up aa"></i></a>
  <span id="count">${b.like }</span>
</div>
<div class="article_nr_more_r">
<span>分享 </span>
<span class="article_nr_more_ico ">
  <a href="javascript:;" class="am-icon-btn am-secondary am-icon-qq"></a>
  <a href="javascript:;" class="am-icon-btn am-success am-icon-weixin"></a>
  <a href="javascript:;" class="am-icon-btn am-danger am-icon-weibo"></a>
</span>
    </div>
</div>
</article>
</c:forEach>
<%
String user=((String)session.getAttribute("username"));
List<replaymsBean> replay=ConnecttionPoolTest.showreplayms(id);
request.setAttribute("replays",replay);
int count = replay.size();
request.setAttribute("countt",count);
%>
<div class="am_tjgd">
  <div class="am-list-news-bd am_news_list_all">
    <ul class="am-list" id="cxx">
    <h4>评论列表 </h4> 共<i id="cxx1">${countt }</i>条
    <c:set var="name" value="<%=user %>"></c:set>
<c:forEach items="${replays }" var="c" varStatus="i">
<li style="padding:15px;">
<a href="javascript:;" style="font-size:10px;">第${i.index+1 }条</a>
<p style="font-size:10px;"><a href="javascript:;"><span class="name">${c.name }</span></a><span class="am_news_time">&nbsp;•&nbsp;<time class="timeago" >${c.data }</time></span>
	<c:if test="${c.name == name}">
	   <a style="font-size:10px;" onclick="delreply(${c.id },this);" href="javascript:;">删除</a>
	</c:if>
</p>
<div>${c.content }</div>
</li>
<br>
</c:forEach>
     <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left am_list_li">
         <form method="post" id="reply">
         <div class="row cl">
			<div class="formControls col-xs-12 col-sm-9">
			<input type="hidden" value="${username }" name="name" id="name">
			<input type="hidden" value="<%=id %>" name="idd" id="idd">
			<textarea id="editor" name="editor" class="textarea" placeholder="100个字符以内" onKeyUp="$.Huitextarealength(this,100)"></textarea>
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			<button class="btn btn-primary radius" type="submit" name="btn" value="1">
			<i class="Hui-iconfont">&#xe632;</i>&nbsp;评论&nbsp;</button>
	        </div>
        </div>
        </form>
     </li>
    </ul>
    <div class="am_news_load"><span><i  class="am-icon-spinner am-icon-spin"></i>更多有趣的分享</span></div>
  </div>
</div>
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

 
 function add_like(id,obj){
	    $(obj).toggleClass("zan1");
	    var classname=$(obj).attr("class");
	    var t=$("#count").text();
		if(classname == "zan zan1"){
			$(".aa").css('background','#0FA6D8');
			t++;
		    $("#count").html(t);
			$.ajax({
					type: 'POST',
					url: 'ajax?way=3&id='+id+'',
					dataType: 'text',
					success: function(data){
						layer.tips('点赞成功!', '#xxx', {
							  tips: [1, '#0FA6D8']
							});
					},
					error:function(data) {
						console.log(data.msg);
					},
			});	
		}else if(classname== "zan"){
			$(".aa").css('background','rgb(238,238,238)');
			t--;
		    $("#count").html(t);
		    $.ajax({
				type: 'POST',
				url: 'ajax?way=233&id='+id+'',
				dataType: 'text',
				success: function(data){
					layer.tips('取消点赞!', '#xxx', {
						  tips: [3, '#0FA6D8']
						});
				},
				error:function(data) {
					console.log(data.msg);
				},
		});	
		}		
}

function delreply(id,obj){
	var t=$("#cxx1").text();
	t--;
	$.ajax({
		type: 'POST',
		url: 'ajax?way=5&id='+id+'',
		dataType: 'text',
		success: function(data){
			if(data==1){
				$(obj).parent().parent().remove();
			    $("#cxx1").html(t);
				layer.msg("删除成功！",{icon:6,time:1000});
			}else{
				layer.msg("删除失败！",{icon:7,time:1000});
			}
		},
		error:function(data) {
			console.log(data.msg);
		},
});		
}

$("#reply").validate({
	rules:{
		name:{
			required:true,
		},
		id:{
			required:true,
			email:true
		},
		editor:{
			required:true,
		},
	},
	messages: {
		editor:{
			required:"请输入你的评论"
		}
	},
	onkeyup:false,
	focusCleanup:true,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			type: 'POST',
			url: 'ajax?way=4',
			dataType: 'text',
			success: function(data){
			if(data==1){
				layer.msg("评论成功！",{icon:6,time:2000});
				window.location.reload();
			}else if(data==0){
				layer.msg("评论失败！",{icon:7,time:1000});
			}

			},
			error:function(data) {
				layer.msg("发送失败！",{icon:7,time:1000});
			},
		});
	}
});
</script>
</body>
</html>