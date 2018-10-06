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
 * Servlet implementation class DelStu
 */
@WebServlet("/DelStu")
public class DelStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelStu() {
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
		String sql = "delete from Student  where studentid=?";
		int rs = DBUtils.executeUpdate(sql, request.getParameter("no"));
		/*			PreparedStatement presta = db.PreparedStatement ("delete from 学生  where 学号=?");
		presta.setString(1, request.getParameter("no"));*/
		if(rs==1)//ɾ���ɹ�
			response.getWriter().println("<script>alert(\"删除成功\");location.href=\"2Control/students/student.jsp\";</script>");
		else
			response.getWriter().println("<script>alert(\"删除失败\");location.href=\"2Control/students/student.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
