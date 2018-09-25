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
 * Servlet implementation class UpdEnv
 */
@WebServlet("/UpdEnv")
public class UpdEnv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdEnv() {
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
		String sql="update 宿舍卫生  set 用电与气味=?,地面=?,书桌=?,床铺=?,洗漱台=?,卫生间=?,阳台=?,备注=?,是否整改=? where 宿舍号=? and 检查日期=? ";
		Db db=new Db();
		try {
			PreparedStatement presta = db.PreparedStatement (sql);
			presta.setString(1,request.getParameter("E&S"));
			presta.setString(2,request.getParameter("floor"));
			presta.setString(3,request.getParameter("desk"));
			presta.setString(4,request.getParameter("bed"));
			presta.setString(5,request.getParameter("wash"));
			presta.setString(6,request.getParameter("bathroom"));
			presta.setString(7,request.getParameter("sun"));
			presta.setString(8,request.getParameter("note"));
			presta.setInt(9,Integer.parseInt(request.getParameter("isChange")));
			presta.setString(10,request.getParameter("no"));
			presta.setString(11,request.getParameter("checkDate"));
			if(presta.executeUpdate()==1)//�޸ĳɹ�
				session.setAttribute("rs", true);
			else
				session.setAttribute("rs", false);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		request.getRequestDispatcher("/2Control/environments/updRS.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
