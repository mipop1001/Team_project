package com.team.project.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/customer_login")
	public String customer_login() {
		return "customer_login_form";
	}

	@RequestMapping(value = "/customer_join")
	public String customer_join() {
		return "customer_join_form";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public String emailcheck(HttpServletRequest request) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int emailcheck = ms.emailcheck(request.getParameter("email"));
		if(emailcheck == 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String idcheck(HttpServletRequest request) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int idcheck = ms.idcheck(request.getParameter("id"));
		if(idcheck == 0) {
			return "ok";
		} else {
			return "no";
		}
	}
}
