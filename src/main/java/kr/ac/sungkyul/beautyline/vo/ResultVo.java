package kr.ac.sungkyul.beautyline.vo;

import java.util.Arrays;

public class ResultVo {
	
	private String url;
	private String src;
	private int[] scores;
	private Double average;
	private String[] names;
	
	public String[] getNames() {
		return names;
	}
	public void setNames(String[] names) {
		this.names = names;
	}
	public Double getAverage() {
		return average;
	}
	public void setAverage(Double average) {
		this.average = average;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSrc() {
		return src;
	}
	public int[] getScores() {
		return scores;
	}
	public void setScores(int[] scores) {
		this.scores = scores;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	
	@Override
	public String toString() {
		return "ResultVo [url=" + url + ", src=" + src + ", scores=" + Arrays.toString(scores) + ", average=" + average
				+ ", names=" + Arrays.toString(names) + "]";
	}
	
	

}
