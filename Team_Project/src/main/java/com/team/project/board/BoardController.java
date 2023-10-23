package com.team.project.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.project.member.MemberDTO;

@Controller
public class BoardController {

	@Autowired
	SqlSession sqlSession;
	
	static String image_sum_path="Team_Project/src/main/webapp/product_sum_image";
	static String image_intro_path="Team_Project/src/main/webapp/product_intro_image";
	
	@RequestMapping(value = "/customer_community_input_form")
	public String customer_community_input_form(HttpServletRequest request) {	
		HttpSession hs = request.getSession();
		if ((Boolean) hs.getAttribute("loginstatus")) {
		    return "customer_community_input_form";
		} else {
		    return "redirect:/customer_login";
		}

	}
	
	@RequestMapping(value = "/customer_community_input_save", method = RequestMethod.POST)
	public String customer_community_input_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
			
		HttpSession hs = mul.getSession();
		MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
		System.out.println(dto.getMember_number());
		
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
			ss.customer_community_input_save(community_board_title,community_board_content,community_board_location,community_board_grade,community_board_sum_image,community_board_detail_image1,community_board_detail_image2,community_board_detail_image3,dto.getMember_number());
			
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
		ArrayList<BoardCommentDTO> list2 = ss.board_comment_view(Integer.parseInt(request.getParameter("community_board_number")));
		ArrayList<MemberDTO> dto = ss.board_comment_view_member_id(request.getParameter("community_board_number"));
		mo.addAttribute("list",list);
		mo.addAttribute("list2", list2);
		mo.addAttribute("dto", dto);
		return "customer_community_detail";
	}
	
	@RequestMapping(value = "/customer_community_delete")
	public String customer_community_delete(HttpServletRequest request) {

		BoardService ss = sqlSession.getMapper(BoardService.class);
		ss.customer_community_delete(Integer.parseInt(request.getParameter("community_board_number")));
		
		return "redirect:/my_community_content";
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
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/boardnotice")
	public String ko16(HttpServletRequest request, PageDTO dto,Model mo) {
		String nowPage=request.getParameter("nowPage"); //시작하면 null 값
		String cntPerPage=request.getParameter("cntPerPage");
		BoardService notice = sqlSession.getMapper(BoardService.class);
		//전체레코드수구하기
		int total=notice.boardcntnotice();
		if(nowPage==null && cntPerPage == null) {
		nowPage="1";
		cntPerPage="9";
		}
		else if(nowPage==null) {
		nowPage="1";
		}
		else if(cntPerPage==null) {
		cntPerPage="9";
		}      
		dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		mo.addAttribute("paging",dto);
		mo.addAttribute("list",notice.boardnotice(dto));
		//전체 레코드 수 구하는 것과 자료행중에서 start, end 값을 반환
		return "customer_community_out";
	}
	
	//게시판 댓글
	@ResponseBody
	@RequestMapping(value = "/board_comment",method=RequestMethod.POST)
	public ArrayList<BoardCommentDTO> board_comment(HttpServletRequest request,Model mo) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		String member_id=request.getParameter("member_id");
		int board_number=Integer.parseInt(request.getParameter("board_number"));
		String comment_text=request.getParameter("comment_text");
		BoardService ss = sqlSession.getMapper(BoardService.class);
		ss.board_comment_save(member_id,board_number,comment_text);
		ArrayList<BoardCommentDTO> list = ss.board_comment_view(board_number);
		return list;
		
	}
	
	//나의 게시글 보기
	@RequestMapping(value = "/my_community_content", method= {RequestMethod.POST,RequestMethod.GET})
	public String my_community_content(HttpServletRequest request, Model mo)
	{
		try {
			HttpSession hs = request.getSession();
			MemberDTO dto = (MemberDTO) hs.getAttribute("memberDTO");
			BoardService bs = sqlSession.getMapper(BoardService.class);
			ArrayList<BoardDTO> list = bs.my_community_content(dto.getMember_number());
			mo.addAttribute("list", list);
			mo.addAttribute("memberDTO", dto);
			return "my_community_content_view";	
		} catch (NullPointerException e) {
			
			return "customer_login_form";
		}
		
			
	}

	//나의 게시글 삭제
	@ResponseBody
	@RequestMapping(value = "/delete_comment", method= {RequestMethod.POST,RequestMethod.GET})
	public String delete_comment(HttpServletRequest request, Model mo)
	{
		HttpSession hs = request.getSession();
		MemberDTO dto = (MemberDTO)hs.getAttribute("memberDTO");
		if(dto.getMember_id().equals(request.getParameter("commentid"))) {
			String commentid = request.getParameter("commentid");
			String commenttext = request.getParameter("commenttext");
			int commentnumber = Integer.parseInt(request.getParameter("commentnumber"));
			BoardService bs = sqlSession.getMapper(BoardService.class);
			bs.delete_comment(commentid,commenttext,commentnumber);
			return "ok";
		} else {
			return "";
		}
	}
	
}
