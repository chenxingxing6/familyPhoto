package com.DBpool;
import java.sql.Connection;   
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;
import java.util.*;

import com.Bean.*; 
public class ConnecttionPooladmin {  
private static String[] datas={};
private static List<pictureBean> newsList;
private static List<allpictoshowBean> newsList1;
private static List<tellBean> newsList2;
private static List<userBean> newsListuser;
private static List<messageBean> newsList3; 
private static List<replaymsBean> newsList4;
private static List<logBean> newsList5;
private static List<newsBean> newsList6;
public static ConnectionPool getConnectionPool(){
	try { //创建数据库连接库对象  
	ConnectionPool connPool = new ConnectionPool("com.mysql.jdbc.Driver"  
		,"jdbc:mysql://localhost:3306/jsppic?useUnicode=true&characterEncoding=utf-8&useSSL=false","root","123456");  
		return connPool;// 返回连接
	}catch (Exception e) {
		return null;
	}                  
}


/*----------------------系统公告------------------------*/
public static  List<tellBean> showtell() throws Exception{
	newsList2 = new ArrayList<tellBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from sttell order by data desc"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			tellBean tells=new tellBean();
			tells.setId(rs.getString(1));
			tells.setText(rs.getString(2));
			tells.setPeople(rs.getString(3));
			tells.setData(rs.getString(4));
			tells.setHit(rs.getString(5));
			tells.setState(rs.getString(6));
			newsList2.add(tells);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList2;
	}catch (SQLException e) {return null;}    
}


/*----------------------系统日志------------------------*/
public static  List<logBean> showlog() throws Exception{
	newsList5 = new ArrayList<logBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from userxtmessage order by time desc"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			logBean logs=new logBean();
			logs.setId(rs.getString(1));
			logs.setName(rs.getString(2));
			logs.setIp(rs.getString(3));
			logs.setTime(rs.getString(4));
			logs.setStyle(rs.getString(5));
			newsList5.add(logs);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList5;
	}catch (SQLException e) {return null;}    
}


/*----------------------单个用户系统日志------------------------*/
public static  List<logBean> showlogone(String name) throws Exception{
	newsList5 = new ArrayList<logBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from userxtmessage where name= '"+name+"' order by time desc"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			logBean logs=new logBean();
			logs.setId(rs.getString(1));
			logs.setName(rs.getString(2));
			logs.setIp(rs.getString(3));
			logs.setTime(rs.getString(4));
			logs.setStyle(rs.getString(5));
			newsList5.add(logs);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList5;
	}catch (SQLException e) {return null;}    
}

