package com.servelt;
import com.DBpool.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkUser.do")
public class checkUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public checkUser() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		HttpSession session = request.getSession();
		session.setAttribute("isLog",new String("0"));//将isLog属性设置为1
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("user");
		String pwd = request.getParameter("password");
		String code = request.getParameter("code");
		String realcode = (String) session.getAttribute("code");
        try {
			if(ConnecttionPooladmin.checkUser(userName,pwd,"user")){
				  session.setAttribute("username",userName);
			      session.setAttribute("isLog",new String("1"));
			      if(code.equals(realcode)==false){
			    	 out.print("验证码");
			      }
			      else{out.print(1);}
			}else{out.print("密码");}
		} catch (Exception e) {e.printStackTrace();}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
