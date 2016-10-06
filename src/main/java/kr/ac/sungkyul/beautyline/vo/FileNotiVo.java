package kr.ac.sungkyul.beautyline.vo;

public class FileNotiVo {

	private Long no;
	private Long noticeNo;
	private String orgName;
	private String path;
	private String saveName;
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(Long noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	@Override
	public String toString() {
		return "FileNotiVo [no=" + no + ", noticeNo=" + noticeNo + ", orgName=" + orgName + ", path=" + path
				+ ", saveName=" + saveName + "]";
	}
	

	
}
