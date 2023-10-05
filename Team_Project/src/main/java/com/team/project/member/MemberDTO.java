package com.team.project.member;

public class MemberDTO {
	String member_id;
	String member_password;
	int member_number;
	String member_name;
	String member_personal_number;
	int member_age;
	String member_gender;
	String member_phone_number;
	String member_address;
	String member_email;
	String member_birthday;
	int member_point;
	int member_buy;
	int member_role;

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String member_id, String member_password, int member_number, String member_name,
			String member_personal_number, int member_age, String member_gender, String member_phone_number,
			String member_address, String member_email, String member_birthday, int member_point, int member_buy,
			int member_role) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_number = member_number;
		this.member_name = member_name;
		this.member_personal_number = member_personal_number;
		this.member_age = member_age;
		this.member_gender = member_gender;
		this.member_phone_number = member_phone_number;
		this.member_address = member_address;
		this.member_email = member_email;
		this.member_birthday = member_birthday;
		this.member_point = member_point;
		this.member_buy = member_buy;
		this.member_role = member_role;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public int getMember_number() {
		return member_number;
	}

	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_personal_number() {
		return member_personal_number;
	}

	public void setMember_personal_number(String member_personal_number) {
		this.member_personal_number = member_personal_number;
	}

	public int getMember_age() {
		return member_age;
	}

	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_phone_number() {
		return member_phone_number;
	}

	public void setMember_phone_number(String member_phone_number) {
		this.member_phone_number = member_phone_number;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public int getMember_buy() {
		return member_buy;
	}

	public void setMember_buy(int member_buy) {
		this.member_buy = member_buy;
	}

	public int getMember_role() {
		return member_role;
	}

	public void setMember_role(int member_role) {
		this.member_role = member_role;
	}

}