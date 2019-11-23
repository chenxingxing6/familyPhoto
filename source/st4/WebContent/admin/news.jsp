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
<base href="<%= basePath%>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="admin/static/h-ui.admin/css/style.css" />
<title>用户留言</title>
</head>
<body>
<%
  List<newsBean> news=ConnecttionPooladmin.shownews();
  session.setAttribute("news",news);
  int size= news.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页  <span class="c-gray en">&gt;</span> 最新消息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> </span> <span class="r">共有数据：<strong class="count">${size }</strong> 条</span> </div>
<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="60">ID</th>
					<th width="60">用户</th>
					<th>留言内容</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${news }" var="a">
				<tr class="text-c">
					<td><input type="checkbox" value="${a.id }" name="subChk"></td>
					<td>${a.id }</td>
					<td><a href="javascript:;" onclick="member_show('${a.user }','admin/member-show.jsp?user=${a.user }')"><i class="avatar size-L radius"><img alt="" src="admin/static/h-ui/images/ucnter/avatar-default-S.gif"></i></a></td>
					<td class="text-l"><div class="c-999 f-12">
							 时间:<time title="${a.data }">${a.data }</time></div>
							<div class="f-12 c-999">
							${a.text }
							</div>
						<div>
						发布人:<i style="cursor:pointer" class="text-primary" onclick="member_show('${a.user}','admin/member-show.html','10001','360','400')">${a.user }</i>
						</div></td>
					<td class="td-manage"><a title="编辑" href="javascript:;" onclick="member_edit('编辑','admin/news-reply.jsp?author=${a.user }&id=${a.id }','4','','510')" style="text-decoration:none"><i class="Hui-iconfont">&#xe647;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'${a.id }')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe60b;</i></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="admin/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,4]}// 制定列不参与排序
		]
	});

});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,360,420);
}

/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('阅读此消息？',function(index){
		$.ajax({
			type: 'POST',
			url: 'adminaddtell?way=9&id='+id+'',
			dataType: 'text',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('操作成功!',{icon:1,time:1000});
				var count = $(".count").html();
				$(".count").html(count-1);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script>
</body>
</html>