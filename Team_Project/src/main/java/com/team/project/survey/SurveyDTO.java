package com.team.project.survey;

public class SurveyDTO {

	int memberNumber;
	int memberid;
	String campingNumberPeople;
	String campingType;
	String campingCareer;
	String campingSite;
	String campingLink;

	public SurveyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SurveyDTO(int memberNumber, int memberid, String campingNumberPeople, String campingType,
			String campingCareer, String campingSite, String campingLink) {
		super();
		this.memberNumber = memberNumber;
		this.memberid = memberid;
		this.campingNumberPeople = campingNumberPeople;
		this.campingType = campingType;
		this.campingCareer = campingCareer;
		this.campingSite = campingSite;
		this.campingLink = campingLink;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getCampingNumberPeople() {
		return campingNumberPeople;
	}

	public void setCampingNumberPeople(String campingNumberPeople) {
		this.campingNumberPeople = campingNumberPeople;
	}

	public String getCampingType() {
		return campingType;
	}

	public void setCampingType(String campingType) {
		this.campingType = campingType;
	}

	public String getCampingCareer() {
		return campingCareer;
	}

	public void setCampingCareer(String campingCareer) {
		this.campingCareer = campingCareer;
	}

	public String getCampingSite() {
		return campingSite;
	}

	public void setCampingSite(String campingSite) {
		this.campingSite = campingSite;
	}

	public String getCampingLink() {
		return campingLink;
	}

	public void setCampingLink(String campingLink) {
		this.campingLink = campingLink;
	}

}