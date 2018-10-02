package entity;

import java.util.Date;
public class 学生 {
	private String no;
	private String name;
	private String sex;
	private Date birthday;
	private String nation;
	private Date intoDate;
	private String phoneNumber;
	private String classNo;
	private String roomNo;
	private String bedNo;
	public 学生(String no, String name, String sex, Date birthday, String nation, Date intoDate, String phoneNumber,
			String classNo, String roomNo, String bedNo) {
		this.no = no;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.nation = nation;
		this.intoDate = intoDate;
		this.phoneNumber = phoneNumber;
		this.classNo = classNo;
		this.roomNo = roomNo;
		this.bedNo = bedNo;
	}
	public 学生() {
		// TODO �Զ����ɵĹ��캯�����
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Date getIntoDate() {
		return intoDate;
	}
	public void setIntoDate(Date intoDate) {
		this.intoDate = intoDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getClassNo() {
		return classNo;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getBedNo() {
		return bedNo;
	}
	public void setBedNo(String bedNo) {
		this.bedNo = bedNo;
	}
}
