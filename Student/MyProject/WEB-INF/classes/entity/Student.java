package entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Student {
	private String studentid;
	private String name;
	private String sex;
	private String nation;
	private Date enrollmentyear, birthday;
	private String contactway;
	private String classid;
	private String dormid;
	private String bedid;

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
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

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	/*
	 * @return: YYYY-ww-u 格式的日期
	 */
	public String getStringEnrollmentyear() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(enrollmentyear);
	}

	public void setEnrollmentyear(Date enrollmentyear) {
		this.enrollmentyear = enrollmentyear;
	}

	public Date getEnrollmentyear() {
		return enrollmentyear;
	}

	public Date getBirthday() {
		return birthday;
	}

	/*
	 * @return: YYYY-ww-u 格式的日期
	 */
	public String getStringBirthday() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(birthday);
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getContactway() {
		return contactway;
	}

	public void setContactway(String contactway) {
		this.contactway = contactway;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getDormid() {
		return dormid;
	}

	public void setDormid(String dormid) {
		this.dormid = dormid;
	}

	public String getBedid() {
		return bedid;
	}

	public void setBedid(String bedid) {
		this.bedid = bedid;
	}

	@Override
	public String toString() {
		return "Student [studentid=" + studentid + ", name=" + name + ", sex=" + sex + ", nation=" + nation
				+ ", enrollmentyear=" + enrollmentyear + ", birthday=" + birthday + ", contactway=" + contactway
				+ ", classid=" + classid + ", dormid=" + dormid + ", bedid=" + bedid + "]";
	}

}
