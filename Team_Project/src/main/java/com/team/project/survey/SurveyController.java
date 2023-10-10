package com.team.project.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.member.MemberDTO;

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
		System.out.println(surver_member_check);
		if(surver_member_check == 1) {
			System.out.println("DB저장 실패");
			return"";
		} else {
			SurveyDTO sdto = new SurveyDTO();
			sdto.setCampingNumberPeople(request.getParameter("campingNumberPeople"));
			sdto.setCampingType(request.getParameter("campingType"));
			sdto.setCampingCareer(request.getParameter("campingCareer"));
			sdto.setCampingSite(request.getParameter("campingSite"));
			sdto.setCampingLink(request.getParameter("campingLink"));
			ss.surveyinsert(sdto,memberDTO.getMember_number());
			System.out.println("DB저장 완료");
			return "user_page";
		}
		
	}

}
