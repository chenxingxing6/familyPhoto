package com.Ajax;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBpool.ConnecttionPooladmin;

@WebServlet("/adminaddtell")
public class adminaddtell extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public adminaddtell() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8"); 
        //PrintWriter out = response.getWriter();
        String way = request.getParameter("way");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String time = df.format(new Date());
        if(way.equals("1")){
        	String name = request.getParameter("author");
            String editor = request.getParameter("editor");
        	 List<String> a = new ArrayList<String>();
        	 a.add(editor);
        	 a.add(name);
        	 a.add(time);
        	 try {
				ConnecttionPooladmin.wtell(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        else if(way.equals("2")){
        	String id = request.getParameter("id");
        	int a = Integer.parseInt(id);
        	try {
				ConnecttionPooladmin.deltell(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        else if(way.equals("3")){
        	String id = request.getParameter("idd");
        	String text = request.getParameter("editor");
        	 List<String> a = new ArrayList<String>();
        	 a.add(id);
        	 a.add(text);
        	 a.add(time);
        	try {
				ConnecttionPooladmin.updatetell(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        else if(way.equals("4")){
        	String items = request.getParameter("delitems");
        	String[] item = items.split(",");
        	for (int i = 0; i < item.length; i++) { 
        		int a = Integer.parseInt(item[i]);
        		try {
					ConnecttionPooladmin.deltell(a);
				} catch (Exception e) {
					e.printStackTrace();
				}
        	} 
        }
        else if(way.equals("5")){
        	 String id = request.getParameter("id");
        	 String statu = request.getParameter("statu");
        	 List<String> a = new ArrayList<String>();
        	 a.add(id);
        	 a.add(statu);
        	try {
				ConnecttionPooladmin.dotell(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(way.equals("6")){
        	String items = request.getParameter("delitems");
        	String[] item = items.split(",");
        	for (int i = 0; i < item.length; i++) { 
        		int a = Integer.parseInt(item[i]);
        		try {
					ConnecttionPooladmin.delreplays(a);
				} catch (Exception e) {
					e.printStackTrace();
				}
        	} 
        }else if(way.equals("7")){
        	String id=request.getParameter("id");
        	int a = Integer.parseInt(id);
        	try {
				ConnecttionPooladmin.delreplays(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(way.equals("8")){
        	String id=request.getParameter("idd");
        	String reply=request.getParameter("editor");
        	List<String> a = new ArrayList<String>();
	       	a.add(id);
	       	a.add(reply);
	       	try {
				ConnecttionPooladmin.replynews(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(way.equals("9")){
        	String id=request.getParameter("id");
        	try {
				ConnecttionPooladmin.readnews(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
