package com.jsp.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBUtils;
import entity.Limit;

/**
 * Servlet implementation class Updpsd
 */
@WebServlet("/Updpsd")
public class Updpsd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updpsd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		Limit  user = (Limit) session.getAttribute("user");
		String password = request.getParameter("password");
		String loginname = user.getUsername();
		String newpassword = request.getParameter("newpassword");
		PrintWriter out = response.getWriter();
		String sql = "select count(*) from Limit where username = ? and password = ?";
		Integer flag = (Integer) DBUtils.getOneColum(sql, loginname, password);
		if ( flag == 1 ) {
			String updatesql = "update Limit  set password = ? where username = ?";
			Integer flag2 = DBUtils.executeUpdate(updatesql, newpassword, loginname);
			if( flag2 == 1) { //修改密码成功
				session.invalidate();
//				response.sendRedirect(request.getContextPath() + "/frame1.jsp");
				out.println("<script>alert(\"修改成功！\");location.href=\"frame1.jsp\";</script>");
			}
		}else {
			out.println("<script>alert(\"请输入正确的密码\");location.href=\"frame1.jsp\";</script>");
		}
	}

}
