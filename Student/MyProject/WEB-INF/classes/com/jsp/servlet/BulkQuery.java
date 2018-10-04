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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		ArrayList<学生> stu=new ArrayList<学生>();
		ArrayList<班级> clas=new ArrayList<班级>();
		String sql="";
		PreparedStatement presta;
		Db db=new Db();
		
		//����sql��䡢��ѯ������Ӧ�������
		try {
			if("宿舍".equals(request.getParameter("project"))){
				sql="SELECT   宿舍号, 学号, 姓名, 联系方式, 班号, 床位号" 
							+"  FROM      View_S_R  where  =?";
				presta= db.PreparedStatement(sql);
				presta.setString(1, request.getParameter("discribe"));
				rs=presta.executeQuery();
				while(rs.next()){
					stu.add(
							new 学生(rs.getString(2),rs.getString(3),null,null,null,null
									,rs.getString(4),rs.getString(5),rs.getString(1),rs.getString(6)));
				}
			}else{//�༶
				sql="SELECT   班名, 学号, 姓名, 入学年份, 联系方式, 宿舍号, 床位号 "
						+ "FROM View_S_C where 班号=?";
				presta= db.PreparedStatement(sql);
				presta.setString(1, request.getParameter("discribe"));
				rs=presta.executeQuery();
				while(rs.next()){
					DateFormat df=new SimpleDateFormat("YYYY-ww-u" );
					stu.add(
							new 学生(rs.getString(2),rs.getString(3),null,null,null,df.parse(rs.getString(4))
									,rs.getString(5),request.getParameter("discribe"),rs.getString(6),rs.getString(7)));
					clas.add(new 班级(request.getParameter("discribe"),rs.getString(1)));
				}
			}
		} catch (SQLException | ParseException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
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
