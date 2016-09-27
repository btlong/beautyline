package kr.ac.sungkyul.beautyline.vo;

public class CouponVo {
	private Long no;
	private Long userNo;
	private Long program_no;
	private String programName;
	private Long count;
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
	public Long getProgram_no() {
		return program_no;
	}
	public void setProgram_no(Long program_no) {
		this.program_no = program_no;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CouponVo [no=" + no + ", userNo=" + userNo + ", program_no=" + program_no + ", programName="
				+ programName + ", count=" + count + "]";
	}
}
	