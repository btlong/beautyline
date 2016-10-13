package kr.ac.sungkyul.beautyline.vo;

public class QnABoardVo extends UserVo {
	private Long no;
	private Long userNo;
	private String userName;
	private String userId;
	private String title;
	private String content;
	private String regDate;
	private Long viewCount;
	private Long groupNo;
	private Long orderNo;
	private Long depth;
	private String category;
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Long getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(Long groupNo) {
		this.groupNo = groupNo;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "QnABoardVo [no=" + no + ", userNo=" + userNo + ", userName=" + userName + ", userId=" + userId
				+ ", title=" + title + ", content=" + content + ", regDate=" + regDate + ", viewCount=" + viewCount
				+ ", groupNo=" + groupNo + ", orderNo=" + orderNo + ", depth=" + depth + ", category=" + category + "]";
	}
	
	
	
	
	

	
}