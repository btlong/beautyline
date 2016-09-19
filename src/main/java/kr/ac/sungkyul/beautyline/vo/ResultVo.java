package kr.ac.sungkyul.beautyline.vo;

public class ResultVo {
	
	private String url;
	private String src;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	
	@Override
	public String toString() {
		return "ResultVo [url=" + url + ", src=" + src + "]";
	}
	
	

}
