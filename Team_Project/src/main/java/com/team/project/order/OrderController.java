package com.team.project.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.project.member.MemberDTO;
import com.team.project.member.MemberService;
import com.team.project.product.ProductDTO;
import com.team.project.product.ProductService;

@Controller
public class OrderController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/user_product_order")
	public String user_product_order(HttpServletRequest request, Model mo) {
		
		int product_number=Integer.parseInt(request.getParameter("product_number"));
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO> plist = ps.user_product_order(product_number);
		
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> mlist = ms.user_product_order(member_number);
		
		mo.addAttribute("mlist", mlist);
		mo.addAttribute("plist", plist);
		
		return "user_product_order";
	}	
	
	@RequestMapping(value = "/order_buy_final")
	public String order_buy_final(HttpServletRequest request) {
		int member_point = Integer.parseInt(request.getParameter("member_point"));
		int member_number = Integer.parseInt(request.getParameter("member_number"));
		System.out.println(member_point);
		System.out.println(member_number);
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.order_buy_final(member_point,member_number);
		
		return "user_page";
	}
}
