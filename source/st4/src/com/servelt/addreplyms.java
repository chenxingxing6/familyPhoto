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
import javax.servlet.http.HttpSession;

import com.DBpool.ConnecttionPoolTest;

@WebServlet("/addreplyms")
public class addreplyms extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addreplyms() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("username");
        String id = (String) session.getAttribute("id");
        String content = new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
        String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8");
        Date date = new Date(); 
        SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = t.format(date);
        List<String> a = new ArrayList<String>();
        a.add(name);
        a.add(content);
        a.add(time);
        a.add(title);
        try{
			if(ConnecttionPoolTest.wreply(a))
			{
				out.print("<script>alert('发布成功!')</script>");
				out.print("<script>window.location.href='user/dotell/more.jsp?title="+title+"&id="+id+"'</script>");
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
