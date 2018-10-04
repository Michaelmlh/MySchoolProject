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

import db.Db;

/**
 * Servlet implementation class RegisterRom
 */
@WebServlet("/RegisterRom")
public class RegisterRom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterRom() {
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
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String sql = "insert into 宿舍  values (?,?)";
		session.setAttribute("rs", false);
		Db db = new Db();
		try {
			PreparedStatement presta = db.PreparedStatement(sql);
			presta.setString(1, request.getParameter("no"));
			presta.setString(2, request.getParameter("name"));
			if (presta.executeUpdate() == 1)
				response.getWriter()
						.print("<script>alert(\"注冊成功！\");location.href=\"2Control/rooms/room.jsp\";</script>");
			else
				response.getWriter()
						.print("<script>alert(\"注冊失败！\");location.href=\"2Control/rooms/room.jsp\";</script>");
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().print("<script>alert(\"注冊失败！\");location.href=\"2Control/rooms/room.jsp\";</script>");
		}
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
