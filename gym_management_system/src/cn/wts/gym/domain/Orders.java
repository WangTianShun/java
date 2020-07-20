package cn.wts.gym.domain;

import java.util.Date;

public class Orders {
	private int orders_id;
	private Date orders_time;
	private double orders_money;
	private String orders_state;
	private User user;
	private Course course;
	
	public int getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}
	public Date getOrders_time() {
		return orders_time;
	}
	public void setOrders_time(Date orders_time) {
		this.orders_time = orders_time;
	}
	public double getOrders_money() {
		return orders_money;
	}
	public void setOrders_money(double orders_money) {
		this.orders_money = orders_money;
	}
	public String getOrders_state() {
		return orders_state;
	}
	public void setOrders_state(String orders_state) {
		this.orders_state = orders_state;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	
}
