package com.team.project.inquiry;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class InquiryController {

	@Autowired
	SqlSession sqlSession;
	
	static String inquiry_images_path="C:\\Users\\3-29\\git\\Team_Project\\Team_Project\\src\\main\\webapp\\inquiry_images";
	
	@RequestMapping(value = "/customer_inquiry_form")
	public String member_inquiry_form(HttpServletRequest request,Model mo)
	{
		HttpSession hs = request.getSession();

		if(hs.getAttribute("memberDTO") != null)
		{

		return "customer_inquiry_form";
		}
		else
		{
			mo.addAttribute("msg","로그인 세션이 만료 되었습니다.");
			return "customer_login_form";
		}
	}
	
	@RequestMapping(value = "/seller_inquiry_form")
	public String seller_inquiry_form(HttpServletRequest request,Model mo)
	{
		HttpSession hs = request.getSession();

		if(hs.getAttribute("sellerDTO") != null)
		{

		return "seller_inquiry_form";
		}
		else
		{
			mo.addAttribute("msg","로그인 세션이 만료 되었습니다.");
			return "seller_login";
		}
	}
	
	@RequestMapping(value = "/customer_inquiry_input_save",method=RequestMethod.POST)
	public String customer_inquiry_input_save(MultipartHttpServletRequest mul,Model mo) throws IllegalStateException, IOException
	{
		String inquiry_title = mul.getParameter("inquiry_title");
		String inquiry_content = mul.getParameter("inquiry_content");
		int member_number = Integer.parseInt(mul.getParameter("member_number"));
		String inquiry_writer_name = mul.getParameter("member_name");
		
		
		MultipartFile mpf1 = mul.getFile("inquiry_image1");
		String inquiry_image1 = mpf1.getOriginalFilename();
		
		MultipartFile mpf2 = mul.getFile("inquiry_image2");
		String inquiry_image2 = mpf2.getOriginalFilename();
		
		MultipartFile mpf3 = mul.getFile("inquiry_image3");
		String inquiry_image3 = mpf3.getOriginalFilename();
		
		MultipartFile mpf4 = mul.getFile("inquiry_image4");
		String inquiry_image4 = mpf4.getOriginalFilename();
		
		String inquiry_status = "대기 중";
		String inquiry_writer_type = "구매자";
		InquiryDTO dto = new InquiryDTO();
		dto.setInquiry_title(inquiry_title);
		dto.setMember_number(member_number);
		dto.setInquiry_writer_name(inquiry_writer_name);
		dto.setInquiry_content(inquiry_content);
		dto.setInquiry_image1(inquiry_image1);
		dto.setInquiry_image2(inquiry_image2);
		dto.setInquiry_image3(inquiry_image3);
		dto.setInquiry_image4(inquiry_image4);
		dto.setInquiry_status(inquiry_status);
		dto.setInquiry_writer_type(inquiry_writer_type);
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		is.customer_inquiry_input_save(dto);
		
		mpf1.transferTo(new File(inquiry_images_path+"\\"+inquiry_image1));
		mpf2.transferTo(new File(inquiry_images_path+"\\"+inquiry_image2));
		mpf3.transferTo(new File(inquiry_images_path+"\\"+inquiry_image3));
		mpf4.transferTo(new File(inquiry_images_path+"\\"+inquiry_image4));
		
		return "redirect:/customer_inquiry_board";
	}
	@RequestMapping(value = "/inquiry_answer")
	public String inquiry_answer(HttpServletRequest request,Model mo)
	{
		HttpSession hs = request.getSession();
		int inquiry_number= Integer.parseInt(request.getParameter("inquiry_number"));
		System.out.println(inquiry_number);
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		InquiryDTO dto = is.inquiry_answer(inquiry_number);
		mo.addAttribute("inquiryDTO", dto);
		if(hs.getAttribute("memberDTO") != null)
		{
		return "inquiry_answer";
		}
		else
		{
			mo.addAttribute("msg","로그인 세션이 만료 되었습니다.");
			return "customer_login_form";
		}
	}
	@RequestMapping(value = "/admin_inquiry_answer")
	public String admin_inquiry_answer(HttpServletRequest request,Model mo)
	{
		int inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		InquiryDTO dto = is.inquiry_answer(inquiry_number);
		mo.addAttribute("inquiryDTO", dto);
		return "admin_inquiry_answer";
	}
	
	@RequestMapping(value = "/admin_inquiry_answer_save",method=RequestMethod.POST)
	public String admin_inquiry_answer_save(HttpServletRequest request)
	{
		String inquiry_status="답변 완료";
		int inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
		String inquiry_answer=request.getParameter("noticeDoc");
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		is.admin_inquiry_answer_save(inquiry_number,inquiry_answer,inquiry_status);
		return "admin_page_view";
	}
	@RequestMapping(value = "admin_inquiry_answer_modify")
	public String admin_inquiry_answer_modify(HttpServletRequest request,Model mo)
	{
		int inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		InquiryDTO dto = is.inquiry_answer(inquiry_number);
		mo.addAttribute("inquiryDTO", dto);
		return "admin_inquiry_answer_modify";
	}
	@RequestMapping(value = "/admin_inquiry_answer_modify_save",method=RequestMethod.POST)
	public String admin_inquiry_answer_modify_save(HttpServletRequest request)
	{
		int inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
		String inquiry_answer=request.getParameter("noticeDoc");
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		is.admin_inquiry_answer_modify_save(inquiry_number,inquiry_answer);
		return "admin_page_view";
	}
}
