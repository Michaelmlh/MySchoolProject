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

import db.Db;

/**
 * Servlet implementation class DelCla
 */
@WebServlet("/DelCla")
public class DelCla extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelCla() {
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
		session.setAttribute("rs", false);
		Db db=new Db();
		try {
			PreparedStatement presta =  db.PreparedStatement ("delete from 班级  where 班号=?");
			presta.setString(1, request.getParameter("no"));
			if(presta.executeUpdate()==1)//ɾ���ɹ�
				response.getWriter().print("<script>alert(\"删除成功！\");location.href=\"2Control/classes/class.jsp\";</script>");
			else
				response.getWriter().print("<script>alert(\"删除失败！\");location.href=\"2Control/classes/class.jsp\";</script>");
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().print("<script>alert(\"删除失败！\");location.href=\"2Control/classes/class.jsp\";</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
