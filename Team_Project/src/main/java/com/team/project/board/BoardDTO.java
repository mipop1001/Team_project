package com.team.project.board;

public class BoardDTO {

	int community_board_number;
	String community_board_title;
	String community_board_content;
	String community_board_date;
	String community_board_location;
	int community_board_grade;
	String community_board_sum_image;
	String community_board_detail_image1;
	String community_board_detail_image2;
	String community_board_detail_image3;
	int member_number;

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int community_board_number, String community_board_title, String community_board_content,
			String community_board_date, String community_board_location, int community_board_grade,
			String community_board_sum_image, String community_board_detail_image1,
			String community_board_detail_image2, String community_board_detail_image3) {
		super();
		this.community_board_number = community_board_number;
		this.community_board_title = community_board_title;
		this.community_board_content = community_board_content;
		this.community_board_date = community_board_date;
		this.community_board_location = community_board_location;
		this.community_board_grade = community_board_grade;
		this.community_board_sum_image = community_board_sum_image;
		this.community_board_detail_image1 = community_board_detail_image1;
		this.community_board_detail_image2 = community_board_detail_image2;
		this.community_board_detail_image3 = community_board_detail_image3;
	}

	public int getCommunity_board_number() {
		return community_board_number;
	}

	public void setCommunity_board_number(int community_board_number) {
		this.community_board_number = community_board_number;
	}

	public String getCommunity_board_title() {
		return community_board_title;
	}

	public void setCommunity_board_title(String community_board_title) {
		this.community_board_title = community_board_title;
	}

	public String getCommunity_board_content() {
		return community_board_content;
	}

	public void setCommunity_board_content(String community_board_content) {
		this.community_board_content = community_board_content;
	}

	public String getCommunity_board_date() {
		return community_board_date;
	}

	public void setCommunity_board_date(String community_board_date) {
		this.community_board_date = community_board_date;
	}

	public String getCommunity_board_location() {
		return community_board_location;
	}

	public void setCommunity_board_location(String community_board_location) {
		this.community_board_location = community_board_location;
	}

	public int getCommunity_board_grade() {
		return community_board_grade;
	}

	public void setCommunity_board_grade(int community_board_grade) {
		this.community_board_grade = community_board_grade;
	}

	public String getCommunity_board_sum_image() {
		return community_board_sum_image;
	}

	public void setCommunity_board_sum_image(String community_board_sum_image) {
		this.community_board_sum_image = community_board_sum_image;
	}

	public String getCommunity_board_detail_image1() {
		return community_board_detail_image1;
	}

	public void setCommunity_board_detail_image1(String community_board_detail_image1) {
		this.community_board_detail_image1 = community_board_detail_image1;
	}

	public String getCommunity_board_detail_image2() {
		return community_board_detail_image2;
	}

	public void setCommunity_board_detail_image2(String community_board_detail_image2) {
		this.community_board_detail_image2 = community_board_detail_image2;
	}

	public String getCommunity_board_detail_image3() {
		return community_board_detail_image3;
	}

	public void setCommunity_board_detail_image3(String community_board_detail_image3) {
		this.community_board_detail_image3 = community_board_detail_image3;
	}

	public int getMember_number() {
		return member_number;
	}

	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}

}
