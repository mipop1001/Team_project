package com.team.project.survey;

public interface SurveyService {

	int survey_member_number_select(int member_number);
	void surveyinsert(SurveyDTO sdto, int member_number);
	
}
