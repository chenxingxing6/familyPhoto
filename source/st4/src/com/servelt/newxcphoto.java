package com.servelt;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
@WebServlet("/newxcphoto")
public class newxcphoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);//默认post
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
	    SmartUpload smartupload = new SmartUpload();
		smartupload.initialize(this.getServletConfig(),request,response);
		try {
			smartupload.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String url = "upload/"+smartupload.getFiles().getFile(0).getFileName(); 
		String cxx = "/upload";
		try {
			smartupload.save(cxx);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		String way= request.getParameter("way");
		if(way.equals("0")){
			String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
			Date date = new Date(); 
	        SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String time = t.format(date);
	        List<String> a = new ArrayList<String>();
	        a.add(name);
	        a.add(time);
	        a.add(url);
	        a.add(username);
	        try {
				if(ConnecttionPoolTest.newxcphoto(a)){
					out.print("<script>window.location.href='user/dopic/edit.jsp';</script>");
				}else{
					out.println("<script>alert('新建相册失败!');window.location.herf='user/dopic/newxcphoto.jsp'</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(way.equals("1")){
			String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
			List<String> a = new ArrayList<String>();
	        a.add(name);
	        a.add(url);
	        System.out.println(name+url);
	        try {
				if(ConnecttionPoolTest.updateUserimg(a)){
					out.print("<script>window.location.href='user/doset/me.jsp';</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(way.equals("2")){
			String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
			List<String> a = new ArrayList<String>();
	        a.add(name);
	        a.add(url);
	        try {
				if(ConnecttionPoolTest.updateUserimg(a)){
					out.print("<script>window.location.href='admin/admin-userupdata.jsp?nana="+name+"';</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
	}

}
