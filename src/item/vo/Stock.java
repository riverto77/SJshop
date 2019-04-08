package item.vo;

import java.sql.Date;

public class Stock {

	private String item_name;
	private int stock_num;
	private String item_code;
	private int stock_state;
	private int stock_amount;
	private Date stock_date; 
	private String id;
	
	
	public Stock() {
		
	}
	
	public Stock(String item_code, int stock_amount) {
		super();
		this.item_code = item_code;
		this.stock_amount = stock_amount;	
	}
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getStock_num() {
		return stock_num;
	}
	public void setStock_num(int stock_num) {
		this.stock_num = stock_num;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public int getStock_state() {
		return stock_state;
	}
	public void setStock_state(int stock_state) {
		this.stock_state = stock_state;
	}
	public int getStock_amount() {
		return stock_amount;
	}
	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}
	public Date getStock_date() {
		return stock_date;
	}
	public void setStock_date(Date stock_date) {
		this.stock_date = stock_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
