package com.team.project.board;

public class BoardCommentDTO {

	String member_id, comment_id, comment_date, comment_text;
	int community_board_number, comment_number;

	public BoardCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public int getCommunity_board_number() {
		return community_board_number;
	}

	public void setCommunity_board_number(int community_board_number) {
		this.community_board_number = community_board_number;
	}

	public int getComment_number() {
		return comment_number;
	}

	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}

}
