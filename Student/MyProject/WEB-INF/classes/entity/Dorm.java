package entity;

public class Dorm {
	private String dormid;
	private Integer peoplenum;
	public Dorm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDormid() {
		return dormid;
	}
	public void setDormid(String dormid) {
		this.dormid = dormid;
	}
	public Integer getPeoplenum() {
		return peoplenum;
	}
	public void setPeoplenum(Integer peoplenum) {
		this.peoplenum = peoplenum;
	}
	@Override
	public String toString() {
		return "Dorm [dormid=" + dormid + ", peoplenum=" + peoplenum + "]";
	}
	
}
