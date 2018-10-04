package com.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		session.setAttribute("rs", false);
		String sqlStu="insert into 学生  values (?,?,?,?,?,?,?,?,?,?)";
		Db db=new Db();
		String birthDate=request.getParameter("birth");
		String intoDate=request.getParameter("intoDate");
		PrintWriter out = response.getWriter();
		try {
			PreparedStatement presta = db.PreparedStatement (sqlStu);
			presta.setString(1,request.getParameter("no"));
			presta.setString(2,request.getParameter("name"));
			presta.setString(3,request.getParameter("sex"));
			presta.setString(4,birthDate);
			presta.setString(5,request.getParameter("nation"));
			presta.setString(6,intoDate);
			presta.setString(7,request.getParameter("phone"));
			presta.setString(8,request.getParameter("clasNo"));
			presta.setString(9,request.getParameter("roomNo"));
			presta.setString(10,request.getParameter("bedNo"));
			
			if(presta.executeUpdate()==1)
				out.println("<script>alert(\"注册成功！\");location.href=\"2Control/students/student.jsp\";</script>");
			else
				out.println("<script>alert(\"注册失败！\");history.back();</script>");
		} catch (SQLException e) {	
			
			e.printStackTrace();
			out.println("<script>alert(\"注册失败！\");history.back();</script>");
		}
		//request.getRequestDispatcher("/2Control/students/registerRS.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
