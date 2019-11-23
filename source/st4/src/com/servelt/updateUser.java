package com.servelt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBpool.ConnecttionPoolTest;

@WebServlet("/updateUser.do")
public class updateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updateUser() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession() ;  
		String name = new String(request.getParameter("nana").getBytes("iso-8859-1"), "utf-8");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("email");
		String qq = request.getParameter("qq");
		List<String> datas = new ArrayList<String>();
		datas.add(name);
		datas.add(phone);
		datas.add(mail);
		datas.add(qq);
		try {
			if(ConnecttionPoolTest.updateUser(datas)){
				out.print(1);
			}else{
				out.print(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
