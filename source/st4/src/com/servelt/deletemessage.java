package com.servelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;

@WebServlet("/deletemessage")
public class deletemessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public deletemessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        try{
			if(ConnecttionPoolTest.deletemessage(id))
			{
				out.print("<script>alert('É¾³ý³É¹¦!')</script>");
				out.print("<script>window.location.href='dotell/showmssage.jsp'</script>");
			}
			else
			{
				out.print("<script>alert('É¾³ýÊ§°Ü!')</script>");
				out.print("<script>window.location.href='dotell/showmssage.jsp'</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
