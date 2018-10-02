package entity;

import java.util.Date;
public class 宿舍卫生 {
	private String roomNo,note;
	private Date checkDate;
	private int[] grade=new int[8]; 
	private int isRectify;
	public 宿舍卫生(String roomNo, String note, Date checkDate, int[] grade, int isRectify) {
		this.roomNo = roomNo;
		this.note = note;
		this.checkDate = checkDate;
		this.grade = grade;
		this.isRectify = isRectify;
	}
	public 宿舍卫生() {
		// TODO �Զ����ɵĹ��캯�����
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public int[] getGrade() {
		return grade;
	}
	public void setGrade(int[] grade) {
		this.grade = grade;
	}
	public int getIsRectify() {
		return isRectify;
	}
	public void setIsRectify(int isRectify) {
		this.isRectify = isRectify;
	}
	
}
