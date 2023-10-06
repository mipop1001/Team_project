package com.team.project.board;

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
public class BoardController {

	@Autowired
	SqlSession sqlSession;
	
	static String image_sum_path="Team_Project/src/main/webapp/product_sum_image";
	static String image_intro_path="Team_Project/src/main/webapp/product_intro_image";
	
	@RequestMapping(value = "/customer_community_input_form")
	public String customer_community_input_form() {	
		return "customer_community_input_form";
	}
	
	@RequestMapping(value = "/customer_community_input_save", method = RequestMethod.POST)
	public String customer_community_input_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		
		String community_board_title = mul.getParameter("community_board_title");
		String community_board_content = mul.getParameter("community_board_content");
		String community_board_location = mul.getParameter("community_board_location");
		int community_board_grade = Integer.parseInt(mul.getParameter("community_board_grade"));
		
		MultipartFile mf = mul.getFile("community_board_sum_image");
		String community_board_sum_image = mf.getOriginalFilename();
		
		
		MultipartFile mf1 = mul.getFile("community_board_detail_image1");
		String community_board_detail_image1 = mf1.getOriginalFilename();
		
		
		MultipartFile mf2 = mul.getFile("community_board_detail_image2");
		String community_board_detail_image2 = mf2.getOriginalFilename();
		
		
		MultipartFile mf3 = mul.getFile("community_board_detail_image3");
		String community_board_detail_image3 = mf3.getOriginalFilename();
		
		BoardService ss = sqlSession.getMapper(BoardService.class);
		ss.customer_community_input_save(community_board_title,community_board_content,community_board_location,community_board_grade,community_board_sum_image,community_board_detail_image1,community_board_detail_image2,community_board_detail_image3);
		
		mf.transferTo(new File(image_sum_path+"\\"+community_board_sum_image));
		mf1.transferTo(new File(image_intro_path+"\\"+community_board_detail_image1));
		mf2.transferTo(new File(image_intro_path+"\\"+community_board_detail_image2));
		mf3.transferTo(new File(image_intro_path+"\\"+community_board_detail_image3));
		
		return "customer_community_input_form";
	}
	
	@RequestMapping(value = "/customer_community_out")
	public String customer_community_out(Model mo) {
		
		BoardService ss = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> list = ss.customer_community_out();
		
		mo.addAttribute("list",list);
		
		return "customer_community_out";
	}
	
	@RequestMapping(value = "/customer_community_detail")
	public String customer_community_detail(HttpServletRequest request,Model mo) {

		BoardService ss = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> list = ss.customer_community_detail(Integer.parseInt(request.getParameter("community_board_number")));
		
		mo.addAttribute("list",list);
		
		return "customer_community_detail";
	}
	
	@RequestMapping(value = "/customer_community_delete")
	public String customer_community_delete(HttpServletRequest request) {

		BoardService ss = sqlSession.getMapper(BoardService.class);
		ss.customer_community_delete(Integer.parseInt(request.getParameter("community_board_number")));

		return "user_page";
	}
	
	@RequestMapping(value = "/customer_community_modify_get")
	public String customer_community_modify_get(HttpServletRequest request,Model mo) {
		
		BoardService ss = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> list = ss.customer_community_modify_get(Integer.parseInt(request.getParameter("community_board_number")));
		
		mo.addAttribute("list",list);
		
		return "customer_community_modify_input";
	}
	
	@RequestMapping(value = "/customer_community_modify_input_save", method = RequestMethod.POST)
	public String customer_community_modify_input_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		
		int community_board_number = Integer.parseInt(mul.getParameter("community_board_number"));
		String community_board_title = mul.getParameter("community_board_title");
		String community_board_content = mul.getParameter("community_board_content");
		String community_board_date = mul.getParameter("community_board_date");
		String community_board_location = mul.getParameter("community_board_location");
		int community_board_grade = Integer.parseInt(mul.getParameter("community_board_grade"));
		
		MultipartFile mf = mul.getFile("community_board_sum_image");
		String community_board_sum_image = mf.getOriginalFilename();
		
		
		MultipartFile mf1 = mul.getFile("community_board_detail_image1");
		String community_board_detail_image1 = mf1.getOriginalFilename();
		
		
		MultipartFile mf2 = mul.getFile("community_board_detail_image2");
		String community_board_detail_image2 = mf2.getOriginalFilename();
		
		
		MultipartFile mf3 = mul.getFile("community_board_detail_image3");
		String community_board_detail_image3 = mf3.getOriginalFilename();
		
		BoardService ss = sqlSession.getMapper(BoardService.class);
		ss.customer_community_modify_input_save(community_board_number,community_board_title,community_board_content,community_board_date,community_board_location,community_board_grade,community_board_sum_image,community_board_detail_image1,community_board_detail_image2,community_board_detail_image3);
		
		mf.transferTo(new File(image_sum_path+"\\"+community_board_sum_image));
		mf1.transferTo(new File(image_intro_path+"\\"+community_board_detail_image1));
		mf2.transferTo(new File(image_intro_path+"\\"+community_board_detail_image2));
		mf3.transferTo(new File(image_intro_path+"\\"+community_board_detail_image3));
		
		return "customer_community_input_form";
	}
}
