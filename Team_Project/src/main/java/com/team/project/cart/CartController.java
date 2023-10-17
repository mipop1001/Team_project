package com.team.project.cart;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.TypeReference;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

		}
		mo.addAttribute("list2",list2);
		mo.addAttribute("member_number",member_number); 
		return "user_product_cart_view";
	}
	@ResponseBody
	@RequestMapping(value = "/get_product_info",method=RequestMethod.POST)
	public ProductDTO get_product_info(HttpServletRequest request,Model mo)
	{
		int product_number=Integer.parseInt(request.getParameter("productNumber"));
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ProductDTO dto =  ss.get_product_info(product_number);
		
		return dto;
	}
	
	@RequestMapping(value = "/cart_delete_item")
	public String cart_delete_item(int product_number,int member_number,Model mo)
	{
		System.out.println("상품번호 : "+product_number+member_number);
		CartService cs = sqlSession.getMapper(CartService.class);
		cs.cart_delete_item(product_number,member_number);
		mo.addAttribute("member_number",member_number);
		return "redirect:user_product_cart_view";
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "/purchase_items",method=RequestMethod.POST)
//	public String purchase_items(HttpServletRequest request) throws IOException
//	{
//	       String[] product_numbers = request.getParameterValues("productNumbers[]");
//	        int member_number = Integer.parseInt(request.getParameter("memberNumber"));
//	        int totalProductPrice = Integer.parseInt(request.getParameter("totalProductPrice"));
//	        String updatedQuantities = request.getParameter("updatedQuantities");
//	        //회원 포인트와 구매한 금액비교하기
//	        MemberService ms = sqlSession.getMapper(MemberService.class);
//	        int member_point = ms.pointcheck(member_number);
//	        String result=null;
//	        System.out.println(updatedQuantities);
//	        if(member_point > totalProductPrice)
//	        {
//		        //보유 포인트가 구매 금액보다 많다면 상품 번호로 상품 재고 -하기
//		        ObjectMapper objectMapper = new ObjectMapper();
//		        try {
//					JsonNode quantitiesNode = objectMapper.readTree(updatedQuantities);
//					for (String productNumber : product_numbers) {
//			            if (quantitiesNode.has(String.valueOf(productNumber))) {
//			                int quantity = quantitiesNode.get(String.valueOf(productNumber)).asInt();
//			                System.out.println("상품 번호: " + productNumber + ", 구매 수량: " + quantity);
//			                ProductService ps = sqlSession.getMapper(ProductService.class);
//			                ps.product_sell_amount_update(productNumber,quantity);
//			                ms.product_point_deduction(totalProductPrice, member_number);
//			            }
//			        }
//				} catch (JsonProcessingException e) {
//					e.printStackTrace();
//				} 
//	        	result = "{\"result\":\"ok\"}";
//	        }
//	        else if(member_point < totalProductPrice)
//	        {
//	        	result = "{\"result\":\"no\"}";
//	        }
//	        
//			return result;
//	        
//	        
//	}

}
