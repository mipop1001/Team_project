package com.team.project.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProductController {

	@Autowired
	SqlSession sqlSession;
	
	static String product_image_sum_path="C:\\Users\\3-29\\git\\Team_Project\\Team_Project\\src\\main\\webapp\\product_sum_image";
	static String product_image_intro_path="C:\\Users\\3-29\\git\\Team_Project\\Team_Project\\src\\main\\webapp\\product_intro_image";
	
	@RequestMapping(value = "/seller_product_join")
	public String seller_product_join(String seller_id,Model mo)
	{
		mo.addAttribute("seller_id",seller_id);
		return "seller_product_join";
	}
	@RequestMapping(value = "/seller_product_join_save",method=RequestMethod.POST)
	public String seller_product_join_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		String product_name=mul.getParameter("product_name");
		String product_country=mul.getParameter("product_country");
		String product_maker=mul.getParameter("product_maker");
		int product_price=Integer.parseInt(mul.getParameter("product_price"));
		int product_buy_amount=0;
		int product_sell_amount=Integer.parseInt(mul.getParameter("product_sell_amount"));
		String seller_id=mul.getParameter("seller_id");
		int product_review_count=0;
		
		MultipartFile mpf = mul.getFile("product_sum_image");
		String product_sum_image=mpf.getOriginalFilename();
				
		
		MultipartFile mpf1 = mul.getFile("product_detail_image1");
		String product_detail_image1=mpf1.getOriginalFilename();
		
		MultipartFile mpf2 = mul.getFile("product_detail_image2");
		String product_detail_image2=mpf2.getOriginalFilename();
		
		MultipartFile mpf3 = mul.getFile("product_detail_image3");
		String product_detail_image3=mpf3.getOriginalFilename();
		
		ProductDTO dto = new ProductDTO();
		dto.setProduct_name(product_name);
		dto.setProduct_country(product_country);
		dto.setProduct_maker(product_maker);
		dto.setProduct_price(product_price);
		dto.setProduct_buy_amount(product_buy_amount);
		dto.setProduct_sell_amount(product_sell_amount);
		dto.setSeller_id(seller_id);
		dto.setProduct_review_count(product_review_count);
		dto.setProduct_sum_image(product_sum_image);
		dto.setProduct_detail_image1(product_detail_image1);
		dto.setProduct_detail_image2(product_detail_image2);
		dto.setProduct_detail_image3(product_detail_image3);
		
		mpf.transferTo(new File(product_image_sum_path+"\\"+product_sum_image));
		mpf1.transferTo(new File(product_image_intro_path+"\\"+product_detail_image1));
		mpf2.transferTo(new File(product_image_intro_path+"\\"+product_detail_image2));
		mpf3.transferTo(new File(product_image_intro_path+"\\"+product_detail_image3));
		
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ss.seller_product_join_save(dto);
		return "seller_page";
		
	}
	
	
	//판매자 상품 리스트 출력
	@RequestMapping(value = "/seller_product_out")
	public String seller_product_out(HttpServletRequest request,Model mo)
	{
		String seller_id=request.getParameter("seller_id");
		
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO> list = ss.seller_product_out(seller_id);
		mo.addAttribute("list", list);
		mo.addAttribute("seller_id",seller_id);
		return "seller_product_out";
		
	}
	//내 상품 검색
	@RequestMapping(value = "/seller_product_search",method=RequestMethod.POST)
	public String seller_product_search(HttpServletRequest request,Model mo)
	{
		String seller_id=request.getParameter("seller_id");
		String product_search_type=request.getParameter("product_search_type");
		String product_search_value=request.getParameter("product_search_value");
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		if(product_search_type.equals("product_number"))
		{
			 list = ss.seller_product_search_number(seller_id,product_search_value);
		}
		else if(product_search_type.equals("product_name"))
		{
			 list = ss.seller_product_search_name(seller_id,product_search_value);
			
		}
		
		mo.addAttribute("list", list);
		mo.addAttribute("seller_id",seller_id);
		return "seller_product_search_out";
	}
	
	//내 상품 자세히 보기
	@RequestMapping(value = "/seller_product_out_detail")
	public String seller_product_out_detail(String seller_id,int product_number,Model mo)
	{
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ProductDTO dto = ss.seller_product_out_detail(seller_id,product_number);
		mo.addAttribute("dto", dto);
		
		return "seller_product_out_detail";
	}
	
	//상품 수정하기
	@RequestMapping(value = "/seller_product_modify")
	public String seller_product_modify(String seller_id,int product_number,Model mo)
	{
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ProductDTO dto = ss.seller_product_out_detail(seller_id, product_number);
		mo.addAttribute("dto", dto);
		return "seller_product_modify";
	}
	
	//상품 삭제하기
	@RequestMapping(value = "/seller_product_delete")
	public String seller_product_delete(String seller_id,int product_number,Model mo)
	{
	ProductService ss = sqlSession.getMapper(ProductService.class);
	ss.seller_product_delete(seller_id, product_number);
	
	ArrayList<ProductDTO> list = ss.seller_product_out(seller_id);
	mo.addAttribute("list", list);
	mo.addAttribute("seller_id",seller_id);
	
	return "seller_product_out";
	}
	
	//상품 수정DB저장
	@RequestMapping(value = "/seller_product_update",method=RequestMethod.POST)
	public String seller_product_update(MultipartHttpServletRequest mul,Model mo) throws IllegalStateException, IOException
	{
		String seller_id=mul.getParameter("seller_id");
		int product_number=Integer.parseInt(mul.getParameter("product_number"));
		String product_name=mul.getParameter("product_name");
		String product_country=mul.getParameter("product_country");
		String product_maker=mul.getParameter("product_maker");
		int product_price=Integer.parseInt(mul.getParameter("product_price"));
		int product_sell_amount=Integer.parseInt(mul.getParameter("product_sell_amount"));
		
		MultipartFile mpf = mul.getFile("product_sum_image");
		String product_sum_image=mpf.getOriginalFilename();
				
		
		MultipartFile mpf1 = mul.getFile("product_detail_image1");
		String product_detail_image1=mpf1.getOriginalFilename();
		
		MultipartFile mpf2 = mul.getFile("product_detail_image2");
		String product_detail_image2=mpf2.getOriginalFilename();
		
		MultipartFile mpf3 = mul.getFile("product_detail_image3");
		String product_detail_image3=mpf3.getOriginalFilename();
		
		ProductDTO dto = new ProductDTO();
		dto.setSeller_id(seller_id);
		dto.setProduct_number(product_number);
		dto.setProduct_name(product_name);
		dto.setProduct_country(product_country);
		dto.setProduct_maker(product_maker);
		dto.setProduct_price(product_price);
		dto.setProduct_sell_amount(product_sell_amount);
		dto.setProduct_sum_image(product_sum_image);
		dto.setProduct_detail_image1(product_detail_image1);
		dto.setProduct_detail_image2(product_detail_image2);
		dto.setProduct_detail_image3(product_detail_image3);
		
		mpf.transferTo(new File(product_image_sum_path+"\\"+product_sum_image));
		mpf1.transferTo(new File(product_image_intro_path+"\\"+product_detail_image1));
		mpf2.transferTo(new File(product_image_intro_path+"\\"+product_detail_image2));
		mpf3.transferTo(new File(product_image_intro_path+"\\"+product_detail_image3));
		
		ProductService ss = sqlSession.getMapper(ProductService.class);
		ss.seller_product_update(dto);
		
		
		ArrayList<ProductDTO> list = ss.seller_product_out(seller_id);
		mo.addAttribute("list", list);
		mo.addAttribute("seller_id",seller_id);
		return "seller_product_out";
		
	}

}
