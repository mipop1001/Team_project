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
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.admin.AnnouncementDTO;
import com.team.project.admin.AnnouncementService;
import com.team.project.board.BoardDTO;
import com.team.project.board.BoardService;
import com.team.project.member.MemberDTO;
import com.team.project.member.MemberService;
import com.team.project.product.ProductDTO;
import com.team.project.product.ProductService;
import com.team.project.seller.SellerDTO;
import com.team.project.seller.SellerService;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin_page() {
		return "admin_page_login";
	}

	//관리자 페이지 공지사항 작성
	@RequestMapping(value = "/announcement_form_go", method = RequestMethod.GET)
	public String announcement_form() {
		return "announcement_form";
	}
	
	@RequestMapping(value = "/announcement_input_save", method = RequestMethod.GET)
	public String announcement_input_save(HttpServletRequest request) {
		AnnouncementDTO dto = new AnnouncementDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setWriter(request.getParameter("writer"));
		dto.setNoticedoc(request.getParameter("noticeDoc"));
		AnnouncementService as = sqlSession.getMapper(AnnouncementService.class);
		as.announcementinsert(dto);
		return "redirect:/announcement_form_go";
	}
	
	@RequestMapping(value = "/admin_login_check", method = RequestMethod.POST)
	public String admin_login_check(HttpServletRequest request) {
		
		String adminid = request.getParameter("login_id");
		String adminpw = request.getParameter("login_pw");
		MemberService ms = sqlSession.getMapper(MemberService.class);
		int adminrole = ms.adminlogin(adminid, adminpw);
		if(adminrole == 3) {
			return "admin_page_view";
		} else {
			return "redirect:/main";
		}
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main_page(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("loginstatus", false);
		hs.invalidate(); // 세션 무효화
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

	//관리자 페이지 list 출력
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String user_list(Model mo) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> userlist = ms.user_list();
		mo.addAttribute("userlist", userlist);
		return "admin_page_view";
	}

	@RequestMapping(value = "/seller_list", method = RequestMethod.GET)
	public String seller_list(Model mo) {
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ArrayList<SellerDTO> sellerlist = ss.seller_list();
		mo.addAttribute("sellerlist", sellerlist);
		return "admin_page_view";
	}

	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Model mo) {
		BoardService bs = sqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> board_list = bs.board_list();
		mo.addAttribute("board_list", board_list);
		return "admin_page_view";
	}

	@RequestMapping(value = "/product_list", method = RequestMethod.GET)
	public String product_list(Model mo) {
		ProductService bs = sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO> product_list = bs.product_list();
		mo.addAttribute("product_list", product_list);
		return "admin_page_view";
	}

	@RequestMapping(value = "/announcement_list", method = RequestMethod.GET)
	public String announcement_list(Model mo) {
		AnnouncementService as = sqlSession.getMapper(AnnouncementService.class);
		ArrayList<AnnouncementDTO> announcement_list = as.announcement_list();
		mo.addAttribute("announcement_list", announcement_list);
		return "admin_page_view";
	}
	
	//관리자 페이지 삭제 기능
	@RequestMapping(value = "/user_list_delete", method = RequestMethod.GET)
	public String user_list_delete(HttpServletRequest request) {
		MemberService ms = sqlSession.getMapper(MemberService.class);
		ms.user_list_delete(request.getParameter("member_number"));
		return "redirect:/user_list";
	}

	@RequestMapping(value = "/seller_list_delete", method = RequestMethod.GET)
	public String seller_list_delete(HttpServletRequest request) {
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ss.seller_list_delete(request.getParameter("seller_number"));
		return "redirect:/seller_list";
	}
	
	@RequestMapping(value = "/board_list_delete", method = RequestMethod.GET)
	public String board_list_delete(HttpServletRequest request) {
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.board_list_delete(request.getParameter("community_board_number"));
		return "redirect:/board_list";
	}
	
	@RequestMapping(value = "/product_list_delete", method = RequestMethod.GET)
	public String product_list_delete(HttpServletRequest request) {
		ProductService bs = sqlSession.getMapper(ProductService.class);
		bs.product_list_delete(request.getParameter("product_number"));
		return "redirect:/product_list";
	}

	@RequestMapping(value = "/announcement_list_delete", method = RequestMethod.GET)
	public String announcement_list_delete(HttpServletRequest request) {
		AnnouncementService as = sqlSession.getMapper(AnnouncementService.class);
		as.announcement_list_delete(request.getParameter("announcement_number"));
		return "redirect:/announcement_list";
	}
	
}
