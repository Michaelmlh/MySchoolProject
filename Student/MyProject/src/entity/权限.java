package entity;

import java.io.Serializable;

public class 权限 implements Serializable{
	private String login;
	private String key;
	private String user;
	private String level;
	public 权限() {}
	public 权限(String login,String key) {
		this.login=login;
		this.key=key;
		user=null;
		level=null;
	}
	public 权限(String login,String key,String user,String level) {
		this.login=login;
		this.key=key;
		this.user=user;
		this.level=level;
	}
	public boolean canDo(int control) {
		//1-��ϵͳ����Ա			�ܹ��������в���
		//2-�������Ա������		�ܹ��鿴 Ȩ�ޱ� ��������б����ܲ��� ����������
		//3-�༶�����˼�����		���ܲ鿴 Ȩ�ޱ� ��������б�
		//4-ѧ�������� 			���ܲ鿴������Ϣ
		
		//-ϵͳ����Ա 1234 	-�������Ա 234 		-�༶������ 34 		-ѧ�� 4
		switch (level) {
		case "系统管理员":if(control>=1) return true;
		case "卫生检察员":if(control>=2) return true;
		case "班级负责人":if(control>=3) return true;
		case "学生":if(control==4) return true;
			break;
		}
		return false;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getIntLevel() {
		switch (level) {
		case "ϵͳ����Ա": return 1;
		case "�������Ա": return 2;
		case "�༶������": return 3;
		case "ѧ��      ":return 4;
		}
		return 0;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
}
