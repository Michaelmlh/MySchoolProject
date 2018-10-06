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
		String sql1="update Student set name=?,sex=?,birthday =?,nation=?,enrollmentyear=?,contactway=?,classid=?,dormid=?,bedid=? where studentid=?";
		String sql2="update Limit set password=? where username=?";
		int rs1=DBUtils.executeUpdate(sql1,request.getParameter("name"),request.getParameter("sex"),request.getParameter("birth")
				,request.getParameter("nation"),request.getParameter("intoDate"),request.getParameter("phone")
				,request.getParameter("clasNo"),request.getParameter("roomNo"),request.getParameter("bedNo")
				,request.getParameter("No"));
		int rs2=DBUtils.executeUpdate(sql2,request.getParameter("Password"),request.getParameter("No"));
/*		Db db=new Db();
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
		presta2.setString(2,request.getParameter("No"));*/
		if(rs1==1&&rs2==1)
			session.setAttribute("rs", true);
		else
			session.setAttribute("rs", false);
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
