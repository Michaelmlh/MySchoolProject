package queryDepart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;
import org.json.JSONArray;

import org.json.JSONException;

import java.util.*;
/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/random")
public class QueryServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L;       
	private Query_Class query = null;
	@Override
	public void init() throws ServletException {		
		super.init();
		query = new Query_Class();
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String classes = request.getParameter("class");	
		
		String departs = request.getParameter("depart");		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(classes == null && departs == null) {	//��ָ��ȫ�����		
			try {				
				out.println(new JSONObject(query.getAllRandomMap()));				
			} catch (Exception e) {				
				e.printStackTrace();
			}			
		}else if(classes != null && departs == null) { //ָ����Ӧ�İ༶
			String[] array_class = classes.split(",");
			ArrayList<String> list_class = new ArrayList<>();
			for(int i = 0; i < array_class.length; i ++) {
				list_class.add(array_class[i]);				
			}
			try {				
				out.println(new JSONObject(query.getAppointClassRandomMap(list_class)));				
			} catch (Exception e) {				
				e.printStackTrace();
			}			
		}else if(classes == null && departs != null) { //ָ����Ӧ������
			String[] array_depart = departs.split(",");
			ArrayList<String> list_depart = new ArrayList<>();
			for(int i = 0; i < array_depart.length; i ++) {
				list_depart.add(array_depart[i]);				
			}
			try {				
				out.println(new JSONObject(query.getAppointDepartRandomMap(list_depart)));				
			} catch (Exception e) {				
				e.printStackTrace();
			}			
		}
		else if(classes != null && departs != null) { //ָ����Ӧ�İ༶������
			String[] array_class = classes.split(",");
			ArrayList<String> list_class = new ArrayList<>();
			for(int i = 0; i < array_class.length; i ++) {
				list_class.add(array_class[i]);				
			}
			String[] array_depart = departs.split(",");
			ArrayList<String> list_depart = new ArrayList<>();
			for(int i = 0; i < array_depart.length; i ++) {
				list_depart.add(array_depart[i]);				
			}
			try {				
				out.println(new JSONObject(query.getAppointClassAndDepartRandomMap(list_class, list_depart)));				
			} catch (Exception e) {				
				e.printStackTrace();
			}			
		}
		
	}

}
