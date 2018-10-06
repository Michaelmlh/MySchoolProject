package com.jsp.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
		Limit user=( Limit) session.getAttribute("user");
		if(user!=null){
		Answer answer=new Answer();
		ResultSet rs=null;
		
		Db db=new Db();
		List<Student> stu=new ArrayList<Student>();
		List<Classes> clas=new ArrayList<Classes>();
		List<Dorm> room=new ArrayList<Dorm>();
		List<Dormhealth>list=new ArrayList<Dormhealth>();
		//构造学生、班级信息
		String sql="select * from Student,Classes  where  Student.classid=Classes.classid and Student.studentid=?";
		stu.add(DBUtils.getOneData(Student.class, sql, user.getUsername()));
		clas.add(DBUtils.getOneData(Classes.class, sql, user.getUsername()));
		//构造宿舍信息
		sql="select Dorm.* from Student,Dorm where Student.dormid=dorm.dormid and student.studentid=?";
		room.add(DBUtils.getOneData(Dorm.class, sql,user.getUsername()));
		//构造宿舍卫生信息
		sql="select dormhealth.* from student,dormhealth  where student.dormid = dormhealth.dormid and student.studentid=?";
		list.add(DBUtils.getOneData(Dormhealth.class, sql,user.getUsername()));
		
		answer.setEn(list);
		answer.setClas(clas);
		answer.setRoom(room);
		answer.setStu(stu);
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
