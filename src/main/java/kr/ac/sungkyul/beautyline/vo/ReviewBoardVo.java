package kr.ac.sungkyul.beautyline.vo;

public class ReviewBoardVo extends UserVo {
	private Long no;
	private String title;
	private String content;
	private String regDate;
	private Long viewCount;
	private Long userNo;
	private String userId;
	private String category;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Long getViewCount() {
		return viewCount;
	}
	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}

	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "ReviewBoardVo [no=" + no + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", viewCount=" + viewCount + ", userNo=" + userNo + ", userId=" + userId + ", category=" + category
				+ "]";
	}
	
	
	
	
	
	
	
}
