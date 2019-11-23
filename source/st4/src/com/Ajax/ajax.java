package com.Ajax;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBpool.ConnecttionPoolTest;
import com.DBpool.ConnecttionPooladmin;
import com.email.MailUtil;


@WebServlet("/ajax")
public class ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ajax() {
        super();
    }

    public String getIp(HttpServletRequest httpRequest){
    	String ipAddress = httpRequest.getHeader("x-forwarded-for"); 
    	if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) { 
    	ipAddress = httpRequest.getHeader("Proxy-Client-IP"); 
    	}
    	if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
    		ipAddress = httpRequest.getHeader("WL-Proxy-Client-IP"); 
    	}
    	if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) { 
    	    ipAddress = httpRequest.getRemoteAddr(); 
    	if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
            InetAddress inet=null;
        try {
        	inet = InetAddress.getLocalHost();
        } catch (UnknownHostException e){ e.printStackTrace();
        }
        ipAddress= inet.getHostAddress();}
    	}
    	if(ipAddress!=null && ipAddress.length()>15){ 
    	if(ipAddress.indexOf(",")>0){
    		ipAddress = ipAddress.substring(0,ipAddress.indexOf(",")); 
    	}}
    	return ipAddress;
    }
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("isLog",new String("0"));
		String way = request.getParameter("way");
		String realcode = (String) session.getAttribute("code");
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		String yzm = request.getParameter("yzm");
		String style = request.getParameter("stylee");
		String ip = getIp(request);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String time = df.format(new Date());
	    List<String> a = new ArrayList<String>();
		 try {
			 if(way.equals("login")){
				 if(yzm.equals(realcode)==false){
			    	 out.print(0);
			      }else{
			    	  if(ConnecttionPooladmin.checkUser(user,password,style)){
						  session.setAttribute("username",user);
					      session.setAttribute("isLog",new String("1"));
					    	  a.add(user);
					    	  a.add(ip);
					    	  a.add(time);
					    	  ConnecttionPooladmin.adduserloginmessage(a);
					    	  out.print(style);
					}else{out.print(2);}
			      }
			 }else if(way.equals("loginphone")){
				 if(ConnecttionPooladmin.checkUser(user,password,"user")){
					  session.setAttribute("username",user);
				      session.setAttribute("isLog",new String("1"));
				    	  a.add(user);
				    	  a.add(ip);
				    	  a.add(time);
				    	  ConnecttionPooladmin.adduserloginmessage(a);
				    	  out.print(1);
				}else{out.print(0);}
			 }
			 else if(way.equals("log")){
				 session.setAttribute("isLog",new String("1"));
				 String id = request.getParameter("id");
				 int b = Integer.parseInt(id);
				 ConnecttionPooladmin.dellog(b);
			 }else if(way.equals("logs")){
				 session.setAttribute("isLog",new String("1"));
				 String items = request.getParameter("delitems");
		        	String[] item = items.split(",");
		        	for (int i = 0; i < item.length; i++) { 
		        		int c = Integer.parseInt(item[i]);
		        		try {
							ConnecttionPooladmin.dellog(c);
						} catch (Exception e) {
							e.printStackTrace();
						}
		        	} 
			 }
			 else if(way.equals("forget")){
				session.setAttribute("isLog",new String("1"));
				String name= request.getParameter("user");
				String phone= request.getParameter("phone");
				session.setAttribute("fffuser", name);
				try {
					if(ConnecttionPooladmin.ajaxuser(name)){
						if(ConnecttionPooladmin.checkNamePhone(name,phone)){
							out.print(1);
						}else{
							out.print(2);
						}
					}else{
						out.print(3);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			 }
			 else if(way.equals("email")){
				 session.setAttribute("isLog",new String("1"));
					String email= request.getParameter("email");
					user = (String) session.getAttribute("fffuser");
					if(ConnecttionPooladmin.checkusermail(user,email)){
						String pwd=ConnecttionPooladmin.findpwd(user);
						String text=""+user+",你好！你的密码为"+pwd+",如果你未做此操作,可能是他人误填,请忽略此邮件！提示:此信是由系统发出,系统不接收回信,请勿直接回复!";
				        MailUtil.sendMail(email, "家庭相册管理系统-找回密码",text);
				        session.removeAttribute("fffuser");
				        session.invalidate(); 
					}else{
						out.print(1);
					}
			 }
			 else if(way.equals("1")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("id");
				 ConnecttionPoolTest.deleteshare(id);
			 }
			 else if(way.equals("3")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("id");
				 ConnecttionPoolTest.addlike(id);
			 }
			 else if(way.equals("233")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("id");
				 ConnecttionPoolTest.sublike(id);
			 }
			 else if(way.equals("4")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("idd");
				 String name=request.getParameter("name");
				 String text=request.getParameter("editor");
		    	 a.add(name);
		    	 a.add(text);
		    	 a.add(time);
		    	 a.add(id);
				 if(ConnecttionPoolTest.wreply(a)){
					 out.print(1);
				 }else{
					 out.print(0);
				 }
			 }
			 else if(way.equals("5")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("id");
				 if(ConnecttionPoolTest.delreplay(id)){
					 out.print(1);
				 }else{
					 out.print(0);
				 }
			 }
			 else if(way.equals("6")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("id");
				 if(ConnecttionPoolTest.delback(id)){
					 out.print(1);
				 }else{
					 out.print(0);
				 }
			 }
			 else if(way.equals("7")){
				 session.setAttribute("isLog",new String("1"));
				 String id=request.getParameter("id");
				 int b = Integer.parseInt(id);
				 if(ConnecttionPooladmin.deluser(b)){
					 out.print(1);
				 }else{
					 out.print(0);
				 }
			 }
			 else if(way.equals("8")){
				 session.setAttribute("isLog",new String("1"));
				 String items = request.getParameter("delitems");
		        	String[] item = items.split(",");
		        	for (int i = 0; i < item.length; i++) { 
		        		int c = Integer.parseInt(item[i]);
		        		try {
							ConnecttionPooladmin.deluser(c);
						} catch (Exception e) {
							e.printStackTrace();
						}
		        	} 
			 }
			 else if(way.equals("9")){
				 session.setAttribute("isLog",new String("1"));
				 String id = request.getParameter("id");
				 String statu = request.getParameter("statu");
				 a.add(id);
				 a.add(statu);
				 if(ConnecttionPooladmin.updateUserstatu(a)){
					 out.print(1);
				 }else{
					 out.print(0);
				 }
			 }
			 else if(way.equals("register")){  
				 session.setAttribute("isLog",new String("1"));
				 if(ConnecttionPooladmin.ajaxuser(user)){
					 out.print(0);
				 }else{
					 String telephone=request.getParameter("phone");
					 String qq=request.getParameter("qq");
					 String email=request.getParameter("email");
					 String sty=request.getParameter("sty");
					 if(sty.equals("user")){
						 a.add(user);
						 a.add(password);
						 a.add(telephone);
						 a.add(email);
						 a.add(qq);
						 a.add(time);
						 a.add(sty);
						 if(ConnecttionPooladmin.addadminuser(a)){
							 out.print(1);
						 }else{
							 System.out.println(1);
							 out.print(2);
						 } 
					 }else if(sty.equals("admin")){
						 session.setAttribute("isLog",new String("1"));
						 String code=request.getParameter("yaoqma");
						 if(code.equals("123456")){
							 a.add(user);
							 a.add(password);
							 a.add(telephone);
							 a.add(email);
							 a.add(qq);
							 a.add(time);
							 a.add(sty);
							 if(ConnecttionPooladmin.addadminuser(a)){
								 out.print(1);
							 }else{
								 System.out.println(1);
								 out.print(2);
							 } 
						 }else{
							 out.print(3);
						 }
					 } 
				 }
			 }
			} catch (Exception e) {e.printStackTrace();}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
