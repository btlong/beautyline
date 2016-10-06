package kr.ac.sungkyul.beautyline.vo;

public class ReserveVo {
	int no; //예약번호
	int userNo; //예약한 회원 번호
	String userName; //회원이름
	String progName; //예약한 프로그램 이름
	String resDate; //예약일
	int resTime; //예약시간
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProgName() {
		return progName;
	}
	public void setProgName(String progName) {
		this.progName = progName;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public int getResTime() {
		return resTime;
	}
	public void setResTime(int resTime) {
		this.resTime = resTime;
	}
	@Override
	public String toString() {
		return "ReserveVo [no=" + no + ", userNo=" + userNo + ", userName=" + userName + ", progName=" + progName
				+ ", resDate=" + resDate + ", resTime=" + resTime + "]";
	}
	
	
}
