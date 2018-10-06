package entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Dormhealth {
	private String dormid, note;
	private Date checkdate;
	private int electricityandsmell, ground, desk, bed, washtable, toilet, balcony, totalscore, rectificationornot;

	public Dormhealth() {
		super();
	}

	public Dormhealth(String dormid, Date checkdate, int electricityandsmell, int ground, int desk, int bed,
			int washtable, int toilet, int balcony, int totalscore, String note, int rectificationornot) {
		super();
		this.dormid = dormid;
		this.note = note;
		this.checkdate = checkdate;
		this.electricityandsmell = electricityandsmell;
		this.ground = ground;
		this.desk = desk;
		this.bed = bed;
		this.washtable = washtable;
		this.toilet = toilet;
		this.balcony = balcony;
		this.totalscore = totalscore;
		this.rectificationornot = rectificationornot;
	}

	public String getDormid() {
		return dormid;
	}

	public void setDormid(String dormid) {
		this.dormid = dormid;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	/*
	 * @return: YYYY-ww-u 格式的日期
	 */
	public String getStringCheckdate() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(checkdate);
	}

	public void setCheckdate(Date checkdate) {
		this.checkdate = checkdate;
	}

	public Date getCheckdate() {
		return checkdate;
	}

	public int getElectricityandsmell() {
		return electricityandsmell;
	}

	public void setElectricityandsmell(int electricityandsmell) {
		this.electricityandsmell = electricityandsmell;
	}

	public int getGround() {
		return ground;
	}

	public void setGround(int ground) {
		this.ground = ground;
	}

	public int getDesk() {
		return desk;
	}

	public void setDesk(int desk) {
		this.desk = desk;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getWashtable() {
		return washtable;
	}

	public void setWashtable(int washtable) {
		this.washtable = washtable;
	}

	public int getToilet() {
		return toilet;
	}

	public void setToilet(int toilet) {
		this.toilet = toilet;
	}

	public int getBalcony() {
		return balcony;
	}

	public void setBalcony(int balcony) {
		this.balcony = balcony;
	}

	public int getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}

	public int getRectificationornot() {
		return rectificationornot;
	}

	public void setRectificationornot(int rectificationornot) {
		this.rectificationornot = rectificationornot;
	}

}