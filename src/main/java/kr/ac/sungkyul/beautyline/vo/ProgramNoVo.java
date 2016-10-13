package kr.ac.sungkyul.beautyline.vo;

public class ProgramNoVo {

	private Long userNo;
	private Long basic;//programNo==1
	private Long whitening;//programNo==2
	private Long antiaging;//programNo==3
	private Long acne;//programNo==4
	
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getBasic() {
		return basic;
	}
	public void setBasic(Long basic) {
		this.basic = basic;
	}
	public Long getWhitening() {
		return whitening;
	}
	public void setWhitening(Long whitening) {
		this.whitening = whitening;
	}
	public Long getAntiaging() {
		return antiaging;
	}
	public void setAntiaging(Long antiaging) {
		this.antiaging = antiaging;
	}
	public Long getAcne() {
		return acne;
	}
	public void setAcne(Long acne) {
		this.acne = acne;
	}
	
	@Override
	public String toString() {
		return "ProgramNoVo [userNo=" + userNo + ", basic=" + basic + ", whitening=" + whitening + ", antiaging="
				+ antiaging + ", acne=" + acne + "]";
	}
}
