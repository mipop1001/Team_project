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

import com.team.project.member.MemberDTO;
import com.team.project.member.MemberService;
import com.team.project.order.OrderDTO;
import com.team.project.order.OrderService;
import com.team.project.product.ProductDTO;
import com.team.project.product.ProductService;
import com.team.project.seller.SellerService;

@Controller
public class CartController {

	@Autowired
	SqlSession sqlSession;
	
	//��ٱ��� ��ư ���� ��
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
		    // �� ��ٱ��� �׸񿡼� ��ǰ ��ȣ�� ������
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
		System.out.println("��ǰ��ȣ : "+product_number+member_number);
		CartService cs = sqlSession.getMapper(CartService.class);
		cs.cart_delete_item(product_number,member_number);
		mo.addAttribute("member_number",member_number);
		return "redirect:user_product_cart_view";
	}
	
	//��ٱ��Ͽ��� �����ϱ�.
	@RequestMapping(value = "/user_product_order_cart", method = RequestMethod.POST)
	public String user_product_order_cart(HttpServletRequest request,Model mo) {
	    // ������ ó��
		String [] productNumbers=request.getParameterValues("productNumber");
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		String [] productPrices=request.getParameterValues("productPrices");
		String [] productQuantities=request.getParameterValues("currentQuantity");
		ProductDTO dto = new ProductDTO();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		ProductService ps = sqlSession.getMapper(ProductService.class);
		MemberService ms = sqlSession.getMapper(MemberService.class);
	    int productTotal =0;
	    int price=0;
	    int quantity=0;
	    int total=0;
	    ArrayList<Object> productQuantitiesList = new ArrayList<Object>();
		for(int i = 0; i<productNumbers.length; i++)
		{
		 dto = ps.cart_buy_view(productNumbers[i]);
	    list.add(dto);
	    
	    
	     price = Integer.parseInt(productPrices[i]);
	     quantity = Integer.parseInt(productQuantities[i]);
	     productTotal  = price*quantity;
	     total+=productTotal; 
	     dto.setProduct_buy_amount(quantity);
	     productQuantitiesList.add(quantity);
	     mo.addAttribute("productQuantities", productQuantitiesList);
		}
		MemberDTO dto2 = ms.order_cart_view_info(member_number);
		mo.addAttribute("list", list);
		mo.addAttribute("dto2", dto2);
		mo.addAttribute("total", total);
	    return "user_product_order_cart";
	}
	@RequestMapping(value = "/order_buy_final_cart")
	public String order_buy_final_cart(HttpServletRequest request)
	{
		int member_number = Integer.parseInt(request.getParameter("member_number"));
		int total_price = Integer.parseInt(request.getParameter("total_price"));
		String [] product_numbers=request.getParameterValues("product_numbers");
		String [] product_Quantities=request.getParameterValues("product_Quantities");
		String [] product_price = request.getParameterValues("product_price");
		String[] seller_id = new String[product_numbers.length];
		String[] seller_number = new String[product_numbers.length];
		System.out.println(seller_id.length+""+product_numbers.length);
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int member_point = ms.pointcheck(member_number);
		ProductService ps = sqlSession.getMapper(ProductService.class);
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ms.customer_buy_point_deduction(member_number,total_price);
		String member_name = ms.customer_member_name(member_number);
		String member_address = ms.customer_member_address(member_number);
		String[] pp=null;
		if(member_point >= total_price)
		{
			for(int i = 0;i<product_numbers.length;i++)
			{
				//��ǰ��ȣ�� �Ǹ��� ���̵� �˻�
				seller_id[i] = ps.product_seller_id(product_numbers[i]);
				//��ǰ DB ���ż��� ���� �Ǹż��� ����
				ps.order_buy_amount_updown_cart(product_numbers[i],product_Quantities[i]);
				seller_number[i]=ss.product_seller_number(seller_id[i]);
				//��ǰ ���� �� ����Ʈ ����
				ss.seller_buy_point_update(seller_id[i],Integer.parseInt(product_price[i]),Integer.parseInt(product_Quantities[i]));
			System.out.println("ȸ�� ��ȣ : "+member_number+"�ݾ� : "+total_price+"��ǰ��ȣ"+product_numbers[i]+"���� ����"+product_Quantities[i]);
			
			OrderDTO od = new OrderDTO();
			od.setSeller_number(Integer.parseInt(seller_number[i]));
			od.setSeller_name(ss.product_seller_name(seller_id[i]));
			od.setMember_number(member_number);
			od.setMember_name(member_name);
			od.setProduct_number(Integer.parseInt(product_numbers[i]));
			od.setProduct_name(ps.product_product_name(product_numbers[i]));
			od.setProduct_sell_amount(Integer.parseInt(product_Quantities[i]));
			od.setProduct_price(Integer.parseInt(product_price[i]));
			od.setProduct_total_price(Integer.parseInt(product_price[i]) * Integer.parseInt(product_Quantities[i]));
			String delivery_status="�ֹ� ���� ��";
			od.setDelivery_status(delivery_status);
			od.setMember_address(member_address);
			OrderService os = sqlSession.getMapper(OrderService.class);
			os.insert_order_history(od);
			ms.customer_buy_point(member_number,Integer.parseInt(product_price[i]) * Integer.parseInt(product_Quantities[i]));
			}
		}
		return "user_page";
		
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/purchase_items",method=RequestMethod.POST)
//	public String purchase_items(HttpServletRequest request) throws IOException
//	{
//	       String[] product_numbers = request.getParameterValues("productNumbers[]");
//	        int member_number = Integer.parseInt(request.getParameter("memberNumber"));
//	        int totalProductPrice = Integer.parseInt(request.getParameter("totalProductPrice"));
//	        String updatedQuantities = request.getParameter("updatedQuantities");
//	        //ȸ�� ����Ʈ�� ������ �ݾ׺��ϱ�
//	        MemberService ms = sqlSession.getMapper(MemberService.class);
//	        int member_point = ms.pointcheck(member_number);
//	        String result=null;
//	        System.out.println(updatedQuantities);
//	        if(member_point > totalProductPrice)
//	        {
//		        //���� ����Ʈ�� ���� �ݾ׺��� ���ٸ� ��ǰ ��ȣ�� ��ǰ ��� -�ϱ�
//		        ObjectMapper objectMapper = new ObjectMapper();
//		        try {
//					JsonNode quantitiesNode = objectMapper.readTree(updatedQuantities);
//					for (String productNumber : product_numbers) {
//			            if (quantitiesNode.has(String.valueOf(productNumber))) {
//			                int quantity = quantitiesNode.get(String.valueOf(productNumber)).asInt();
//			                System.out.println("��ǰ ��ȣ: " + productNumber + ", ���� ����: " + quantity);
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
