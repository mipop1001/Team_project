package com.team.project.survey;

public interface SurveyService {

	int survey_member_number_select(int member_number);
	void surveyinsert2(String cnp, String ct, String cc, String cs, String cl, int member_number);
	
}
