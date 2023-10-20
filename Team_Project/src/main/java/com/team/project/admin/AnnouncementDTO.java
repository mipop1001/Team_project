package com.team.project.admin;

public class AnnouncementDTO {

	int noticedoc_number; // 게시글 번호
	String title; // 게시글 제목
	String writer; // 게시글 작성자
	String noticedoc; // 게시글 내용
	String announcement_date; // 게시글 작성 일자

	public AnnouncementDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AnnouncementDTO(int noticedoc_number, String title, String writer, String noticedoc,
			String announcement_date) {
		super();
		this.noticedoc_number = noticedoc_number;
		this.title = title;
		this.writer = writer;
		this.noticedoc = noticedoc;
		this.announcement_date = announcement_date;
	}

	public int getNoticedoc_number() {
		return noticedoc_number;
	}

	public void setNoticedoc_number(int noticedoc_number) {
		this.noticedoc_number = noticedoc_number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNoticedoc() {
		return noticedoc;
	}

	public void setNoticedoc(String noticedoc) {
		this.noticedoc = noticedoc;
	}

	public String getAnnouncement_date() {
		return announcement_date;
	}

	public void setAnnouncement_date(String announcement_date) {
		this.announcement_date = announcement_date;
	}

}
