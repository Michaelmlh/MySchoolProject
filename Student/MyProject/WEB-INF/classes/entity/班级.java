package entity;

public class 班级{
	private String classNo;
	private String className; 
	public 班级(String classNo, String className) {
		this.classNo = classNo;
		this.className = className;
	}
	public String getClassNo() { 
		return classNo;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
}
