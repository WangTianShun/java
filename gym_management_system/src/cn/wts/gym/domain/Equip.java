package cn.wts.gym.domain;

import java.util.Date;

public class Equip {
	private int equip_id;
	private String equip_no;
	private String equip_image;
	private String equip_name;
	private String equip_type;
	private int equip_count;
	private String equip_company;
	private Date equip_purchase;
	private String equip_state;
	public int getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(int equip_id) {
		this.equip_id = equip_id;
	}
	
	public String getEquip_no() {
		return equip_no;
	}
	public void setEquip_no(String equip_no) {
		this.equip_no = equip_no;
	}
	public String getEquip_image() {
		return equip_image;
	}
	public void setEquip_image(String equip_image) {
		this.equip_image = equip_image;
	}
	public String getEquip_name() {
		return equip_name;
	}
	public void setEquip_name(String equip_name) {
		this.equip_name = equip_name;
	}
	public String getEquip_type() {
		return equip_type;
	}
	public void setEquip_type(String equip_type) {
		this.equip_type = equip_type;
	}
	public int getEquip_count() {
		return equip_count;
	}
	public void setEquip_count(int equip_count) {
		this.equip_count = equip_count;
	}
	public String getEquip_company() {
		return equip_company;
	}
	public void setEquip_company(String equip_company) {
		this.equip_company = equip_company;
	}
	public Date getEquip_purchase() {
		return equip_purchase;
	}
	public void setEquip_purchase(Date equip_purchase) {
		this.equip_purchase = equip_purchase;
	}
	public String getEquip_state() {
		return equip_state;
	}
	public void setEquip_state(String equip_state) {
		this.equip_state = equip_state;
	}
	@Override
	public String toString() {
		return "Equip [equip_id=" + equip_id + ", equip_no=" + equip_no + ", equip_image=" + equip_image
				+ ", equip_name=" + equip_name + ", equip_type=" + equip_type + ", equip_count=" + equip_count
				+ ", equip_company=" + equip_company + ", equip_purchase=" + equip_purchase + ", equip_state="
				+ equip_state + "]";
	}
	
}
