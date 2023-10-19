package com.team.project.order;

public class OrderDTO {

	int sell_list_number,seller_number,member_number,product_number,product_sell_amount,product_price,product_total_price;
	String delivery_status,product_name,seller_name,product_sell_date,member_name,member_address;
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getMember_address() {
		return member_address;
	}


	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}


	public String getProduct_sell_date() {
		return product_sell_date;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public void setProduct_sell_date(String product_sell_date) {
		this.product_sell_date = product_sell_date;
	}


	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public int getSell_list_number() {
		return sell_list_number;
	}
	public void setSell_list_number(int sell_list_number) {
		this.sell_list_number = sell_list_number;
	}
	public int getSeller_number() {
		return seller_number;
	}
	public void setSeller_number(int seller_number) {
		this.seller_number = seller_number;
	}
	public int getMember_number() {
		return member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public int getProduct_sell_amount() {
		return product_sell_amount;
	}
	public void setProduct_sell_amount(int product_sell_amount) {
		this.product_sell_amount = product_sell_amount;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_total_price() {
		return product_total_price;
	}
	public void setProduct_total_price(int product_total_price) {
		this.product_total_price = product_total_price;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	
	
	
	
}
