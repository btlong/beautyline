package kr.ac.sungkyul.beautyline.vo;

public class RecommendVo {
	
	private String src;
	private String url;
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "recommendVo [src=" + src + ", url=" + url + "]";
	}
	
	

}
