package com.Ajax;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPoolTest;


@WebServlet("/ajaxpic")
public class ajaxpic extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ajaxpic() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
		String oldname = new String(request.getParameter("oldname").getBytes("iso-8859-1"), "utf-8");
		System.out.println(name+oldname);
		String url = request.getParameter("url");
		Date date = new Date(); 
        SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = t.format(date);
        List<String> a = new ArrayList<String>();
        a.add(id);
        a.add(name);
        a.add(time);
        a.add(url);
        try {
			if(ConnecttionPoolTest.updatapic(a)){
				List<String> b = new ArrayList<String>();
		        b.add(oldname);
		        b.add(name);
				ConnecttionPoolTest.updatapicstyle(b);
				out.print("修改成功");
			}else{
				out.print("修改失败!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
