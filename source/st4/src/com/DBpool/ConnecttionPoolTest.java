package com.DBpool;
import java.sql.Connection;   
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;
import java.util.*;

import com.Bean.*; 
public class ConnecttionPoolTest {  
private static String[] datas={};
private static List<pictureBean> newsList;
private static List<allpictoshowBean> newsList1;
private static List<tellBean> newsList2;   
private static List<messageBean> newsList3; 
private static List<replaymsBean> newsList4; 
private static List<fadebackBean> newsList5; 
private static List<shareBean> newsList6; 
public static ConnectionPool getConnectionPool(){
	try { //创建数据库连接库对象  
	ConnectionPool connPool = new ConnectionPool("com.mysql.jdbc.Driver"  
		,"jdbc:mysql://localhost:3306/jsppic?useUnicode=true&characterEncoding=utf-8&useSSL=false","root","123456");  
		return connPool;// 返回连接
	}catch (Exception e) {
		return null;
	}                  
}
/*----------------------图片管理------------------------*/
//查看相册封面
public static  List<pictureBean> dopicshow(String name) throws Exception{
	   newsList = new ArrayList<pictureBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		//PreparedStatement ps=(PreparedStatement) conn.prepareStatement("SELECT  count(*)  as  counts  from  picture"); 
		//ResultSet rs=ps.executeQuery();
		//rs.next();
		//int Count=rs. getInt("counts"); 
		String sql="Select* from picture where people='"+name+"'"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		//String[][] data=new  String[Count][3];
		while (rs.next())  
		{  
			pictureBean picture=new pictureBean();
			picture.setId(rs.getString(1));
			picture.setName(rs.getString(2));
			picture.setTime(rs.getString(3));
			picture.setUrl(rs.getString(4));
			newsList.add(picture);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList;
	}catch (SQLException e) {return null;}    
}



//查看相册封面
public static  pictureBean dopicshowone(String id) throws Exception{
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from picture where id='"+id+"'"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		pictureBean picture=new pictureBean();
		while (rs.next())  
		{  
			picture.setId(rs.getString(1));
			picture.setName(rs.getString(2));
			picture.setTime(rs.getString(3));
			picture.setUrl(rs.getString(4));
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return picture;
	}catch (SQLException e) {return null;}    
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

/*--------------------------修改图片title--------------------------------*/
public static boolean updatapicstyle(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	String sql="update toshowpic set style='"+datas.get(1)+"' where style='"+datas.get(0)+"'";
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

/*删除相册*/
public static boolean deletexc(String s) throws Exception{
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

/*-------------------------------------------------------------------*/
//查看每个相册图片
public static  List<allpictoshowBean> toshowpic(String user,String name) throws Exception{
	newsList1 = new ArrayList<allpictoshowBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from toshowpic where people='"+user+"'" ;
	    sql+="and style='"+name+"'";
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
    }catch (SQLException e) {return false;}
    return false;  
}

/*-------------------对数据库查询数据进行封装---------------------*/
/*----userLogin----*/
public static boolean checkUser(String username,String password) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="Select* from user where name='"+username+"'and password='"+password+"'";
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
    }catch (SQLException e) {return false;}
    return true;  
}
/*-----------------------------------*/

/*----------------------系统公告------------------------*/
public static  List<tellBean> showtell() throws Exception{
	newsList2 = new ArrayList<tellBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from sttell where state='1' order by data desc"; 
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			tellBean tells=new tellBean();
			tells.setId(rs.getString(1));
			tells.setText(rs.getString(2));
			tells.setPeople(rs.getString(3));
			tells.setData(rs.getString(4));
			newsList2.add(tells);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList2;
	}catch (SQLException e) {return null;}    
}

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

