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
		response.setContentType("text/html; charset=utf-8");
		String sql="update dormhealth  set electricityandsmell=?,ground=?,desk=?,bed=?,washtable=?,toilet=?,balcony=?,note=?,rectificationornot=? where dormid=? and checkdate=? ";
		int rs=DBUtils.executeUpdate(sql,request.getParameter("E&S"),request.getParameter("floor"),request.getParameter("desk")
				,request.getParameter("bed"),request.getParameter("wash"),request.getParameter("bathroom")
				,request.getParameter("sun"),request.getParameter("note"),request.getParameter("isChange")
				,request.getParameter("no"),request.getParameter("checkDate"));
/*		Db db=new Db();
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
		presta.setString(11,request.getParameter("checkDate"));*/
		if(rs==1)
			response.getWriter().print("<script>alert(\"修改成功\");location.href=\"2Control/environments/environment.jsp\";</script>");
		else
			response.getWriter().print("<script>alert(\"修改失败\");location.href=\"2Control/environments/environment.jsp\";</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
