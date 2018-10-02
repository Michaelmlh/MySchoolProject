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
 * Servlet implementation class StatisticQuery
 */
@WebServlet("/StatisticQuery")
public class StatisticQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticQuery() {
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
		String sql="";
		ArrayList<宿舍卫生> list=new ArrayList<宿舍卫生>();
		Db db=new Db();
		session.setAttribute("project",request.getParameter("project") );
		session.setAttribute("order",request.getParameter("order") );
		session.setAttribute("discribe",request.getParameter("discribe") );
		//����sql���
		if(request.getParameter("project").equals("整改次数")){//整改次数
				sql="select top "+request.getParameter("discribe")+" 宿舍号 ,count(*) as 整改次数 " + 
						"from 宿舍卫生 " + 
						"where 是否整改=1 " + 
						"group by 宿舍号 "
						+"order by 整改次数 "+(request.getParameter("order").equals("升序")?"asc":"desc");
			}
			else {//平均总分
				sql="select top "+request.getParameter("discribe")+" 宿舍号 ,sum(总分)/count(*) as 平均总分 " + 
						"from 宿舍卫生  " + 
						"group by 宿舍号 " + 
						"order by 平均总分 " +(request.getParameter("order").equals("升序")?"asc":"desc");//sql���
			}
		//��ѯ������Ӧ�������
		try {
			rs=db.executeQuery(sql);
			while(rs.next()){
				list.add(new 宿舍卫生(rs.getString(1),rs.getString(2),null,null,0));//���Ĵ�����ƽ���ܷ��Ա�ע����ʽ����¼
			}
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		answer.setEn(list);
		session.setAttribute("answer", answer);
		response.sendRedirect(request.getContextPath()+"/1Query/staRS.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
