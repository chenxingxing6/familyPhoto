package com.servelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;

@WebServlet("/addmessage")
public class addmessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addmessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String way = request.getParameter("way");
        Date date = new Date(); 
        SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = t.format(date);
        if(way.equals("1")){
        	String author = request.getParameter("author");
        	String editor = request.getParameter("editor");
        	List<String> a = new ArrayList<String>();
            a.add(author);
            a.add(editor);
            a.add(time);
            try {
				if(ConnecttionPoolTest.wfadeback(a)){
					out.print(1);
    
				}else{
					out.print(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
            
        }else if(way.equals("0")){
        	 String name = new String(request.getParameter("namee").getBytes("iso-8859-1"), "utf-8");
             String content = new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
             String sex = request.getParameter("sex");
             String eamil = request.getParameter("email");
             String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8");
             List<String> a = new ArrayList<String>();
             a.add(name);
             a.add(sex);
             a.add(eamil);
             a.add(title);
             a.add(content);
             a.add(time);
             try{
     			if(ConnecttionPoolTest.wmessage(a))
     			{
     				out.print("<center><h3>");
     				out.print("<script>alert('发布成功!')</script>");
     				out.print("<script>window.location.href='user/dotell/showmssage.jsp'</script>");
     				out.print("</h3></center>");
     			}
     			else
     			{
     				out.print("<h3>");
     				out.print("发布失败!");
     				out.print("</h3>");
     			}
     		} catch (Exception e) {
     			e.printStackTrace();
     		}
        }else if(way.equals("2")){
        	String user = request.getParameter("author");
        	String title = request.getParameter("title");
        	String text = request.getParameter("editor");
        	String url = request.getParameter("url");
        	List<String> a = new ArrayList<String>();
            a.add(user);
            a.add(title);
            a.add(text);
            a.add(time);
            a.add(url);
            try{
     			if(ConnecttionPoolTest.wshare(a))
     			{
     				out.print(1);
     			}
     			else
     			{
     				out.print(0);
     			}
     		} catch (Exception e) {
     			e.printStackTrace();
     		}
        }
       
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
