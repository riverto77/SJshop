package order.vo;

import java.util.*;

public class OrderDetail {

	private int order_num;
	private String item_code;
	private String item_name;
	private String item_image;
	private int price;
	private int amount;
	private String id;
	private Date date;
	private int stock;
	private int qty;
	
	public OrderDetail(String item_code, String item_name, int price, String item_image, int amount, Date date) {
	}
	
	public OrderDetail(int order_num, String item_code, String item_name, int price, int amount, String item_image, String id) {
		// TODO Auto-generated constructor stub
		super();
		this.order_num = order_num;
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.amount = amount;
		this.item_image = item_image;
		this.id = id;
	}
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public Date getdate() {
		return date;
	}

	public void setdate(Date date) {
		this.date = date;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	

}
