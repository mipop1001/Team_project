package com.team.project.seller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SellerController {

	@Autowired
	SqlSession sqlSession;
	
	//로그인화면
	@RequestMapping(value = "/seller_login")
	public String seller_login()
	{
		return "seller_login";
	}
	//로그인 데이터 DB에 저장
	@RequestMapping(value = "/seller_login_save",method=RequestMethod.POST)
	public void seller_login_save()
	{
		
	}
	//회원가입 화면
	@RequestMapping(value = "/seller_join")
	public String seller_join()
	{
		return "seller_join";
	}
	//회원가입 데이터 DB에 저장
	@RequestMapping(value = "/seller_join_save",method=RequestMethod.POST)
	public String seller_join_save(HttpServletRequest request)
	{
		String seller_id=request.getParameter("seller_id");
		String seller_password=request.getParameter("seller_password");
		String seller_name=request.getParameter("seller_name");
		String seller_phone_number=request.getParameter("seller_phone_number");
		String seller_email=request.getParameter("seller_email");
		String seller_company_number=request.getParameter("seller_company_number");
		String seller_company_address=request.getParameter("seller_company_address");
		int role=1;
		
		SellerDTO dto=new SellerDTO();
		
		dto.setSeller_id(seller_id);
		dto.setSeller_password(seller_password);
		dto.setSeller_name(seller_name);
		dto.setSeller_phone_number(seller_phone_number);
		dto.setSeller_email(seller_email);
		dto.setSeller_company_number(seller_company_number);
		dto.setSeller_compnay_address(seller_company_address);
		dto.setSeller_role(role);
		
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ss.seller_join_save(dto);
		
		return "seller_page";
	}
}
