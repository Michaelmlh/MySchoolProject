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
		HttpSession session = request.getSession();
		session.setAttribute("rs", false);
		String sqlStu="insert into 学生  values (?,?,?,?,?,?,?,?,?,?)";
		Db db=new Db();
		String birthDate=request.getParameter("birthYear")+"-"+request.getParameter("birthMonth")+"-"+request.getParameter("birthDay");
		String intoDate=request.getParameter("intoYear")+"-"+request.getParameter("intoMonth")+"-"+request.getParameter("intoDay");
//		System.out.println(intoDate);
//		System.out.println(birthDate);
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
			
			if(presta.executeUpdate()==1)//��ӳɹ�
				session.setAttribute("rs", true);
			else
				session.setAttribute("rs", false);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		request.getRequestDispatcher("/2Control/students/registerRS.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
