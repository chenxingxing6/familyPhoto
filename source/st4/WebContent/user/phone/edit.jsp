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
<style>
.text-l a{
	text-align:center;
	color:red;
	margin:0 auto;
}
.picture-thumb{
   width:100px;
   height:100px;
}
</style>
</head>
<body>
<%
  String name=((String)session.getAttribute("username"));
  List<pictureBean> a=ConnecttionPooladmin.dopicshow(name);
  session.setAttribute("person",a);
  int size= a.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图片管理 <span class="c-gray en">&gt;</span> 图片列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
    <a href="javascript:;" onclick="datadel(this)" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
    <a href="user/phone/newpics.jsp" class="btn btn-success radius"><i class="Hui-iconfont">&#xe646;</i> 新建相册</a>
    </span></div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">ID</th>
					<th>相册封面</th>
					<th width="120">相册名称</th>
					<th width="150">创建时间</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${person}" var="a">　　
				<tr class="text-c">
					<td><input name="subChk" type="checkbox" value="${a.id }"></td>
					<td>${a.id }</td>
					<td><a href="javascript:;" onClick="picture_edit('相册名称:《${a.name }》','user/phone/picshow.jsp?name=${a.name }&user=${a.people }','${a.id }')"><img width="210" class="picture-thumb" src="${a.url }"></a></td>
					<td><a class="maincolor" href="javascript:;" onClick="picture_edit('相册名称:《${a.name }》','user/dopic/picshow.jsp?name=${a.name }&user=${a.people }','${a.id }')">${a.name }</a></td>
					<td>${a.time }</td>
					<td class="td-manage"><a style="text-decoration:none" onClick="picture_edit('编辑:《${a.name }》','user/phone/todoedit.jsp?name=${a.name }&user=${a.people }&id=${a.id }','${a.id }')" href="javascript:;" title="编辑相册"><i class="Hui-iconfont">&#xe60c;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${a.id}')" href="javascript:;" title="删除相册"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
<script type="text/javascript" src="admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"bVisible": true, "aTargets": [ 3 ]},//控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
	],
	"searching":false,
	"bProcessing": true
});

/*图片-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}



/*图片-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'adminpic?way=del&id='+id+'',
			dataType: 'text',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				window.location.reload();
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
			url: 'adminpic?way=delmore',
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
</script>
</body>
</html>