/*----------------------查看留言------------------------*/
public static  List<messageBean> showmessage(String user,String i) throws Exception{
	newsList3 = new ArrayList<messageBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql;
		if(i.equals("1")){
			sql="Select* from message where status='1' order by data desc";
		}
		else if(i.equals("2")){
			sql="Select* from message where id='"+user+"'";
		}
		else{
			sql="Select* from message where name='"+user+"' order by data desc"; 
		}
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



/*---------------------分享图片-------------------------*/
public static boolean wshare(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into share(user,title,text,data,url) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"','"+datas.get(3)+"','"+datas.get(4)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*----查看分享--*/
public static  List<shareBean> showshare(String user,String way) throws Exception{
	newsList6 = new ArrayList<shareBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
		String sql;
		if(way.equals("0")){
			sql="Select* from share where user='"+user+"' order by data desc"; 
		}else if(way.equals("2")){
			sql="Select* from share order by data desc";
		}else{
			sql="Select* from share where id='"+user+"' order by data desc"; 
		}
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			shareBean share=new shareBean();
			share.setId(rs.getString(1));
			share.setUser(rs.getString(2));
			share.setTitle(rs.getString(3));
			share.setText(rs.getString(4));
			share.setData(rs.getString(5));
			share.setUrl(rs.getString(6));
			share.setLike(rs.getString(7));
			newsList6.add(share);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList6;
	}catch (SQLException e) {return null;}    
}


/*---删除分享---*/
public static boolean deleteshare(String id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="delete from share where id='"+id+"'";
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

/*---点赞---*/
public static void addlike(String id)  throws Exception{
try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库    
		String sql="update share set likess=likess+1 where id='"+id+"'"; 
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		connPool.closeConnectionPool();//关闭数据库连接池 	
		}catch (SQLException e) {}
}

public static void sublike(String id)  throws Exception{
try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库    
		String sql="update share set likess=likess-1 where id='"+id+"'"; 
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		connPool.closeConnectionPool();//关闭数据库连接池 	
		}catch (SQLException e) {}
}
/*反馈信息*/
public static boolean wfadeback(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into  news(user,text,data) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}


public static  List<fadebackBean> showback(String user) throws Exception{
	newsList5 = new ArrayList<fadebackBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库  
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from news where user='"+user+"' order by data desc";
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())  
		{  
			fadebackBean back=new fadebackBean();
			back.setId(rs.getString(1));
			back.setUser(rs.getString(2));
			back.setText(rs.getString(3));
			back.setData(rs.getString(4));
			back.setReply(rs.getString(6));
			newsList5.add(back);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList5;
	}catch (SQLException e) {return null;}    
}

/*---删除反馈信息---*/
public static boolean delback(String id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="delete from news where id='"+id+"'";
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

/*----------------------查看评论--------------------------*/
public static  List<replaymsBean> showreplayms(String title) throws Exception{
	newsList4 = new ArrayList<replaymsBean>();
	try{
		ConnectionPool connPool=getConnectionPool();
		connPool.createPool();//新建数据库连接库
		Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接   
		String sql="Select* from replayms where title='"+title+"'"; 
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
			newsList4.add(replayms);
		}  
		  rs.close();  
		  stmt.close(); 
		  connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
		  connPool.closeConnectionPool();//关闭数据库连接池  
		  return newsList4;
	}catch (SQLException e) {return null;}    
}


/*--------------------------增加评论----------------------*/
public static boolean wreply(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库 
	String sql="insert into replayms(name,content,data,title) values('"+datas.get(0)+"','"+datas.get(1)+"','"+datas.get(2)+"','"+datas.get(3)+"')";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*---删除评论---*/
public static boolean delreplay(String id) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="delete from replayms where id='"+id+"'";
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
		  String url=rs.getString(9);
		  String ee=rs.getString(2);
		  String pwd=rs.getString(3);
		  String [] datas={qq,email,phone,birth,url,ee,pwd};
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
	String sql="update user set phone='"+datas.get(1)+"',email='"+datas.get(2)+"',qq='"+datas.get(3)+"' where name='"+datas.get(0)+"'";
	Connection conn = connPool.getConnection(); //从连接库中获取一个可用的连接  
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	connPool.returnConnection(conn);//连接使用完后释放连接到连接池    
	connPool.closeConnectionPool();//关闭数据库连接池 	
    }catch (SQLException e) {return false;}
    return true;  
}

/*---修改用户头像---*/
public static boolean updateUserimg(List<String> datas) throws Exception{
try{
	ConnectionPool connPool=getConnectionPool();
	connPool.createPool();//新建数据库连接库    
	String sql="update user set img='"+datas.get(1)+"' where name='"+datas.get(0)+"'";
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
	String sql="update user set password='"+datas.get(1)+"' where name='"+datas.get(0)+"'";
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
}
}  