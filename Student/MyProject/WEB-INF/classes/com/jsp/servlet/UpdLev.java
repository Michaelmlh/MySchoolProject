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
 * Servlet implementation class UpdLev
 */
@WebServlet("/UpdLev")
public class UpdLev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdLev() {
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
		String sql="update Limit set name=?,level=? where username=?";
		int rs=DBUtils.executeUpdate(sql,request.getParameter("Name"),request.getParameter("Level"),request.getParameter("No"));
/*		Db db=new Db();
		PreparedStatement presta = db.PreparedStatement (sql);
		presta.setString(1,request.getParameter("Name"));
		presta.setString(2,request.getParameter("Level"));
		presta.setString(3,request.getParameter("No"));*/
		if(rs==1)
			response.getWriter().println("<script>alert(\"修改成功！\");location.href=\"frame2.jsp\";</script>");
		else
			response.getWriter().println("<script>alert(\"修改失败！\");location.href=\"frame2.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
