package com.jsp.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.Db;
import entity.*;

/**
 * Servlet implementation class StuInfo
 */
@WebServlet("/StuInfo")
public class StuInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StuInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		权限 user=(权限) session.getAttribute("user");
		if(user!=null){
		Answer answer=new Answer();
		ResultSet rs=null;
		Db db=new Db();
		ArrayList<学生> stu=new ArrayList<学生>();
		ArrayList<班级> clas=new ArrayList<班级>();
		ArrayList<宿舍> room=new ArrayList<宿舍>();
		ArrayList<宿舍卫生>list=new ArrayList<宿舍卫生>();
		String sql="select * from 学生,班级  where  学生.班号=班级.班号 and 学生.学号="+user.getLogin();
		try {
			rs = db.executeQuery(sql);
			
			if(rs.next()){
				stu.add(
						new 学生(rs.getString(1),rs.getString(2),rs.getString(3),rs.getDate(4),rs.getString(5)
								,rs.getDate(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10)));
				clas.add(new 班级(rs.getString(11),rs.getString(12)));
			}			
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		
		try {
			sql="select 宿舍.*from 学生,宿舍 where 学生.宿舍号=宿舍.宿舍号 and 学生.学号="+user.getLogin();
			rs=db.executeQuery(sql);
			if(rs.next()){
				room.add(new 宿舍(rs.getString(1),rs.getInt(2)));
			}
			
			sql="select 宿舍卫生.* from 学生,宿舍卫生 where 学生.宿舍号 = 宿舍卫生.宿舍号 and 学生.学号="+user.getLogin();
			rs=db.executeQuery(sql);
			while(rs.next()){
				list.add(new 宿舍卫生(
						rs.getString(1),rs.getString(11),rs.getDate(2),
						new int[]{rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6)
							,rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10)},
						rs.getInt(12)
						));
			}
			answer.setEn(list);
			answer.setClas(clas);
			answer.setRoom(room);
			answer.setStu(stu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("answer", answer);
		}
		response.sendRedirect(request.getContextPath()+"/1Query/userInfo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
