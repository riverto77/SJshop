package order.vo;

import java.util.Date;

public class Order {

	private int order_num;
	private int order_count;
	private Date order_date;
	private String order_state;
	private String member_id;
	
	public Order(int order_num, int order_count, Date order_date, String order_state, String member_id) {
		this.order_num = order_num;
		this.order_count = order_count;
		this.order_date = order_date;
		this.order_state = order_state;
		this.member_id = member_id;
	}
	
	public Order(String member_id) {
		// TODO Auto-generated constructor stub
		this.member_id = member_id;
	}

	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
