package cn.wts.gym.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Coach {
	private int coach_id;
	private String coach_name;
	private String coach_no;
	private String coach_image;
	private String coach_gender;
	private String coach_grade;
	private String coach_phone;
	private String coach_email;
	private Date coach_entry;
	private Set<Course> courses =new HashSet<Course>();
	public int getCoach_id() {
		return coach_id;
	}
	public void setCoach_id(int coach_id) {
		this.coach_id = coach_id;
	}
	public String getCoach_name() {
		return coach_name;
	}
	public void setCoach_name(String coach_name) {
		this.coach_name = coach_name;
	}
	public String getCoach_no() {
		return coach_no;
	}
	public void setCoach_no(String coach_no) {
		this.coach_no = coach_no;
	}
	
	public String getCoach_image() {
		return coach_image;
	}
	public void setCoach_image(String coach_image) {
		this.coach_image = coach_image;
	}
	public String getCoach_gender() {
		return coach_gender;
	}
	public void setCoach_gender(String coach_gender) {
		this.coach_gender = coach_gender;
	}
	public String getCoach_grade() {
		return coach_grade;
	}
	public void setCoach_grade(String coach_grade) {
		this.coach_grade = coach_grade;
	}
	public String getCoach_phone() {
		return coach_phone;
	}
	public void setCoach_phone(String coach_phone) {
		this.coach_phone = coach_phone;
	}
	public String getCoach_email() {
		return coach_email;
	}
	public void setCoach_email(String coach_email) {
		this.coach_email = coach_email;
	}
	public Date getCoach_entry() {
		return coach_entry;
	}
	public void setCoach_entry(Date coach_entry) {
		this.coach_entry = coach_entry;
	}
	public Set<Course> getCourses() {
		return courses;
	}
	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
	@Override
	public String toString() {
		return "Coach [coach_id=" + coach_id + ", coach_name=" + coach_name + ", coach_no=" + coach_no
				+ ", coach_image=" + coach_image + ", coach_gender=" + coach_gender + ", coach_grade=" + coach_grade
				+ ", coach_phone=" + coach_phone + ", coach_email=" + coach_email + ", coach_entry=" + coach_entry
				+ ", courses=" + courses + "]";
	}
	
	
}
