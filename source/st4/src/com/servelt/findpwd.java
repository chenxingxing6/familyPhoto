package com.servelt;
import com.DBpool.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/findpwd")
public class findpwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public findpwd() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		//String email = request.getParameter("eamil");
		HttpSession session = request.getSession();
	    String name=((String)session.getAttribute("name"));
		try {
			String pwd=ConnecttionPoolTest.findpwd(name);
			response.sendRedirect("forget/response.jsp?pwd="+pwd+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
