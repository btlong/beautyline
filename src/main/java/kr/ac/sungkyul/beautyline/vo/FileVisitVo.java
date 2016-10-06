package kr.ac.sungkyul.beautyline.vo;

public class FileVisitVo {

	private Long no;
	private String orgName;
	private String path;
	private String saveName;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
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
		return "FileVisitVo [no=" + no + ", orgName=" + orgName + ", path=" + path + ", saveName=" + saveName + "]";
	}
	
	
}
