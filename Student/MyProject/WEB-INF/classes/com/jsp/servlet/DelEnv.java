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
 * Servlet implementation class DelEnv
 */
@WebServlet("/DelEnv")
public class DelEnv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelEnv() {
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
		/*System.out.println(request.getParameter("checkDate"));*/
		String sql = "delete from Dormhealth  where dormid=? and checkdate=?";
		int rs = DBUtils.executeUpdate(sql, request.getParameter("no"),request.getParameter("checkDate"));
/*			PreparedStatement presta = db.PreparedStatement ("delete from 宿舍卫生  where 宿舍号=? and 检查日期=?");
		presta.setString(1, request.getParameter("no"));
		presta.setString(2, request.getParameter("checkDate"));*/
		if(rs==1)
			response.getWriter().print("<script>alert(\"删除成功\");location.href=\"2Control/environments/environment.jsp\";</script>");
		else
			response.getWriter().print("<script>alert(\"删除失败\");location.href=\"2Control/environments/environment.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
