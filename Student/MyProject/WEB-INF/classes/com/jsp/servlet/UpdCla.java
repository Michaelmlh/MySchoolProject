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
 * Servlet implementation class UpdCla
 */
@WebServlet("/UpdCla")
public class UpdCla extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdCla() {
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
		session.setAttribute("rs", false);
		String sql="update Classes  set classname=? where classid=?";
		int rs=DBUtils.executeUpdate(sql, request.getParameter("clasName"),request.getParameter("clasNo"));
		
		if(rs==1)
			response.getWriter().print("<script>alert(\"修改成功！\");location.href=\"2Control/classes/class.jsp\";</script>");
		else
			response.getWriter().print("<script>alert(\"修改失败！\");location.href=\"2Control/classes/class.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
