package com.jsp.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBUtils;
import entity.Limit;
@WebServlet("/servlet/Login")
 public class Login extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
 public Login() { 
			super();
		}   	
 public void destroy() {
		super.destroy(); 
	}
/* public int queryUser(String sql)throws Exception{
		int message = 0;
		try{
	        rs=db.executeQuery(sql);
	          if(rs.next()){
	        	  message = rs.getInt(1);
	          }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		Limit user;
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		String sql="select * from dbo.Limit  where username=?  and password=?  ";
		try{
			user = DBUtils.getOneData(Limit.class, sql, username,password);

			if(user!=null){//验证通过
				
				session.setAttribute("user", user);//记录登录人
//				response.sendRedirect(request.getContextPath()+"/frame.jsp");//跳转到主操作界面
				response.sendRedirect(request.getContextPath()+"/frame2.jsp");//2018-9-28
			}else{
				session.setAttribute("username", username);
				request.getRequestDispatcher("/Login&Register/error.jsp").forward(request,response);//response.sendRedirect("Error"); 
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
 }
