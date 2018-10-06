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
 * Servlet implementation class DelRom
 */
@WebServlet("/DelRom")
public class DelRom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelRom() {
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
		String sql = "delete from Dorm  where dormid=?";
		/*			PreparedStatement presta = db.PreparedStatement ("delete from 宿舍  where 宿舍号=?");
					presta.setString(1, request.getParameter("no"));*/
		int rs = DBUtils.executeUpdate(sql, request.getParameter("no"));
		if(rs==1)
			response.getWriter().println("<script>alert(\"删除成功\");location.href=\"2Control/rooms/room.jsp\";</script>");
		else
			response.getWriter().println("<script>alert(\"删除失败\");location.href=\"2Control/rooms/room.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
