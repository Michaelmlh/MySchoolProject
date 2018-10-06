package entity;

public class Classes {	
	private String classid;
	private String classname;
	public Classes() {
		super();
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	@Override
	public String toString() {
		return "Classes [classid=" + classid + ", classname=" + classname + "]";
	}
}
