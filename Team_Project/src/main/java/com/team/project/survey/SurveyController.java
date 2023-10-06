package com.team.project.survey;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SurveyController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/survey_input")
	public String survey_input() {
		return "survey_input_form";
	}

}
