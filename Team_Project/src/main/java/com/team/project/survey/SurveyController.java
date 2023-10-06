package com.team.project.survey;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SurveyController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/survey_input")
	public String survey_input() {
		return "survey_input_form";
	}
	
	@RequestMapping(value = "/survey_input_save",method = RequestMethod.POST)
	public String survey_input_save(HttpServletRequest requset)
	{
		
		String survey_age=requset.getParameter("survey_age");
		String survey_gender=requset.getParameter("survey_gender");
		String survey_q1=requset.getParameter("survey_q1");
		String survey_q2=requset.getParameter("survey_q2");
		String survey_q3=requset.getParameter("survey_q3");
		String survey_q4=requset.getParameter("survey_q4");
		
		SurveyService ss= sqlSession.getMapper(SurveyService.class);
		ss.survey_input_save(survey_age, survey_gender,survey_q1,survey_q2,survey_q3,survey_q4);
		return "user_page";
	}

}
