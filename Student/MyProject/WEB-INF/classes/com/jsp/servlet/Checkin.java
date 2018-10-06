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
import toolBean.MyTools;

/**
 * Servlet implementation class Checkin
 */
@WebServlet("/Checkin")
public class Checkin extends HttpServlet implements javax.servlet.Servlet{
	private static final long serialVersionUID = 1L;
	Db db;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkin() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException{//�빹�췽�������𣿣���
		db=new Db();
		
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = MyTools.toChinese(request.getParameter("username"));
		String sql="select count(*) from user2 where username='"+username+"'";
		ResultSet rs;
		int i;
		HttpSession session = request.getSession();
		try {
			rs=db.executeQuery(sql);
			if(rs.next()){
				if((i=rs.getInt(1))==1){//用户名已存在
					session.setAttribute("username", username);
					request.getRequestDispatcher("/01/ex/register_error.jsp").forward(request,response);
				}
				else if(i==0){//用户注册，构造各
					String pwd=MyTools.toChinese(request.getParameter("key"));
					String sex=MyTools.toChinese(request.getParameter("sex"));
					String birthday=request.getParameter("birthYear")+"-"+request.getParameter("birthDay")+"-1";
					String email=MyTools.toChinese(request.getParameter("Email"));
					String[] love=(String[])request.getParameterValues("love");
                   	//ֵ
                   	String loves="";
                   	if(love!=null){
	                   	for(int j=0;j<love.length;j++){
	                   		if(!loves.equals("")) loves+=",";
	                   		loves+=MyTools.toChinese(love[j]);
	                   	}
	                   	loves+="。\n";
                   	}
                   	
                   	String discribe=MyTools.toChinese(request.getParameter("discribe"));
					
					
					
					sql="insert into user2 values(?,?,?,?,?,?,?,?)";
					PreparedStatement pStmt = db.PreparedStatement(sql);
					pStmt.setString(1, username);
					pStmt.setString(2, pwd);
					pStmt.setString(3, sex);
					pStmt.setString(4, birthday);
					pStmt.setString(5, email);
					pStmt.setString(6, discribe);
					pStmt.setString(7, "");
					pStmt.setString(8, loves);
					pStmt.executeUpdate();
					
					session.setAttribute("username", username);
					request.getRequestDispatcher("/01/ex/register_success.jsp").forward(request,response);
				}
			}
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}
