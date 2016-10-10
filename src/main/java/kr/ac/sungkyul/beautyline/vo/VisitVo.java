package kr.ac.sungkyul.beautyline.vo;

/**
 * @author WonHo
 *
 */
public class VisitVo {
	private Long no; // 방문내역 번호
	private Long userNo; // 회원 번호
	private String name; // 이름
	private Long programNo; // 프로그램 번호
	private String programName; // 프로그램 이름

	private Long imageNo; // 이미지 번호
	private String memo; // 메모
	private String regDate; // 날짜
	private Long whiteningScore; // 미백 점수
	private Long whinkleScore; // 주름 점수
	private Long elasticScore; // 피부탄력 점수
	private Long moistureScore; // 수분 점수
	private Long acneScore; // 여드름 점수
	private Long averageScore; // 평균점수

	private Long payNo; // 결제방법번호;
	private String payName; // 결제 방법 이름

	private Long price;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getProgramNo() {
		return programNo;
	}

	public void setProgramNo(Long programNo) {
		this.programNo = programNo;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public Long getImageNo() {
		return imageNo;
	}

	public void setImageNo(Long imageNo) {
		this.imageNo = imageNo;
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

	public Long getAverageScore() {
		return averageScore;
	}

	public void setAverageScore(long l) {
		this.averageScore = l;
	}

	public Long getPayNo() {
		return payNo;
	}

	public void setPayNo(Long payNo) {
		this.payNo = payNo;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "VisitVo [no=" + no + ", userNo=" + userNo + ", name=" + name + ", programNo=" + programNo
				+ ", programName=" + programName + ", imageNo=" + imageNo + ", memo=" + memo + ", regDate=" + regDate
				+ ", whiteningScore=" + whiteningScore + ", whinkleScore=" + whinkleScore + ", elasticScore="
				+ elasticScore + ", moistureScore=" + moistureScore + ", acneScore=" + acneScore + ", averageScore="
				+ averageScore + ", payNo=" + payNo + ", payName=" + payName + ", price=" + price + "]";
	}

}