/*--删除公告--*/
public static boolean dellog(int id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="delete from userxtmessage where id ='"+id+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*--查看具体发布公告用户信息---*/
public static  userBean showoneuser(String name) throws Exception{
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from user where name='"+name+"'";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		userBean user=new userBean();
		while (rs.next())  
		{  
			user.setId(rs.getString(1));
			user.setName(rs.getString(2));
			user.setPhone(rs.getString(4));
			user.setEmail(rs.getString(5));
			user.setQq(rs.getString(6));
			user.setBirth(rs.getString(7));
			user.setStyle(rs.getString(8));
			user.setImg(rs.getString(9));
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return user;
	}catch (SQLException e) {return null;}    
}

/*--添加公告--*/
public static boolean wtell(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into sttell(text,people,data) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*--删除公告--*/
public static boolean deltell(int id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="delete from sttell where id ='"+id+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*---修改公告---*/
public static boolean updatetell(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update sttell set text='"+datas.get(1)+"',data='"+datas.get(2)+"'where id='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*-浏览量加1-*/
public static boolean updatetell(String id,String style) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql;
	if(style.equals("tell")){
		sql="update sttell set hit=hit+1 where id='"+id+"'";
	}else{
		sql="update replayms set hit=hit+1 where id='"+id+"'";
	}
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*--下架公告----*/
public static boolean dotell(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update sttell set state='"+datas.get(1)+"'where id='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*展现所有用户*/
public static  List<userBean> showuser() throws Exception{
	newsListuser = new ArrayList<userBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from user"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			userBean user=new userBean();
			user.setId(rs.getString(1));
			user.setName(rs.getString(2));
			user.setPhone(rs.getString(4));
			user.setEmail(rs.getString(5));
			user.setQq(rs.getString(6));
			user.setBirth(rs.getString(7));
			newsListuser.add(user);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsListuser;
	}catch (SQLException e) {return null;}    
}


/*删除用户*/
public static boolean deluser(int s) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql  ="delete from user  where  id='"+s+"'";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*---修改用户可用---*/
public static boolean updateUserstatu(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update user set statu='"+datas.get(1)+"' where id='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*----------------------图片管理------------------------*/
//查看相册封面
public static  List<pictureBean> dopicshow( ) throws Exception{
	   newsList = new ArrayList<pictureBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from picture"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			pictureBean picture=new pictureBean();
			picture.setId(rs.getString(1));
			picture.setName(rs.getString(2));
			picture.setTime(rs.getString(3));
			picture.setUrl(rs.getString(4));
			picture.setPeople(rs.getString(5));
			newsList.add(picture);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList;
	}catch (SQLException e) {return null;}    
}

public static  List<pictureBean> dopicshow(String name) throws Exception{
	   newsList = new ArrayList<pictureBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from picture where people='"+name+"'"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			pictureBean picture=new pictureBean();
			picture.setId(rs.getString(1));
			picture.setName(rs.getString(2));
			picture.setTime(rs.getString(3));
			picture.setUrl(rs.getString(4));
			picture.setPeople(rs.getString(5));
			newsList.add(picture);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList;
	}catch (SQLException e) {return null;}    
}


/*----------------------查看评论--------------------------*/
public static  List<replaymsBean> showreplayms() throws Exception{
	newsList4 = new ArrayList<replaymsBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from replayms"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			replaymsBean replayms=new replaymsBean();
			replayms.setId(rs.getString(1));
			replayms.setName(rs.getString(2));
			replayms.setContent(rs.getString(3));
			replayms.setData(rs.getString(4));
			replayms.setTitle(rs.getString(5));
			replayms.setHit(rs.getString(6));
			newsList4.add(replayms);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList4;
	}catch (SQLException e) {return null;}    
}


/*--删除评论--*/
public static boolean delreplays(int id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="delete from replayms where id ='"+id+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*----------------------查看留言------------------------*/
public static  List<messageBean> showmessage() throws Exception{
	newsList3 = new ArrayList<messageBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql;
		sql="Select* from message order by data desc LIMIT 5";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			messageBean message=new messageBean();
			message.setId(rs.getString(1));
			message.setName(rs.getString(2));
			message.setSex(rs.getString(3));
			message.setEmail(rs.getString(4));
			message.setTitle(rs.getString(5));
			message.setContent(rs.getString(6));
			message.setData(rs.getString(7));
			message.setStatus(rs.getString(8));
			message.setHit(rs.getString(9));
			newsList3.add(message);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList3;
	}catch (SQLException e) {return null;}    
}



/*----------------------用户最新消息------------------------*/
public static  List<newsBean> shownews() throws Exception{
	newsList6 = new ArrayList<newsBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql;
		sql="Select* from news where state='1' order by data desc";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			newsBean news=new newsBean();
			news.setId(rs.getString(1));
			news.setUser(rs.getString(2));
			news.setText(rs.getString(3));
			news.setData(rs.getString(4));
			news.setState(rs.getString(5));
			newsList6.add(news);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList6;
	}catch (SQLException e) {return null;}    
}

/*--回复用户最新消息--*/
public static boolean replynews(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update news set reply='"+datas.get(1)+"'where id='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*--阅读用户最新消息--*/
public static boolean readnews(String id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update news set state='0' where id='"+id+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*----adminerLogin----*/
public static boolean checkUser(String username,String password,String style) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="Select* from user where name='"+username+"'and password='"+password+"'and style='"+style+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();  
	ResultSet rs = stmt.executeQuery(sql);  
	while (rs.next()  && rs.getRow()>0)  
	{  
	  return true;
	}  
	rs.close();  stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return false;  
}


/*---用户登录日志---*/
public static  userloginBean userloginBean(String name) throws Exception{
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql;
		sql="Select* from userxtmessage where name='"+name+"' order by time desc LIMIT 1,1";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		userloginBean userlogin=new userloginBean();
		while (rs.next())  
		{  
			userlogin.setId(rs.getString(1));
			userlogin.setName(rs.getString(2));
			userlogin.setIp(rs.getString(3));
			userlogin.setTime(rs.getString(4));
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return userlogin;
	}catch (SQLException e) {return null;}    
}

/*--插入用户登录信息--*/
public static boolean adduserloginmessage(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into  userxtmessage(name,ip,time,style) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"','admin')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*-登陆次数统计-*/
public static String countuserlogin(String name) throws Exception{
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql;
		sql="select count(*) as count FROM userxtmessage WHERE name='"+name+"' GROUP BY 'name'";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  {
			String count =rs.getString(1);
			return count;
		}
		rs.close();  
		stmt.close(); 
		connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		connPool.closeConnectionPool();//关闭数据库连接池  
		return null;
	}catch (SQLException e) {return null;}
}


//查看每个相册图片
public static  List<allpictoshowBean> toshowpic(String user,String name) throws Exception{
	newsList1 = new ArrayList<allpictoshowBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from toshowpic where people='"+user+"'";
		if(!name.equals("all")){
			sql+="and style='"+name+"'";
		}
		sql+="order by data desc";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			allpictoshowBean pics=new allpictoshowBean();
			pics.setId(rs.getString(1));
			pics.setPeople(rs.getString(2));
			pics.setUrl(rs.getString(3));
			pics.setStyle(rs.getString(4));
			newsList1.add(pics);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList1;
	}catch (SQLException e) {return null;}    
}


/*删除图片*/
public static boolean deletepic(int s) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql  ="delete from toshowpic  where  id='"+s+"'";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*删除相册*/
public static boolean deletexc(int s) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql  ="delete from picture  where  id='"+s+"'";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*----------------Ajax-----------------*/
public static boolean ajaxuser(String username) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql="Select* from user where name='"+username+"'";
	Statement stmt = conn.createStatement();  
	ResultSet rs = stmt.executeQuery(sql);  
	while (rs.next()  && rs.getRow()>0)  
	{ 
	  return true;
	}  
	rs.close();  stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return true;}
    return false;  
}

