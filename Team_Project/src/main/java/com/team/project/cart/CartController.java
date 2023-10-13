package com.team.project.cart;

import java.awt.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.member.MemberService;
import com.team.project.product.ProductDTO;
import com.team.project.product.ProductService;

@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;
	
	//장바구니 버튼 누를 시
	@RequestMapping(value = "/user_product_cart")
	public String user_product_cart(HttpServletRequest request,Model mo)
	{
		int product_number=Integer.parseInt(request.getParameter("product_number"));
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		CartService cs = sqlSession.getMapper(CartService.class);
		cs.user_product_cart(member_number,product_number);
		
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO> list = ss.user_product_detail(product_number);
		System.out.println(list.toString());
		mo.addAttribute("list", list);

		return "user_product_detail";
	}
	@ResponseBody
	@RequestMapping(value = "/user_product_cart_check",method=RequestMethod.POST)
	public String user_product_cart_check(HttpServletRequest request)
	{
		int product_number=Integer.parseInt(request.getParameter("product_number"));
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		CartService cs = sqlSession.getMapper(CartService.class);
		int count = cs.user_product_cart_check(product_number,member_number);
		
		if(count >= 1)
		{
			return "already";
		}
		else
		{
			return "success";
		}
	}
	
	@RequestMapping(value = "/user_product_cart_view")
	public String user_product_cart_view(HttpServletRequest request,Model mo)
	{
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		CartService cs = sqlSession.getMapper(CartService.class);
		ArrayList<CartDTO> list = cs.user_product_cart_view(member_number);
		ArrayList<ProductDTO> list2= new ArrayList<ProductDTO>();
		for (CartDTO cartItem : list) {
		    // 각 장바구니 항목에서 상품 번호를 가져옴
		    int product_number = cartItem.getProduct_number();
		    ProductService ps = sqlSession.getMapper(ProductService.class);
		    list2 = ps.user_product_cart_view_data(member_number);
//		       if (dto != null) {
//		            list2.addAll(dto);
//		        }
		}
		mo.addAttribute("list2",list2);
		return "user_product_cart_view";
	}

	
}
