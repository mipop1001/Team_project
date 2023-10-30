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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.project.member.MemberDTO;
import com.team.project.seller.SellerDTO;

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
	@RequestMapping(value = "/seller_inquiry_answer")
	public String seller_inquiry_answer(HttpServletRequest request,Model mo)
	{
		HttpSession hs = request.getSession();
		int inquiry_number= Integer.parseInt(request.getParameter("inquiry_number"));
		System.out.println(inquiry_number);
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		InquiryDTO dto = is.inquiry_answer(inquiry_number);
		mo.addAttribute("inquiryDTO", dto);
		if(hs.getAttribute("sellerDTO") != null)
		{
		return "inquiry_answer";
		}
		else
		{
			mo.addAttribute("msg","로그인 세션이 만료 되었습니다.");
			return "seller_login";
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
	@RequestMapping(value = "/seller_inquiry_input_save",method=RequestMethod.POST)
	public String seller_inquiry_input_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		String inquiry_title = mul.getParameter("inquiry_title");
		String inquiry_content = mul.getParameter("inquiry_content");
		int seller_number = Integer.parseInt(mul.getParameter("seller_number"));
		String inquiry_writer_name = mul.getParameter("seller_name");
		
		
		MultipartFile mpf1 = mul.getFile("inquiry_image1");
		String inquiry_image1 = mpf1.getOriginalFilename();
		
		MultipartFile mpf2 = mul.getFile("inquiry_image2");
		String inquiry_image2 = mpf2.getOriginalFilename();
		
		MultipartFile mpf3 = mul.getFile("inquiry_image3");
		String inquiry_image3 = mpf3.getOriginalFilename();
		
		MultipartFile mpf4 = mul.getFile("inquiry_image4");
		String inquiry_image4 = mpf4.getOriginalFilename();
		
		String inquiry_status = "대기 중";
		String inquiry_writer_type = "판매자";
		InquiryDTO dto = new InquiryDTO();
		dto.setInquiry_title(inquiry_title);
		dto.setSeller_number(seller_number);
		dto.setInquiry_writer_name(inquiry_writer_name);
		dto.setInquiry_content(inquiry_content);
		dto.setInquiry_image1(inquiry_image1);
		dto.setInquiry_image2(inquiry_image2);
		dto.setInquiry_image3(inquiry_image3);
		dto.setInquiry_image4(inquiry_image4);
		dto.setInquiry_status(inquiry_status);
		dto.setInquiry_writer_type(inquiry_writer_type);
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		is.seller_inquiry_input_save(dto);
		
		mpf1.transferTo(new File(inquiry_images_path+"\\"+inquiry_image1));
		mpf2.transferTo(new File(inquiry_images_path+"\\"+inquiry_image2));
		mpf3.transferTo(new File(inquiry_images_path+"\\"+inquiry_image3));
		mpf4.transferTo(new File(inquiry_images_path+"\\"+inquiry_image4));
		
		return "redirect:/seller_inquiry_board";
	}
	
	@ResponseBody
	@RequestMapping(value = "/inquiry_my_only", method = RequestMethod.POST)
	public ArrayList<InquiryDTO> inquiryMyOnly(@RequestParam(value = "seller_numbers[]") String[] sellerNumbers,HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		SellerDTO dto = (SellerDTO) hs.getAttribute("sellerDTO");
		int session_seller_number = dto.getSeller_number();
		System.out.println(session_seller_number);
		ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();
	    for (String sellerNumber : sellerNumbers) {
	        System.out.println(sellerNumber);
	        InquiryService is = sqlSession.getMapper(InquiryService.class);
	        int seller_number = Integer.parseInt(sellerNumber);
	        list = is.inquiry_my_only(session_seller_number);
	        
	    }
	    System.out.println(list.size());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inquiry_my_only_member", method = RequestMethod.POST)
	public ArrayList<InquiryDTO> inquiryMyOnly_member(@RequestParam(value = "member_numbers[]") String[] memberNumbers,HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		int session_member_number = dto.getMember_number();
		System.out.println(session_member_number);
		ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();
	    for (String memberNumber : memberNumbers) {
	        System.out.println(memberNumber);
	        InquiryService is = sqlSession.getMapper(InquiryService.class);
	        list = is.inquiry_my_only_member(session_member_number);
	        
	    }
	    System.out.println(list.size());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inquiry_all",method=RequestMethod.POST)
	public ArrayList<InquiryDTO> inquiry_all()
	{
		
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		ArrayList<InquiryDTO> list = is.inquiry_board_list();
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inquiry_all_member",method=RequestMethod.POST)
	public ArrayList<InquiryDTO> inquiry_all_member()
	{
		
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		ArrayList<InquiryDTO> list = is.inquiry_board_list_member();
		return list;
	}
	@RequestMapping(value = "/inquiry_board_list_all")
	public String inquiry_board_list_all(Model mo)
	{
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		ArrayList<InquiryDTO> list = is.inquiry_board_list_all();
		mo.addAttribute("inquiry_list", list);
		return "admin_page_view";
	}
	
	@RequestMapping(value = "/delete_inquiry")
	public String delete_inquiry(HttpServletRequest request)
	{
		int inquiry_number=Integer.parseInt(request.getParameter("inquiry_number"));
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		is.seller_delete_inquiry(inquiry_number);
		return "redirect:/seller_inquiry_board";
	}
	@RequestMapping(value = "/customer_delete_inquiry")
	public String customer_delete_inquiry(HttpServletRequest request,Model mo)
	{
		int inquiry_number=Integer.parseInt(request.getParameter("inquiry_number"));
		InquiryService is = sqlSession.getMapper(InquiryService.class);
		is.customer_seller_delete_inquiry(inquiry_number);
		return "redirect:/customer_inquiry_board";
	}
}
