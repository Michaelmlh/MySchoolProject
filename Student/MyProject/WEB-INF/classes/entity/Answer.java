package entity;
import java.util.List;

import entity.*;

public class Answer {//����Ӧ����
	private List<Student> stu;
	private List<Classes> clas;
	private List<Dorm> room; 
	private List<Dormhealth> en;
	public List<Student> getStu() {
		return stu;
	}
	public void setStu(List<Student> stu) {
		this.stu = stu;
	}
	public List<Classes> getClas() {
		return clas;
	}
	public void setClas(List<Classes> clas) {
		this.clas = clas;
	}
	public List<Dorm> getRoom() {
		return room;
	}
	public void setRoom(List<Dorm> room) {
		this.room = room;
	}
	public List<Dormhealth> getEn() {
		return en;
	}
	public void setEn(List<Dormhealth> en) {
		this.en = en;
	}
	
}
