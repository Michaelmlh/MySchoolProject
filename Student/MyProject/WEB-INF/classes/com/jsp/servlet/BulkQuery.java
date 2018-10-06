package com.jsp.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBUtils;
import db.Db;
import entity.*;

/**
 * Servlet implementation class BulkQuery
 */
@WebServlet("/BulkQuery")
public class BulkQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulkQuery() {
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
		Answer answer=new Answer();
		ResultSet rs=null;
		List<Student> stu=new ArrayList<Student>();
		List<Classes> clas=new ArrayList<Classes>();
		String sql="";
		PreparedStatement presta;
		
		if("宿舍".equals(request.getParameter("project"))){//构造返回结果
			sql="SELECT   dormid, studentid, name, contactway, classid, bedid" 
						+"  FROM      View_S_R  where  dormid = ?";
/*				presta= db.PreparedStatement(sql);
			presta.setString(1, request.getParameter("discribe"));
			rs=presta.executeQuery();
			while(rs.next()){
				stu.add(
						new 学生(rs.getString(2),rs.getString(3),null,null,null,null
								,rs.getString(4),rs.getString(5),rs.getString(1),rs.getString(6)));
			}*/
			stu = DBUtils.getListData(entity.Student.class, sql, request.getParameter("discribe"));
		}else{
			sql="SELECT   classid, classname, studentid, name, enrollmentyear, contactway, dormid, bedid "
					+ "FROM View_S_C where classid = ?";
/*				presta= db.PreparedStatement(sql);
			presta.setString(1, request.getParameter("discribe"));
			rs=presta.executeQuery();
			while(rs.next()){
				DateFormat df=new SimpleDateFormat("YYYY-ww-u" );
				stu.add(
						new 学生(rs.getString(2),rs.getString(3),null,null,null,df.parse(rs.getString(4))
								,rs.getString(5),request.getParameter("discribe"),rs.getString(6),rs.getString(7)));
				clas.add(new 班级(request.getParameter("discribe"),rs.getString(1)));
			}*/
			clas = DBUtils.getListData(entity.Classes.class, sql, request.getParameter("discribe"));
			stu = DBUtils.getListData(entity.Student.class, sql, request.getParameter("discribe"));
		}
		answer.setStu(stu);
		answer.setClas(clas);
		session.setAttribute("answer", answer);
		response.sendRedirect(request.getContextPath()+"/1Query/bulkRS.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
