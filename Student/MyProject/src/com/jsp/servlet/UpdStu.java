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
		session.setAttribute("rs", false);
		String sql="update 学生 set 姓名=?,性别=?,出生日期 =?,民族=?,入学年份=?,联系方式=?,班号=?,宿舍号=?,床位号=? where 学号=?";
		Db db=new Db();
		try {
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
			presta.setString(10,request.getParameter("no"));
			if(presta.executeUpdate()==1)//�޸ĳɹ�
				session.setAttribute("rs", true);
			else
				session.setAttribute("rs", false);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		request.getRequestDispatcher("/2Control/students/updRS.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
