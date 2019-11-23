package com.Ajax;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;


@WebServlet("/ajaxpwd")
public class ajaxpwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ajaxpwd() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
		String pwd = request.getParameter("pwd");
		try {
			if(ConnecttionPoolTest.checkUser(name, pwd)){
				out.println(true);
			}
			else{
				 out.print(false); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
