package com.Ajax;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;
import com.DBpool.ConnecttionPooladmin;


@WebServlet("/ajaxdelxc")
public class ajaxdelxc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ajaxdelxc() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String arr = request.getParameter("array");
		String s[] = arr.split(","); 
		if (s.length > 0) { 
			for (int i = 0; i < s.length; i++) { 
				try {
					int a = Integer.parseInt(s[i]);
					if(ConnecttionPooladmin.deletexc(a)){
						out.print("删除成功！");
					}else{
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
