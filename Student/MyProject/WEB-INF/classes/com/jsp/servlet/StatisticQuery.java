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
		List<Dormhealth> list=new ArrayList<Dormhealth>();
		
		session.setAttribute("project",request.getParameter("project") );
		session.setAttribute("order",request.getParameter("order") );
		session.setAttribute("discribe",request.getParameter("discribe") );
		//构造sql语句
		if(request.getParameter("project").equals("整改次数")){//整改次数
				sql="select top "+request.getParameter("discribe")+" dormid ,count(*) as note " + 
						"from Dormhealth " + 
						"where rectificationornot = 1 " + 
						"group by dormid "
						+"order by note "+(request.getParameter("order").equals("升序")?"asc":"desc");
			}
			else {//平均总分
				sql="select top "+request.getParameter("discribe")+" dormid ,sum(totalscore)/count(*) as note " + 
						"from Dormhealth  " + 
						"group by dormid " + 
						"order by note " +(request.getParameter("order").equals("升序")?"asc":"desc");
			}
		/*rs=db.executeQuery(sql);
		while(rs.next()){
			list.add(new 宿舍卫生(rs.getString(1),rs.getString(2),null,null,0));
		}*/
		list = DBUtils.getListData(entity.Dormhealth.class, sql);
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
