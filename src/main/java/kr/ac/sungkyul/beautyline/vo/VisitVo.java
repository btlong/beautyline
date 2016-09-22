package kr.ac.sungkyul.beautyline.vo;

/**
 * @author WonHo
 *
 */
public class VisitVo {
	private long no; // 방문내역 번호
	private long userNo; // 회원 번호
	private long programNo; // 프로그램 번호
	private long iamgeNo; // 이미지 번호
	private String memo; // 메모
	private String regDate; // 날짜
	private long whiteningScore; // 미백 점수
	private long whinkleScore; // 주름 점수
	private long elasticScore; // 피부탄력 점수
	private long moistureScore; // 수분 점수
	private long acneScore; // 여드름 점수
	private double averageScore; // 평균점수

	/* getter & setter */
	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public long getUserNo() {
		return userNo;
	}

	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}

	public long getProgramNo() {
		return programNo;
	}

	public void setProgramNo(long programNo) {
		this.programNo = programNo;
	}

	public long getIamgeNo() {
		return iamgeNo;
	}

	public void setIamgeNo(long iamgeNo) {
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

	public long getWhiteningScore() {
		return whiteningScore;
	}

	public void setWhiteningScore(long whiteningScore) {
		this.whiteningScore = whiteningScore;
	}

	public long getWhinkleScore() {
		return whinkleScore;
	}

	public void setWhinkleScore(long whinkleScore) {
		this.whinkleScore = whinkleScore;
	}

	public long getElasticScore() {
		return elasticScore;
	}

	public void setElasticScore(long elasticScore) {
		this.elasticScore = elasticScore;
	}

	public long getMoistureScore() {
		return moistureScore;
	}

	public void setMoistureScore(long moistureScore) {
		this.moistureScore = moistureScore;
	}

	public long getAcneScore() {
		return acneScore;
	}

	public void setAcneScore(long acneScore) {
		this.acneScore = acneScore;
	}

	public double getAverageScore() {
		return averageScore;
	}

	public void setAverageScore(double averageScore) {
		this.averageScore = averageScore;
	}

	@Override
	public String toString() {
		return "VisitVo [no=" + no + ", userNo=" + userNo + ", programNo=" + programNo + ", iamgeNo=" + iamgeNo
				+ ", memo=" + memo + ", regDate=" + regDate + ", whiteningScore=" + whiteningScore + ", whinkleScore="
				+ whinkleScore + ", elasticScore=" + elasticScore + ", moistureScore=" + moistureScore + ", acneScore="
				+ acneScore + ", averageScore=" + averageScore + "]";
	}
}
