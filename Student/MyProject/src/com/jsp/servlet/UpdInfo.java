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
 * Servlet implementation class UpdInfo
 */
@WebServlet("/UpdInfo")
public class UpdInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdInfo() {
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
		String sql1="update 学生 set 姓名=?,性别=?,出生日期 =?,民族=?,入学年份=?,联系方式=?,班号=?,宿舍号=?,床位号=? where 学号=?";
		String sql2="update 权限 set 密码=? where 登录名=?";
		Db db=new Db();
		try {
			PreparedStatement presta1 = db.PreparedStatement (sql1);
			presta1.setString(1,request.getParameter("name"));
			presta1.setString(2,request.getParameter("sex"));
			presta1.setString(3,request.getParameter("birth"));
			presta1.setString(4,request.getParameter("nation"));
			presta1.setString(5,request.getParameter("intoDate"));
			presta1.setString(6,request.getParameter("phone"));
			presta1.setString(7,request.getParameter("clasNo"));
			presta1.setString(8,request.getParameter("roomNo"));
			presta1.setString(9,request.getParameter("bedNo"));
			presta1.setString(10,request.getParameter("No"));
			PreparedStatement presta2 = db.PreparedStatement (sql2);
			presta2.setString(1,request.getParameter("Password"));
			presta2.setString(2,request.getParameter("No"));
			if(presta1.executeUpdate()==1&&presta2.executeUpdate()==1)
				session.setAttribute("rs", true);
			else
				session.setAttribute("rs", false);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		request.getRequestDispatcher("/1Query/updRS.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
