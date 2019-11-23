<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*,java.util.*"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<html>
<head>
  <title></title>
  <base href="<%=basePath %>">
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <link href="user/CSS/style.css" rel="stylesheet" type="text/css">
  <style>
  body{
    color:black;
    background:white;
  }
  table{
    position: relative;
  }
  

  table .nav{
    position: absolute;
    bottom:1px;
    right: 0px;
    height:40px;
    line-height:8px;
    width:100%;
    text-shadow:2px 2px 4px white; 
  }
  
  table .nav ul{
    height:100%;
    width:30%;
    float:right;
    display:block;
    height:20px;
    margin-right:10px;
  }

  table .nav ul li{
    float: right;
    list-style: none;
    padding: 0px 2px 0px 2px;
  }
  table .nav ul li a{
    color: black;
    display: inline-block;
    font-size: 18px;
    position: relative;
    padding:3px 5px 3px 30px;
    overflow: hidden;
    height:16px;
    line-height:16px;
    background:rgba(1,1,2,0.1);
    border-radius: 10px;
    font-family:'宋体';
  }

.footer img{
	position: absolute;
	width: 30px;
	height: 300px;
	left:2px;
	top:-39px;
	transition:all 0.3s;
	opacity: 0.95;
}
a:hover .footer{
	color: white;
	transition:all 0.01s;
    border-radius: 3px;

}

a:hover .footer img{
	display: block;
	top: -5px;
	opacity: 0.90;
	transition:all 0.3s;
}

.exit img{
	position: absolute;
	width: 30px;
	height: 300px;
	left:3px;
	top:-109px;
	transition:all 0.3s;
	opacity: 0.95;
}

a:hover .exit img{
  display: block;
  top: -73px;
  opacity: 0.90;
  transition:all 0.3s;
}

.index img{
    position: absolute;
	width: 30px;
	height: 300px;
	left:3px;
	top:-220px;
	transition:all 0.3s;
	opacity: 0.95;
} 

a:hover .index img{
	 display: block;
  	 top: -190px;
     opacity: 0.90;
     transition:all 0.3s;
}
table .logo{
    position: absolute;
    top:-12px;
    left: 15px;
    color:white;
    font-size:19px;
    font-family: "宋体";
  }
  
  .ttt{
  	position: absolute;
  	left:0;
  	font-size:40px;
  	opacity: 0;
  }
  .ttt:hover{
     font-size:40px;
  }
  </style>
  </head>
  <body>
<table width="1300"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
        <a href="javascript:top.location.reload();" class="ttt">家庭相册管理系统</a>
    	<img src="user/images/jj.jpg" width="100%" alt="家庭相册管理系统" height="99">
       <div class="nav">
       <ul>
        <li>
            <a href="javascript:exit()" target="mainFrame" onclick="exit()">
               <span class="footer exit">退出系统<img src="user/images/5.png"></span>
            </a>
         </li>
         <li>
         <a href="user/doset/me.jsp" target="mainFrame">
              <span class="footer">${sessionScope.username}<img src="user/images/5.png"></span>
         </a>
         </li>
         <li>
         <a href="userwelcome/index.html" target="mainFrame">
              <span class="footer index">主页<img src="user/images/5.png"></span>
         </a>
        </li>
       </ul> 
      </div>
    </td>
  </tr>
</table>
</body>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="admin/lib/laypage/1.2/laypage.js"></script>
<script>
function exit()
{  
	var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
	var url = result+"/user/doset/userexit.jsp";	
	top.location.href=url;
}
	
	
</script>
</html>