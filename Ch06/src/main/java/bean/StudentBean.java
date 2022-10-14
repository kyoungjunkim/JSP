package bean;

public class StudentBean {
	private String stdNo;
	private String stdName;
	private String stdHp;
	private int stdYear;
	private String stdAddr;
	
	public String getstdNo() {
		return stdNo;
	}
	public void setstdNo(String stdNo) {
		this.stdNo = stdNo;
	}
	public String getstdName() {
		return stdName;
	}
	public void setstdName(String stdName) {
		this.stdName = stdName;
	}
	public String getstdHp() {
		return stdHp;
	}
	public void setstdHp(String stdHp) {
		this.stdHp = stdHp;
	}
	public int getstdYear() {
		return stdYear;
	}
	public void setstdYear(int stdYear) {
		this.stdYear = stdYear;
	}
	public String getstdAddr() {
		return stdAddr;
	}
	public void setstdAddr(String stdAddr) {
		this.stdAddr = stdAddr;
	}
}