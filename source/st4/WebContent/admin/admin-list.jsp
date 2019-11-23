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
<title>用户列表</title>
</head>
<body>
<%
  List<userBean> user=ConnecttionPooladmin.showuser();
  session.setAttribute("users",user);
  int size= user.size();
  request.setAttribute("size",size);
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>用户管理<span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" id="" name="">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel(this)" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	<a href="javascript:;"  onclick="showlogin('添加用户','admin/admin-adduser.jsp')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong>${size }</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">用户列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">ID</th>
				<th width="60">登录名</th>
				<th width="90">手机</th>
				<th>邮箱</th>
				<th width="160">QQ</th>
				<th width="190">加入时间</th>
				<th width="100">是否已启用</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${users }" var="a">
			<tr class="text-c">
				<td><input type="checkbox" value="${a.id }" name="subChk"></td>
				<td>${a.id }</td>
				<td>
				<a href="javascript:;" onclick="member_show('${a.name }','admin/member-show.jsp','360','420')">${a.name }</a>
				</td>
				<td>${a.phone }</td>
				<td>${a.qq }</td>
				<td>${a.email }</td>
				<td>${a.birth }</td>
				<td class="td-status"><span class="label label-success radius">已启用</span></td>
				<td class="td-manage"><a style="text-decoration:none" onClick="admin_stop(this,'${a.id }')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
				 <a title="编辑" href="javascript:;" onclick="showlogin('修改信息','admin/admin-userupdata.jsp?nana=${a.name }')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
				 <a title="删除" href="javascript:;" onclick="admin_del(this,'${a.id }')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
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
<script type="text/javascript" src="laydate/laydate.dev.js"></script>
<script type="text/javascript">
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'ajax?way=7&id='+id+'',
			dataType: 'json',
			success: function(data){
				if(data==1){
					$(obj).parents("tr").remove();
					layer.msg('删除成功!',{icon:1,time:1000});	
				}else{
					layer.msg('删除失败!',{icon:1,time:1000});
				}
				
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}


/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
			type: 'POST',
			url: 'ajax?way=9&id='+id+'&statu=0',
			dataType: 'text',
			success: function(data){
			if(data==1){
				$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,'+id+')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});		
			}else{
				layer.msg('已停用!',{icon: 5,time:1000});	
			}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
			type: 'POST',
			url: 'ajax?way=9&id='+id+'&statu=1',
			dataType: 'text',
			success: function(data){
				if(data==1){
					$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+id+')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
					$(obj).remove();
					layer.msg('已启用!', {icon: 6,time:1000});	
				}else{
					layer.msg('启用失败!', {icon: 6,time:1000});
				}
				
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
			url: 'ajax?way=8',
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

function member_show(title,url,w,h){
	var url=url+"?user="+title;
	layer_show("用户信息",url,w,h);
}


function showlogin(title,url,w,h){
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

laydate({
    elem: '#datemin'
});

laydate({
    elem: '#datemax'
});
</script>
</body>
</html>