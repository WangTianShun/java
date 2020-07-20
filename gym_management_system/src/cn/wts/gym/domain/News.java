package cn.wts.gym.domain;

import java.util.Date;

public class News {
	private int news_id;
	private String news_title;
	private Date news_time;
	private String news_content;
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public Date getNews_time() {
		return news_time;
	}
	public void setNews_time(Date news_time) {
		this.news_time = news_time;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	@Override
	public String toString() {
		return "News [news_id=" + news_id + ", news_title=" + news_title + ", news_time=" + news_time
				+ ", news_content=" + news_content + "]";
	}
	
	
}
