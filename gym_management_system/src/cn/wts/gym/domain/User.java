package cn.wts.gym.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private int user_id;
	private String username;
	private String password;
	private String name;
	private String gender;
	private Date birth;
	private String phone;
	private String identity;
	private String email;
	//一个对一
	private Card card;
	//一个用户可以选多个订单
	private Set<Orders> orders= new HashSet<Orders>();
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Card getCard() {
		return card;
	}
	public void setCard(Card card) {
		this.card = card;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", birth=" + birth + ", phone=" + phone + ", identity=" + identity + ", email="
				+ email + ", card=" + card + ", orders=" + orders + "]";
	}
	
	
	
	
	
}
