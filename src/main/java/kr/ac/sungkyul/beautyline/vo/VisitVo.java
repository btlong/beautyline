package kr.ac.sungkyul.beautyline.vo;

/**
 * @author WonHo
 */
public class VisitVo {
	private Long no; // 방문내역 번호
	private Long userNo; // 회원 번호
	private Long programNo; // 프로그램 번호
	private Long iamgeNo; // 이미지 번호
	private String memo; // 메모
	private String regDate; // 날짜
	private Long whiteningScore; // 미백 점수
	private Long whinkleScore; // 주름 점수
	private Long elasticScore; // 피부탄력 점수
	private Long moistureScore; // 수분 점수
	private Long acneScore; // 여드름 점수
	private Double averageScore; // 평균점수
	
	private Long payNo; // 결제방법이름;

	/* 사용자 측정후 이미지 */
	private Long fNo; // 1.fno -> 저장시
	private String path; // 3.path
	private String orgName; // 4.orgName
	private String saveName; // 5.saveName
	private Long fileSize; // 6.filesize

	// private String name; // 이름검색을 위해 넣어야할지 말아야할지 모르겠음.

	/* getter & setter */
	
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

	public void setProgramNo(Long programNo) {
		this.programNo = programNo;
	}

	public Long getIamgeNo() {
		return iamgeNo;
	}

	public void setIamgeNo(Long iamgeNo) {
		this.iamgeNo = iamgeNo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Long getWhiteningScore() {
		return whiteningScore;
	}

	public void setWhiteningScore(Long whiteningScore) {
		this.whiteningScore = whiteningScore;
	}

	public Long getWhinkleScore() {
		return whinkleScore;
	}

	public void setWhinkleScore(Long whinkleScore) {
		this.whinkleScore = whinkleScore;
	}

	public Long getElasticScore() {
		return elasticScore;
	}

	public void setElasticScore(Long elasticScore) {
		this.elasticScore = elasticScore;
	}

	public Long getMoistureScore() {
		return moistureScore;
	}

	public void setMoistureScore(Long moistureScore) {
		this.moistureScore = moistureScore;
	}

	public Long getAcneScore() {
		return acneScore;
	}

	public void setAcneScore(Long acneScore) {
		this.acneScore = acneScore;
	}

	public Double getAverageScore() {
		return averageScore;
	}

	public void setAverageScore(Double averageScore) {
		this.averageScore = averageScore;
	}

	public Long getPayNo() {
		return payNo;
	}

	public void setPayNo(Long payNo) {
		this.payNo = payNo;
	}

	public Long getfNo() {
		return fNo;
	}

	public void setfNo(Long fNo) {
		this.fNo = fNo;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "VisitVo [no=" + no + ", userNo=" + userNo + ", programNo=" + programNo + ", iamgeNo=" + iamgeNo
				+ ", memo=" + memo + ", regDate=" + regDate + ", whiteningScore=" + whiteningScore + ", whinkleScore="
				+ whinkleScore + ", elasticScore=" + elasticScore + ", moistureScore=" + moistureScore + ", acneScore="
				+ acneScore + ", averageScore=" + averageScore + ", payNo=" + payNo + ", fNo=" + fNo + ", path=" + path
				+ ", orgName=" + orgName + ", saveName=" + saveName + ", fileSize=" + fileSize + "]";
	}
}
