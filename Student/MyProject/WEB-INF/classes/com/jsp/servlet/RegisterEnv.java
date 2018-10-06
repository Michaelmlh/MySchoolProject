package com.jsp.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBUtils;
import db.Db;

/**
 * Servlet implementation class RegisterEnv
 */
@WebServlet("/RegisterEnv")
public class RegisterEnv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterEnv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		String sql="insert into Dormhealth  values (?,?,?,?,?,?,?,?,?,?,?)";
		int rs=DBUtils.executeUpdate(sql, request.getParameter("no"),request.getParameter("checkDate"),
				request.getParameter("E&S"),request.getParameter("floor"),request.getParameter("desk"),
				request.getParameter("bed"),request.getParameter("wash"),request.getParameter("bathroom")
				,request.getParameter("sun"),request.getParameter("note"),request.getParameter("isChange"));
		if(rs==1)
			response.getWriter().print("<script>alert(\"注册成功\");location.href=\"2Control/environments/environment.jsp\";</script>");
		else
			response.getWriter().print("<script>alert(\"注册失败\");location.href=\"2Control/environments/environment.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
