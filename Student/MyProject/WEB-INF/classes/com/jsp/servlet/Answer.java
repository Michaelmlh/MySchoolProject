package com.jsp.servlet;

import java.util.ArrayList;
import java.util.List;

import entity.*;

public class Answer {//����Ӧ����
	private List<学生> stu;
	private ArrayList<班级> clas;
	private ArrayList<宿舍> room; 
	private ArrayList<宿舍卫生> en;
	public List<学生> getStu() {
		return stu;
	}
	public void setStu(List<学生> stu2) {
		this.stu = stu2;
	}
	public ArrayList<班级> getClas() {
		return clas;
	}
	public void setClas(ArrayList<班级> clas) {
		this.clas = clas;
	}
	public ArrayList<宿舍> getRoom() {
		return room;
	}
	public void setRoom(ArrayList<宿舍> room) {
		this.room = room;
	}
	public ArrayList<宿舍卫生> getEn() {
		return en;
	}
	public void setEn(ArrayList<宿舍卫生> en) {
		this.en = en;
	}
	

}
