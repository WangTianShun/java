package cn.wts.gym.domain;

public class Reception {
	private int reception_id;
	private String username;
	private String password;
	private String name;
	private String gender;
	private String phone;
	
	public int getReception_id() {
		return reception_id;
	}
	public void setReception_id(int reception_id) {
		this.reception_id = reception_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Reception [reception_id=" + reception_id + ", username=" + username + ", password=" + password
				+ ", name=" + name + ", gender=" + gender + ", phone=" + phone + "]";
	}
}
