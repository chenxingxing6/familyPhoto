package com.servelt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public register() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String phone = request.getParameter("phone");
        String qq = request.getParameter("qq");
        String [] a = {name,pwd,phone,qq};
        try {
			if(ConnecttionPoolTest.adduser(a))
			{
				out.print("<center><h4>");
				out.print("×¢²á³É¹¦!");
				out.print("</h4></center>");
			}
			else
			{
				out.print("<h4>");
				out.print("×¢²áÊ§°Ü!");
				out.print("</h4>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
