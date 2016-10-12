package kr.ac.sungkyul.beautyline.vo;

public class ProgramNoVo {

	private Long userNo;
	private int basic;//programNo==1
	private int whitening;//programNo==2
	private int antiaging;//programNo==3
	private int acne;//programNo==4
	
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public int getBasic() {
		return basic;
	}
	public void setBasic(int basic) {
		this.basic = basic;
	}
	public int getWhitening() {
		return whitening;
	}
	public void setWhitening(int whitening) {
		this.whitening = whitening;
	}
	public int getAntiaging() {
		return antiaging;
	}
	public void setAntiaging(int antiaging) {
		this.antiaging = antiaging;
	}
	public int getAcne() {
		return acne;
	}
	public void setAcne(int acne) {
		this.acne = acne;
	}
	
	@Override
	public String toString() {
		return "ProgramNoVo [userNo=" + userNo + ", basic=" + basic + ", whitening=" + whitening + ", antiaging="
				+ antiaging + ", acne=" + acne + "]";
	}
}
