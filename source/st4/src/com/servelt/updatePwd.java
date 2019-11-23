package com.servelt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;

@WebServlet("/updatePwd.do")
public class updatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updatePwd() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String newpwd = request.getParameter("newpwd");
		List<String> datas = new ArrayList<String>();
		datas.add(name);
		datas.add(newpwd);
		try {
				if(ConnecttionPoolTest.updatePwd(datas)){
				out.println(1);
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
