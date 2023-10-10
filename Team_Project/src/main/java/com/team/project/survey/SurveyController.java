package com.team.project.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.member.MemberDTO;
import com.team.project.member.MemberService;

@Controller
public class SurveyController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/survey_input")
	public String survey_input() {
		return "survey_input_form";
	}
	
	@RequestMapping(value = "/survey_input_save",method = RequestMethod.POST)
	public String survey_input_save(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		MemberDTO memberDTO = (MemberDTO) hs.getAttribute("memberDTO");
		SurveyService ss = sqlSession.getMapper(SurveyService.class);
		int surver_member_check = ss.survey_member_number_select(memberDTO.getMember_number());
		if(surver_member_check == 1) {
			return"survey_error";
		} else {
			String cnp = request.getParameter("campingNumberPeople");
			String ct = request.getParameter("campingType");
			String cc = request.getParameter("campingCareer");
			String cs = request.getParameter("campingSite");
			String cl = request.getParameter("campingLink");
			ss.surveyinsert2(cnp,ct,cc,cs,cl,memberDTO.getMember_number());
			MemberService ms = sqlSession.getMapper(MemberService.class);
			ms.member_point_up(memberDTO.getMember_number(),memberDTO.getMember_email());
			return "redirect:/user_page";
		}
		
	}

}
