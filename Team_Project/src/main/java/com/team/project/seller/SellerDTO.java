package com.team.project.seller;

public class SellerDTO {

	int seller_number,seller_role,seller_buy_point;
	
	String seller_id,seller_password,seller_name,
	seller_phone_number,seller_email,seller_company_number,
	seller_company_address;

	public SellerDTO() {
		super();
	}

	public int getSeller_buy_point() {
		return seller_buy_point;
	}

	public void setSeller_buy_point(int seller_buy_point) {
		this.seller_buy_point = seller_buy_point;
	}

	public void setSeller_company_address(String seller_company_address) {
		this.seller_company_address = seller_company_address;
	}

	public int getSeller_number() {
		return seller_number;
	}

	public void setSeller_number(int seller_number) {
		this.seller_number = seller_number;
	}

	public int getSeller_role() {
		return seller_role;
	}

	public void setSeller_role(int seller_role) {
		this.seller_role = seller_role;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getSeller_password() {
		return seller_password;
	}

	public void setSeller_password(String seller_password) {
		this.seller_password = seller_password;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_phone_number() {
		return seller_phone_number;
	}

	public void setSeller_phone_number(String seller_phone_number) {
		this.seller_phone_number = seller_phone_number;
	}

	public String getSeller_email() {
		return seller_email;
	}

	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}

	public String getSeller_company_number() {
		return seller_company_number;
	}

	public void setSeller_company_number(String seller_company_number) {
		this.seller_company_number = seller_company_number;
	}

	public String getSeller_company_address() {
		return seller_company_address;
	}

	public void setSeller_compnay_address(String seller_company_address) {
		this.seller_company_address = seller_company_address;
	}
	
	
	
}
