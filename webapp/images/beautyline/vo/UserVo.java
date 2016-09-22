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

	private String zipCode;
	private String address1;
	private String address2;
	private String email1;
	private String email2;
	
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
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	@Override
	public String toString() {
		return "UserVo [no=" + no + ", name=" + name + ", id=" + id + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", ageEmail=" + ageEmail + ", ageMessage=" + ageMessage
				+ ", isAdmin=" + isAdmin + ", zipCode=" + zipCode + ", address1=" + address1 + ", address2=" + address2
				+ ", email1=" + email1 + ", email2=" + email2 + "]";
	}

	

	
}
