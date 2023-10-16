package com.team.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.board.BoardDTO;
import com.team.project.board.BoardService;
import com.team.project.product.ProductDTO;
import com.team.project.product.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main_page(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("loginstatus", false);
		return "main_page";
	}
	
	@RequestMapping(value = "/user_page", method = RequestMethod.GET)
	public String user_page(HttpServletRequest request, Model mo) {
		
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO> list = ps.user_product_out();
		mo.addAttribute("list", list);
		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> list2 = bs.customer_community_out();
		mo.addAttribute("list2", list2);
		
		
		return "user_page";
	}

	@RequestMapping(value = "/seller_page", method = RequestMethod.GET)
	public String seller_page() {
		return "seller_page";
	}
	
}
