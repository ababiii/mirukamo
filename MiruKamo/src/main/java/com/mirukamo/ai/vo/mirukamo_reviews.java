package com.mirukamo.ai.vo;


/*수강후기 클레스*/
public class mirukamo_reviews {

	int num;
	String customer_id;
	String review_date;
	int hits;
	String title;
	String content;
	
	public mirukamo_reviews() {
		super();
	}
	
	public mirukamo_reviews(int num, String customer_id, String review_date, int hits, String title, String content) {
		super();
		this.num = num;
		this.customer_id = customer_id;
		this.review_date = review_date;
		this.hits = hits;
		this.title = title;
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "mirukamo_reviews [num=" + num + ", customer_id=" + customer_id + ", review_date=" + review_date
				+ ", hits=" + hits + ", title=" + title + ", content=" + content + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}





	
}