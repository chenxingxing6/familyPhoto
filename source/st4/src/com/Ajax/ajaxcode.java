package com.Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkcode")
public class ajaxcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ajaxcode() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
        HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String incode= request.getParameter("incode");
		if(!incode.equals(session.getAttribute("code"))){
			out.print("—È÷§¬Î ‰»Î¥ÌŒÛ!");
		}else{
			out.print(0);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
