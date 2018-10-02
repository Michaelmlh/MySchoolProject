package queryDepart;
import java.util.*;
import java.util.function.BiFunction;
import java.sql.*;
import db.Db;
public class Query_Class {
	private Db sql_server;	
	private Map<String , ArrayList<String>> map;
	public Query_Class() {
		try {
			init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Map<String , ArrayList<String>> getMap(){
		return map;
	}
	public void init() throws Exception{
		sql_server = new Db();		
		String sql = "select count(distinct 班号) from class_depart";//��ѯ�ж��ٰ�		
		ResultSet rs = sql_server.executeQuery(sql);	
		if(rs.next()) {
			map = new HashMap<String , ArrayList<String>>(Integer.parseInt(rs.getString(1)));
		}
		else {
			map = new HashMap<String , ArrayList<String>>();
		}
		rs.close();
		String sql2 = "select * from class_depart order by 班号";
		rs = sql_server.executeQuery(sql2);
		//�����������map����
		while(rs.next()) {
			ArrayList<String> list = new ArrayList<String>();
			list.add(rs.getString(2).trim());
			map.merge(rs.getString(1).trim(), list, (oldValue,newValue)->{
				oldValue.addAll(newValue);
				return oldValue;
			});
		}		
	}
	//ȫ�����,����Ҫ�������
	public Map<String , ArrayList<String>> getAllRandomMap() {
		Map<String , ArrayList<String>> newmap = new HashMap<>(map);
		newmap.replaceAll(new BiFunction<String, ArrayList<String>, ArrayList<String>>() {
			@Override
			public ArrayList<String> apply(String key, ArrayList<String> value) {
				if(value.size() <= 2)
					return value;
				else
				{
					ArrayList<String> list = new ArrayList<>();
					//����õ��ظ��� �����
					String one = value.remove((int)(Math.random() * value.size()));
					String two = value.remove((int)(Math.random() * value.size()));
					value.add(one);value.add(two);
					list.add(one);list.add(two);
					return list;
				}
			}
		});
		return newmap;				
	}
	//ָ��Ҫ��ĳ����������ᣬ�������
	public Map<String , ArrayList<String>> getAppointClassRandomMap(ArrayList<String> class_nums) {
		Map<String , ArrayList<String>> newmap = new HashMap<>(map);
		newmap.replaceAll((key,value)->{
			if(class_nums.contains(key)) {
				return value;
			}				
			if(value.size() <= 2)
				return value;
			else
			{
				ArrayList<String> list = new ArrayList<>();
				//����õ��ظ��� �����
				String one = value.remove((int)(Math.random() * value.size()));
				String two = value.remove((int)(Math.random() * value.size()));
				value.add(one);value.add(two);
				list.add(one);list.add(two);
				return list;
			}
		});
		return newmap;				
	}
	//ָ��Ҫ��ĳ�������ᣬ�������
	public Map<String , ArrayList<String>> getAppointDepartRandomMap(ArrayList<String> Depart_nums) {
		Map<String , ArrayList<String>> newmap = new HashMap<>(map);
		newmap.replaceAll((key,value)->{			
			if(value.size() <= 2)
				return value;
			else
			{
				String temp = "";
				ArrayList<String> list = new ArrayList<String>();				
				for(int i = 0; i < Depart_nums.size(); i ++) {
					if(value.contains(Depart_nums.get(i))) {
						list.add(Depart_nums.get(i));
						temp = Depart_nums.get(i);
					}
						
				}
				if(list.size() >= 2) {
					return list;
				}else if(list.size() == 1){
					value.remove(temp);
					String one = value.get((int)Math.random() * value.size());
					value.add(temp);list.add(one);
					return list;
				}
				String one = value.remove((int)(Math.random() * value.size()));
				String two = value.remove((int)(Math.random() * value.size()));
				value.add(one);value.add(two);
				list.add(one);list.add(two);
				return list;
			}
		});
		return newmap;				
	}
	//ĳ�����࣬ĳ��������ͬʱָ��
	public Map<String , ArrayList<String>> getAppointClassAndDepartRandomMap(ArrayList<String> class_nums,ArrayList<String> Depart_nums) {
		Map<String , ArrayList<String>> newmap = new HashMap<>(map);
		newmap.replaceAll((key,value)->{	
			if(class_nums.contains(key)) {	
				return value;
			}				
			if(value.size() <= 2)
				return value;
			else
			{
				String temp = "";
				ArrayList<String> list = new ArrayList<String>();				
				for(int i = 0; i < Depart_nums.size(); i ++) {
					if(value.contains(Depart_nums.get(i))) {
						list.add(Depart_nums.get(i));
						temp = Depart_nums.get(i);
					}
						
				}
				if(list.size() >= 2) {
					return list;
				}else if(list.size() == 1){
					value.remove(temp);
					String one = value.get((int)Math.random() * value.size());
					value.add(temp);list.add(one);
					return list;
				}
				String one = value.remove((int)(Math.random() * value.size()));
				String two = value.remove((int)(Math.random() * value.size()));
				value.add(one);value.add(two);
				list.add(one);list.add(two);
				return list;
			}
		});
		return newmap;				
	}
	public static void main(String[] args) {
		Query_Class a = new Query_Class();
		System.out.println(a.getMap());
		System.out.println(a.getAllRandomMap());
		ArrayList<String> list = new ArrayList<>();
		list.add("3");
		ArrayList<String> list1 = new ArrayList<>();
		list1.add("B151");
		
		System.out.println(a.getAppointClassRandomMap(list));
		System.out.println(a.getAppointDepartRandomMap(list1));
		System.out.println(a.getAppointClassAndDepartRandomMap(list, list1));
	}
}
