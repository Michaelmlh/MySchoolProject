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
 * Servlet implementation class UpdStu
 */
@WebServlet("/UpdStu")
public class UpdStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdStu() {
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
		String sql="update Student set name=?,sex=?,birthday =?,nation=?,enrollmentyear=?,contactway=?,classid=?,dormid=?,bedid=? where studentid=?";
		int rs=DBUtils.executeUpdate(sql, request.getParameter("name"),request.getParameter("sex"),request.getParameter("birth")
				,request.getParameter("nation"),request.getParameter("intoDate"),request.getParameter("phone")
				,request.getParameter("clasNo"),request.getParameter("roomNo"),request.getParameter("bedNo")
				,request.getParameter("no"));
/*		Db db=new Db();
		PreparedStatement presta = db.PreparedStatement (sql);
		presta.setString(1,request.getParameter("name"));
		presta.setString(2,request.getParameter("sex"));
		presta.setString(3,request.getParameter("birth"));
		presta.setString(4,request.getParameter("nation"));
		presta.setString(5,request.getParameter("intoDate"));
		presta.setString(6,request.getParameter("phone"));
		presta.setString(7,request.getParameter("clasNo"));
		presta.setString(8,request.getParameter("roomNo"));
		presta.setString(9,request.getParameter("bedNo"));
		presta.setString(10,request.getParameter("no"));*/
		if(rs==1)
			response.getWriter().println("<script>alert(\"修改成功\");location.href=\"2Control/students/student.jsp\";</script>");
		else
			response.getWriter().println("<script>alert(\"修改失败\");location.href=\"2Control/students/student.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
