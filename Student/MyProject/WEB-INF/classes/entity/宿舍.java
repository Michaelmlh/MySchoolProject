package entity;

public class 宿舍 {
	private String roomNo;
	private int bedcount;
	public 宿舍(String roomNo, int bedcount) {
		this.roomNo = roomNo;
		this.bedcount = bedcount;
	}
	public 宿舍() {
		// TODO �Զ宿舍ɵĹ��캯宿舍�
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public int getBedcount() {
		return bedcount;
	}
	public void setBedcount(int bedcount) {
		this.bedcount = bedcount;
	}
	
}
