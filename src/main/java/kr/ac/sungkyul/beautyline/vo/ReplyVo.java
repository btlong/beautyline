package kr.ac.sungkyul.beautyline.vo;

public class ReplyVo {
	private Long no;
	private Long reviewNo;
	private Long userNo;
	private String userId;
	private String content;
	private String regDate;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(Long reviewNo) {
		this.reviewNo = reviewNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", reviewNo=" + reviewNo + ", userNo=" + userNo + ", userId=" + userId
				+ ", content=" + content + ", regDate=" + regDate + "]";
	}



}
