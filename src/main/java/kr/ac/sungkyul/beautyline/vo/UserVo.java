package kr.ac.sungkyul.beautyline.vo;

public class UserVo {
	private Long no;
	private String name;
	private String id;
	private String password;
	private String email;
	private String address;
	private String phone;
	private Long ageEmail;
	private Long ageMessage;
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
	public Long getAgeEmail() {
		return ageEmail;
	}
	public void setAgeEmail(Long ageEmail) {
		this.ageEmail = ageEmail;
	}
	public Long getAgeMessage() {
		return ageMessage;
	}
	public void setAgeMessage(Long ageMessage) {
		this.ageMessage = ageMessage;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "UserVo [no=" + no + ", name=" + name + ", id=" + id + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", ageEmail=" + ageEmail + ", ageMessage=" + ageMessage
				+ ", isAdmin=" + isAdmin + "]";
	}


	
}
