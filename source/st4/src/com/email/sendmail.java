package com.email;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class sendmail
 */
@WebServlet("/sendmail")
public class sendmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//通知浏览器以何种码表打开
		response.setCharacterEncoding("GB2312");//通知服务器发送数据时查阅的码表
		PrintWriter out = response.getWriter();  
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String type = request.getParameter("type");
		String password = request.getParameter("password");
		String text=""+email+",你好：你的密码为"+code+"。提示:此信是由系统发出，系统不接收回信,请勿直接回复!";
        MailUtil.sendMail("3562499648@qq.com", "家庭相册管理系统",text);
        if(type.equals("1")){
        	if(password.equals("147258")){
        		out.print("验证成功!");
        	}else{
        		out.print("验证失败!");
        	}
        }
        else{
        	out.print(text);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
