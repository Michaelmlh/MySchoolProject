package com.jsp.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class RegisterStu
 */
@WebServlet("/RegisterStu")
public class RegisterStu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterStu() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		String sql = "insert into Student  values (?,?,?,?,?,?,?,?,?,?)";
		int rs = DBUtils.executeUpdate(sql, request.getParameter("no"), request.getParameter("name"),
				request.getParameter("sex"), request.getParameter("birth"), request.getParameter("nation"),
				request.getParameter("intoDate"), request.getParameter("phone"), request.getParameter("clasNo"),
				request.getParameter("roomNo"), request.getParameter("bedNo"));
		if (rs == 1)
			response.getWriter()
					.println("<script>alert(\"注册成功！\");location.href=\"2Control/students/student.jsp\";</script>");
		else
			response.getWriter()
					.println("<script>alert(\"注册失败！\");location.href=\"2Control/students/student.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
