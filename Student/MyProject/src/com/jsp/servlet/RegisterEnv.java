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
 * Servlet implementation class RegisterEnv
 */
@WebServlet("/RegisterEnv")
public class RegisterEnv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterEnv() {
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
		String sqlStu="insert into 宿舍卫生  values (?,?,?,?,?,?,?,?,?,?,?)";
		Db db=new Db();
		String checkDate=request.getParameter("checkYear")+"-"+request.getParameter("checkMonth")+"-"+request.getParameter("checkDay");
//		System.out.println(checkDate);
//		System.out.println(birthDate);
		try {
			PreparedStatement presta = db.PreparedStatement (sqlStu);
			presta.setString(1,request.getParameter("no"));
			presta.setString(2,checkDate);
			presta.setString(3,request.getParameter("E&S"));
			presta.setString(4,request.getParameter("floor"));
			presta.setString(5,request.getParameter("desk"));
			presta.setString(6,request.getParameter("bed"));
			presta.setString(7,request.getParameter("wash"));
			presta.setString(8,request.getParameter("bathroom"));
			presta.setString(9,request.getParameter("sun"));
			presta.setString(10,request.getParameter("note"));
			presta.setString(11,request.getParameter("isChange"));
			if(presta.executeUpdate()==1)//��ӳɹ�
				session.setAttribute("rs", true);
			else
				session.setAttribute("rs", false);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		request.getRequestDispatcher("/2Control/environments/registerRS.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
