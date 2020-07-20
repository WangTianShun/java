package cn.wts.gym.domain;

import java.util.HashSet;
import java.util.Set;

public class Course {
	private int course_id;
	private String course_no;
	private String course_name;
	private String course_type;
	private double course_cost;
	private String course_time;
	private int course_count;
	private String course_info;
	private String course_image;
	private Coach coach;
	//一个课程对应多个订单
	private Set<Orders> orders =new HashSet<Orders>();
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	
	public String getCourse_no() {
		return course_no;
	}
	public void setCourse_no(String course_no) {
		this.course_no = course_no;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_type() {
		return course_type;
	}
	public void setCourse_type(String course_type) {
		this.course_type = course_type;
	}
	public double getCourse_cost() {
		return course_cost;
	}
	public void setCourse_cost(double course_cost) {
		this.course_cost = course_cost;
	}
	public String getCourse_time() {
		return course_time;
	}
	public void setCourse_time(String course_time) {
		this.course_time = course_time;
	}
	public int getCourse_count() {
		return course_count;
	}
	public void setCourse_count(int course_count) {
		this.course_count = course_count;
	}
	public String getCourse_info() {
		return course_info;
	}
	public void setCourse_info(String course_info) {
		this.course_info = course_info;
	}
	public Coach getCoach() {
		return coach;
	}
	public void setCoach(Coach coach) {
		this.coach = coach;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	public String getCourse_image() {
		return course_image;
	}
	public void setCourse_image(String course_image) {
		this.course_image = course_image;
	}
	@Override
	public String toString() {
		return "Course [course_id=" + course_id + ", course_no=" + course_no + ", course_name=" + course_name
				+ ", course_type=" + course_type + ", course_cost=" + course_cost + ", course_time=" + course_time
				+ ", course_count=" + course_count + ", course_info=" + course_info + ", course_image=" + course_image
				+ ", coach=" + coach + ", orders=" + orders + "]";
	}
	
	
}
