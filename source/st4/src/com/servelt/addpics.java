package com.servelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet("/addpics")
public class addpics extends HttpServlet {
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
	    String user = (String) session.getAttribute("username");
	    String name = new String(request.getParameter("nana").getBytes("iso-8859-1"), "utf-8");
		String pathh = "upload/"+smartupload.getFiles().getFile(0).getFileName(); 
		String cxx = "/upload";
		try {
			smartupload.save(cxx);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		 List<String> a = new ArrayList<String>();
		 if(!name.equals("1")){
			 a.add(user);
			 a.add(pathh);
			 a.add(name);
			 try {
				if(ConnecttionPoolTest.addpic(a)){
					out.print("<script>window.location.href='user/dopic/picshow.jsp?name="+name+"';</script>");
				 }
				else{
					out.print("<script>alert('上传失败！');</script>"); 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }else{
			 a.add(user);
			 a.add(pathh);
			 a.add("null");
			 try {
				if(ConnecttionPoolTest.addpic(a)){
					out.print("<script>window.location.href='user/dotell/medium.jsp';</script>");
				 }
				else{
					out.print("<script>alert('上传失败！');</script>"); 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }
	}
}
