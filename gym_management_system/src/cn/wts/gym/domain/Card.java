package cn.wts.gym.domain;

import java.util.Date;

public class Card {
	private int card_id;
	private String card_no;
	private String card_grade;
	private Date card_begin;
	private Date card_end;
	private double card_account;
	//关联另一个类
	private User user;
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_grade() {
		return card_grade;
	}
	public void setCard_grade(String card_grade) {
		this.card_grade = card_grade;
	}
	public Date getCard_begin() {
		return card_begin;
	}
	public void setCard_begin(Date card_begin) {
		this.card_begin = card_begin;
	}
	public Date getCard_end() {
		return card_end;
	}
	public void setCard_end(Date card_end) {
		this.card_end = card_end;
	}
	public double getCard_account() {
		return card_account;
	}
	public void setCard_account(double card_account) {
		this.card_account = card_account;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Card [card_id=" + card_id + ", card_no=" + card_no + ", card_grade=" + card_grade + ", card_begin="
				+ card_begin + ", card_end=" + card_end + ", card_account=" + card_account + ", user_id=" + user + "]";
	}
	
	
}
