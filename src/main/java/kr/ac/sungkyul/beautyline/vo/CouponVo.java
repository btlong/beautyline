package kr.ac.sungkyul.beautyline.vo;

public class CouponVo {
	private Long no;
	private Long userNo;
	private Long programNo;  
	private Long count;
	private Long price;
	private String regDate; // 날짜
	private Long payNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getProgramNo() {
		return programNo;
	}
	public void setProgram_No(Long programNo) {
		this.programNo = programNo;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public Long getPayNo() {
		return payNo;
	}
	public void setPayNo(Long payNo) {
		this.payNo = payNo;
	}
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CouponVo [no=" + no + ", userNo=" + userNo + ", programNo=" + programNo + ", count=" + count
				+ ", price=" + price + ", regDate=" + regDate + ", payNo=" + payNo + "]";
	}
}
	