/*----register-----*/
public static boolean addadminuser(List<String> a) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String img="upload/default.png";
	String sql="insert into  user(name,password,phone,email,qq,birth,style,img) values('"+a.get(0)+"','"+a.get(1)+"','"+a.get(2)+"','"+a.get(3)+"','"+a.get(4)+"','"+a.get(5)+"','"+a.get(6)+"','"+img+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();  
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*----register-----*/
public static boolean adduser(String []a) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="insert into  user(name,password,phone,qq) values('"+a[0]+"','"+a[1]+"','"+a[2]+"','"+a[3]+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();  
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 
	return true;
    }catch (SQLException e) {return false;}
}

































/*--------------------------修改相册封面--------------------------------*/
public static boolean updatapic(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql="update picture set name='"+datas.get(1)+"',time='"+datas.get(2)+"',url='"+datas.get(3)+"' where id='"+datas.get(0)+"'";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*新建相册*/
public static boolean newxcphoto(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql="insert into picture(name,time,url,people) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"','"+datas.get(3)+"')";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();  
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}



/*-------------------------------------------------------------------*/



/*----------------上传相册图片----------------*/
public static boolean addpic(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="insert into  toshowpic(people,url,style) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();  
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*-------------------对数据库查询数据进行封装---------------------*/



/*-----------------------------------*/



/*---------------------我要留言-------------------------*/
public static boolean wmessage(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into  message(name,sex,email,title,content,data) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"','"+datas.get(3)+"','"+datas.get(4)+"','"+datas.get(5)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*删除留言*/
public static boolean deletemessage(String id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="delete from message where id='"+id+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();  
	int rs = stmt.executeUpdate(sql);
	while(rs>0){
		return true;
	}
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return false;  
}


/*留言点击量*/
public static void addcount(String id)  throws Exception{
try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库    
		String sql="update message set hit=hit+1 where id='"+id+"'"; 
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		connPool.closeConnectionPool();//关闭数据库连接池 	
		}catch (SQLException e) {}
}



/*--------------------------增加评论----------------------*/
public static boolean wreply(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into  replayms(name,content,data,title) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"','"+datas.get(3)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}




/*----------------------系统设置------------------------*/
/*--个人信息--*/
public static String[] dosetshow(String name) throws Exception{
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库   
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
		String sql="Select* from user where name='"+name+"'";       
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next() && rs!=null)  
		{  
		  String qq=rs.getString(4);
		  String email=rs.getString(5);
		  String phone=rs.getString(6);
		  String birth=rs.getString(7);
		  String [] datas={qq,email,phone,birth};
		  return datas;
		}  
		  rs.close();  
		  stmt.close();  
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池 
	}catch (SQLException e) {return null;}
	return datas;    
}

/*---修改用户信息---*/
public static boolean updateUser(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update user set phone='"+datas.get(1)+"',email='"+datas.get(2)+"',qq='"+datas.get(3)+"',birth='"+datas.get(4)+"' where name='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*---修改密码--*/
public static boolean updatePwd(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update user set password='"+datas.get(2)+"' where name='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


/*------忘记密码--------------*/
public static boolean checkNamePhone(String name,String phone) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="Select* from user where name='"+name+"'and  phone='"+phone+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while (rs.next()  && rs.getRow()>0)  
	{  
	  return true;
	}  
	rs.close();
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return false;  
}

public static boolean checkusermail(String name,String email) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="Select* from user where name='"+name+"'and  email='"+email+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while (rs.next()  && rs.getRow()>0)  
	{  
	  return true;
	}  
	rs.close();
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return false;  
}

/*------------------------找回密码----------------------------*/
public static String findpwd(String name) throws Exception{
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库   
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
		String sql="Select password from user where name='"+name+"'";       
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next() && rs!=null)  
		{  
		  String pwd=rs.getString(1);
		  return pwd;
		}  
		  rs.close();  
		  stmt.close();  
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池 
	}catch (SQLException e) {return null;}
	return null;    
}

public static void main(String[] args) throws Exception {  
	ConnecttionPooladmin.countuserlogin("root");
}
}  