package com.team.project.survey;

public class SurveyDTO {
	
	int survey_number;
	String survey_content;
	int survey_age;
	String survey_gender;
	public SurveyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SurveyDTO(int survey_number, String survey_content, int survey_age, String survey_gender) {
		super();
		this.survey_number = survey_number;
		this.survey_content = survey_content;
		this.survey_age = survey_age;
		this.survey_gender = survey_gender;
	}
	public int getSurvey_number() {
		return survey_number;
	}
	public void setSurvey_number(int survey_number) {
		this.survey_number = survey_number;
	}
	public String getSurvey_content() {
		return survey_content;
	}
	public void setSurvey_content(String survey_content) {
		this.survey_content = survey_content;
	}
	public int getSurvey_age() {
		return survey_age;
	}
	public void setSurvey_age(int survey_age) {
		this.survey_age = survey_age;
	}
	public String getSurvey_gender() {
		return survey_gender;
	}
	public void setSurvey_gender(String survey_gender) {
		this.survey_gender = survey_gender;
	}

}
