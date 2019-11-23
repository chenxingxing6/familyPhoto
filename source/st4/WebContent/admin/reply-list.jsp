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
<title>评论列表</title>
</head>
<body>
<%
  List<replaymsBean> reply=ConnecttionPooladmin.showreplayms();
  session.setAttribute("replys",reply);
  int size= reply.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span class="c-gray en">&gt;</span> 评论列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
	 日期范围：
		<input type="text" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 评论关键字" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜评论</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong class="count">${size }</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="60">ID</th>
					<th>内容</th>
					<th width="110">标题</th>
					<th width="80">发布人</th>
					<th width="180">更新时间</th>
					<th width="70">浏览次数</th>
					<th width="110">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${replys }" var="a">
				<tr class="text-c">
					<td><input type="checkbox" value="${a.id }" name="subChk"></td>
					<td>${a.id }</td>
					<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','admin/article-toshow.jsp?id=${a.id }&text=${a.content }&people=${a.name }&hit=${a.hit }&style=replays&data=${a.data }')" title="查看">${a.content }</u></td>
					<td>${a.title }</td>
					<td>${a.name }</td>
					<td>${a.data }</td>
					<td>${a.hit }</td>
					<td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${a.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="laydate/laydate.dev.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,7]}// 不参与排序的列
	]
});

/*资讯-查看详情*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'adminaddtell?way=7&id='+id+'',
			dataType: 'text',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				var count = $(".count").html();
				$(".count").html(count-1);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

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
			url: 'adminaddtell?way=6',
			dataType: 'text',
			data: {'delitems':checkedList.toString()}, 
			success: function(data){
				layer.msg('删除成功!',{icon: 6,time:1500});
				$("[name ='subChk']:checkbox").attr("checked", false); 
				setTimeout("window.location.reload()",1000);
			},
			error:function(data) {
			},
		});		
	});
}

laydate({
    elem: '#datemin'
});

laydate({
    elem: '#datemax'
});
</script> 
</body>
</html>