package com.team.project.survey;

public class SurveyDTO {
	
	int survey_number;
	String survey_age;
	String survey_gender;
	String survey_q1;
	String survey_q2;
	String survey_q3;
	String survey_q4;
	public SurveyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SurveyDTO(int survey_number, String survey_age, String survey_gender, String survey_q1, String survey_q2,
			String survey_q3, String survey_q4) {
		super();
		this.survey_number = survey_number;
		this.survey_age = survey_age;
		this.survey_gender = survey_gender;
		this.survey_q1 = survey_q1;
		this.survey_q2 = survey_q2;
		this.survey_q3 = survey_q3;
		this.survey_q4 = survey_q4;
	}
	public int getSurvey_number() {
		return survey_number;
	}
	public void setSurvey_number(int survey_number) {
		this.survey_number = survey_number;
	}
	public String getSurvey_age() {
		return survey_age;
	}
	public void setSurvey_age(String survey_age) {
		this.survey_age = survey_age;
	}
	public String getSurvey_gender() {
		return survey_gender;
	}
	public void setSurvey_gender(String survey_gender) {
		this.survey_gender = survey_gender;
	}
	public String getSurvey_q1() {
		return survey_q1;
	}
	public void setSurvey_q1(String survey_q1) {
		this.survey_q1 = survey_q1;
	}
	public String getSurvey_q2() {
		return survey_q2;
	}
	public void setSurvey_q2(String survey_q2) {
		this.survey_q2 = survey_q2;
	}
	public String getSurvey_q3() {
		return survey_q3;
	}
	public void setSurvey_q3(String survey_q3) {
		this.survey_q3 = survey_q3;
	}
	public String getSurvey_q4() {
		return survey_q4;
	}
	public void setSurvey_q4(String survey_q4) {
		this.survey_q4 = survey_q4;
	}

}