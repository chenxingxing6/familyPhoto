package com.Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPooladmin;

@WebServlet("/adminpic")
public class adminpic extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public adminpic() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        String way = request.getParameter("way");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String time = df.format(new Date());
        if(way.equals("delmore")){
        	String items = request.getParameter("delitems");
        	String[] item = items.split(",");
        	for (int i = 0; i < item.length; i++) { 
        		int a = Integer.parseInt(item[i]);
        		try {
					ConnecttionPooladmin.deletexc(a);
				} catch (Exception e) {
					e.printStackTrace();
				}
        	} 
        }else if(way.equals("del")){
        	String id = request.getParameter("id");
        	int a = Integer.parseInt(id);
        	try {
				ConnecttionPooladmin.deletexc(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        else if(way.equals("delmorepic")){
        	String items = request.getParameter("delitems");
        	String[] item = items.split(",");
        	for (int i = 0; i < item.length; i++) { 
        		int a = Integer.parseInt(item[i]);
        		try {
					ConnecttionPooladmin.deletepic(a);
				} catch (Exception e) {
					e.printStackTrace();
				}
        	} 
        }	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
