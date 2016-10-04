package kr.ac.sungkyul.beautyline.vo;

public class UserinfoVo {

	private Long no;
	private String name;
	private String id;
	private String password;
	private String email;
	private String address;
	private String phone;
	private Long agrEmail;
	private Long agrMessage;
	private String isAdmin;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getAgrEmail() {
		return agrEmail;
	}
	public void setAgrEmail(Long agrEmail) {
		this.agrEmail = agrEmail;
	}
	public Long getAgrMessage() {
		return agrMessage;
	}
	public void setAgrMessage(Long agrMessage) {
		this.agrMessage = agrMessage;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	@Override
	public String toString() {
		return "UserinfoVo [no=" + no + ", name=" + name + ", id=" + id + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", agrEmail=" + agrEmail + ", agrMessage=" + agrMessage
				+ ", isAdmin=" + isAdmin + "]";
	}
	
	
}
