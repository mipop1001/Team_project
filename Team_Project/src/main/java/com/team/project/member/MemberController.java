package com.team.project.member;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.admin.AnnouncementDTO;
import com.team.project.admin.AnnouncementService;

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

	@RequestMapping(value = "/customer_qna")
	public String customer_qna() {
		return "customer_qna_form";
	}

	// 사용자 로그인
	@RequestMapping(value = "/customer_login_check", method = { RequestMethod.GET, RequestMethod.POST })
	public String customer_login_check(HttpServletRequest request, Model mo) {
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO memberDTO = ms.login_check(login_id, login_pw);
		if (memberDTO != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("loginstatus", true);
			hs.setAttribute("memberDTO", memberDTO);
			hs.setMaxInactiveInterval(3000);
			return "redirect:/user_page";
		} else {
			mo.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "customer_login_form";
		}
	}

	@RequestMapping(value = "/checkLoginStatus", method = { RequestMethod.GET, RequestMethod.POST })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginstatus") != null) {
			response.getWriter().write("loggedIn");
		} else {
			// 사용자가 로그인하지 않은 상태
			response.getWriter().write("notLoggedIn");
		}
	}

	// 사용자 로그아웃 기능
	@RequestMapping(value = "/customer_logout")
	public String customer_logout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("loginstatus");
		hs.removeAttribute("memberDTO");
		hs.setAttribute("loginstatus", false);
		hs.invalidate(); // 세션 무효화
		return "redirect:/user_page";
	}

	// 사용자 회원가입 저장
	@RequestMapping(value = "/customer_join_save")
	public String customer_join_save(HttpServletRequest request) {
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(request.getParameter("member_id"));
		memberDTO.setMember_password(request.getParameter("member_password"));
		memberDTO.setMember_name(request.getParameter("member_name"));
		String jumin = request.getParameter("member_personal_number");
		memberDTO.setMember_personal_number(jumin);
		if (jumin.substring(6, 7).equals("1") || jumin.substring(6, 7).equals("3")) {
			memberDTO.setMember_gender("남자");
		} else {
			memberDTO.setMember_gender("여자");
		}
		if (jumin.substring(6, 7).equals("1") || jumin.substring(6, 7).equals("2")) {
			memberDTO.setMember_age(year - (1900 + Integer.parseInt(jumin.substring(0, 2))));
		} else {
			memberDTO.setMember_age(year - (2000 + Integer.parseInt(jumin.substring(0, 2))));
		}
		memberDTO.setMember_phone_number(request.getParameter("member_phone_number"));
		memberDTO.setMember_address(request.getParameter("member_address"));
		memberDTO.setMember_email(request.getParameter("member_email"));
		memberDTO.setMember_birthday(request.getParameter("member_birthday"));
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.customer_join_save(memberDTO);
		return "redirect:/user_page";
	}

	// 사용자 아이디 찾기 페이지
	@RequestMapping(value = "/customer_find_id")
	public String customer_find_id() {
		return "customer_find_id_form";
	}

	// 사용자 아이디 찾기 기능
	@RequestMapping(value = "/customer_id_search", method = { RequestMethod.GET, RequestMethod.POST })
	public String customer_id_search(HttpServletRequest request, Model mo) {
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO dto = ms.member_id_search(member_name, member_email);
		if (dto != null) {
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			list.add(dto);
			mo.addAttribute("list", list);
			return "customer_id_search_form";
		} else {
			return "redirect:/customer_find_id";
		}
	}

	// 사용자 비밀번호 찾기 페이지
	@RequestMapping(value = "/customer_find_pw")
	public String customer_find_pw() {
		return "customer_find_pw_form";
	}

	// 사용자 비밀번호 찾기 기능
	@RequestMapping(value = "/customer_pw_search", method = { RequestMethod.GET, RequestMethod.POST })
	public String customer_pw_search(HttpServletRequest request, Model mo) {
		String member_id = request.getParameter("member_id");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		MemberDTO dto = ms.member_pw_search(member_id, member_name, member_email);
		if (dto != null) {
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			list.add(dto);
			mo.addAttribute("list", list);
			return "customer_pw_search_form";
		} else {
			return "redirect:/customer_find_pw";
		}
	}

	// 사용자 마이페이지
	@RequestMapping(value = "/customer_info")
	public String customer_info(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		mo.addAttribute("dto", dto);
		return "customer_info_form";
	}

	// ajax
	@ResponseBody
	@RequestMapping(value = "/customer_info_exit")
	public String customer_info_exit(HttpServletRequest request) {
		String member_password = request.getParameter("password");
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		boolean a = ms.customer_info_exit(dto.getMember_id(), dto.getMember_name(), dto.getMember_email(),
				member_password);

		if (a == true) {
			hs.removeAttribute("loginstatus");
			hs.removeAttribute("memberDTO");
			return "ok";
		} else {
			return "no";
		}
	}

	// 사용자 회원가입 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public String emailcheck(HttpServletRequest request) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int emailcheck = ms.emailcheck(request.getParameter("email"));
		if (emailcheck == 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	// 사용자 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String idcheck(HttpServletRequest request) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int idcheck = ms.idcheck(request.getParameter("id"));
		if (idcheck == 0) {
			return "ok";
		} else {
			return "no";
		}
	}

	// 사용자 전화번호 변경
	@ResponseBody
	@RequestMapping(value = "/customer_phone_number_modify", method = RequestMethod.POST)
	public String customer_phone_number_modify(HttpServletRequest request, Model mo) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		boolean a = ms.customer_phone_number_modify(request.getParameter("newPhoneNumber"), dto.getMember_id(),
				dto.getMember_email());
		if (a == true) {
			// 전화번호가 성공적으로 업데이트되면 업데이트된 전화번호 값을 클라이언트에게 응답으로 전달
			MemberDTO newdto = ms.newcustomer(dto.getMember_id(), dto.getMember_name(), dto.getMember_email());
			hs.setAttribute("memberDTO", newdto);
			mo.addAttribute("dto", newdto);
			return "ok";
		} else {
			return "no";
		}
	}

	// 사용자 주소 변경
	@ResponseBody
	@RequestMapping(value = "/customer_address_modify", method = RequestMethod.POST)
	public String customer_address_modify(HttpServletRequest request, Model mo) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		boolean a = ms.customer_address_modify(request.getParameter("newAddress"), dto.getMember_id(),
				dto.getMember_email());
		if (a == true) {
			// 주소가 성공적으로 업데이트되면 업데이트된 주소 값을 클라이언트에게 응답으로 전달
			MemberDTO newdto = ms.newcustomer(dto.getMember_id(), dto.getMember_name(), dto.getMember_email());
			hs.setAttribute("memberDTO", newdto);
			mo.addAttribute("dto", newdto);
			return "ok";
		} else {
			return "no";
		}
	}

	// 사용자 패스워드 변경
	@ResponseBody
	@RequestMapping(value = "/customer_password_modify", method = RequestMethod.POST)
	public String customer_password_modify(HttpServletRequest request, Model mo) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		boolean a = ms.customer_password_modify(request.getParameter("newPassword"), dto.getMember_id(),
				dto.getMember_email());
		if (a == true) {
			// 전화번호가 성공적으로 업데이트되면 업데이트된 전화번호 값을 클라이언트에게 응답으로 전달
			MemberDTO newdto = ms.newcustomer(dto.getMember_id(), dto.getMember_name(), dto.getMember_email());
			hs.setAttribute("memberDTO", newdto);
			mo.addAttribute("dto", newdto);
			return "ok";
		} else {
			return "no";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/customer_point_update", method = RequestMethod.POST)
	public String customer_point_update(HttpServletRequest request, Model mo) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		boolean a = ms.customer_point_update(dto.getMember_id(), dto.getMember_email());
		if (a == true) {
			MemberDTO newdto = ms.newcustomer(dto.getMember_id(), dto.getMember_name(), dto.getMember_email());
			hs.setAttribute("memberDTO", newdto);
			mo.addAttribute("dto", newdto);
			return "ok";
		} else {
			return "no";
		}
	}

	// 포인트 관리 페이지
	@RequestMapping(value = "/customer_point_management")
	public String customer_point_management(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> lsit = ms.point_management(dto.getMember_number());
		mo.addAttribute("list", lsit);
		return "customer_point_management_form";
	}

	// 포인트 충전 누르면 포인트 충전
	@RequestMapping(value = "/pointCharge", method = { RequestMethod.POST, RequestMethod.GET })
	public String pointCharge(HttpServletRequest request, Model mo) {
		String cashStr = request.getParameter("cash").replaceAll("[^\\d]", ""); // 비숫자 문자(쉼표 등) 제거
		int point = Integer.parseInt(cashStr);
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		String member_id = dto.getMember_id();
		String member_name = dto.getMember_name();
		String member_email = dto.getMember_email();

		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.pointcharge(point, member_id, member_name, member_email);
		return "redirect:/customer_point_management";
	}
	
	//공지사항 리스트
	@RequestMapping(value = "/Announcement_list_go")
	public String Announcement_list_go(Model mo) {
		AnnouncementService as = sqlSession.getMapper(AnnouncementService.class);
		ArrayList<AnnouncementDTO> announcement_list = as.announcement_list();
		mo.addAttribute("announcement_list", announcement_list);
		return "Announcement_list_view";
	}
}
