package com.team.project.seller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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

import com.team.project.product.ProductDTO;
import com.team.project.product.ProductService;

@Controller
public class SellerController {

	@Autowired
	SqlSession sqlSession;
	
	//�α���ȭ��
	@RequestMapping(value = "/seller_login")
	public String seller_login()
	{
		return "seller_login";
	}
	
	//�α׾ƿ�
	@RequestMapping(value = "/seller_logout")
	public String seller_logout(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("loginstate");
		hs.setAttribute("loginstate", false);
		return "seller_page";
	}
	
	//�α��� ������ DB�� ����
	@RequestMapping(value = "/seller_login_save",method=RequestMethod.POST)
	public String seller_login_save(HttpServletRequest request,Model mo)
	{
		String seller_id=request.getParameter("seller_id");
		String seller_password=request.getParameter("seller_password");
		SellerService ss = sqlSession.getMapper(SellerService.class);
		SellerDTO dto = ss.seller_login_save(seller_id,seller_password);
		if(dto != null)
		{
			HttpSession hs=request.getSession();
			hs.setAttribute("loginstate",true);
			String seller_name=dto.seller_name;
			int seller_number=dto.seller_number;
			hs.setAttribute("seller_name",seller_name);
			hs.setAttribute("seller_number",seller_number);
			hs.setAttribute("seller_id", seller_id);
			hs.setMaxInactiveInterval(5);
			return "seller_page";
		}
		else
		{
			mo.addAttribute("msg","���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "seller_login";
		}
		
		
	}
	//ȸ������ ȭ��
	@RequestMapping(value = "/seller_join")
	public String seller_join()
	{
		return "seller_join";
	}
	//ȸ������ ������ DB�� ����
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
		int seller_buy_point=0;
		SellerDTO dto=new SellerDTO();
		dto.setSeller_id(seller_id);
		dto.setSeller_password(seller_password);
		dto.setSeller_name(seller_name);
		dto.setSeller_phone_number(seller_phone_number);
		dto.setSeller_email(seller_email);
		dto.setSeller_company_number(seller_company_number);
		dto.setSeller_compnay_address(seller_company_address);
		dto.setSeller_role(role);
		dto.setSeller_buy_point(seller_buy_point);
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ss.seller_join_save(dto);
		
		return "seller_page";
	}
	
	
	//ȸ������ ���̵� �ߺ�üũ
	@ResponseBody
	@RequestMapping(value = "/seller_id_check",method=RequestMethod.POST)
	public String seller_id_check(HttpServletRequest request)
	{
		String seller_id=request.getParameter("seller_id");
		SellerService ss = sqlSession.getMapper(SellerService.class);
		int count = ss.seller_id_check(seller_id);
		String result=null;
		if(count == 0)
		{
			result="ok";
			return result;
		}
		else
		{
			result="no";
			return result;
		}
		
	}
	//���̵� ã�� ȭ��
	@RequestMapping(value = "/seller_login_find_id")
	public String seller_login_find_id()
	{
		return "seller_login_find_id";
	}
	
	//DB���� ���̵� ã��
	@RequestMapping(value = "/seller_login_find_id_save",method=RequestMethod.POST)
	public String seller_login_find_id_save(HttpServletRequest request,Model mo)
	{
		String seller_name=request.getParameter("seller_name");
		String seller_email=request.getParameter("seller_email");
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ArrayList<SellerDTO> list = ss.seller_login_find_id_save(seller_name, seller_email);
		if(list.size() != 0)
		{
		mo.addAttribute("list",list);
		return "seller_login_find_id_view";
		}
		else
		{
			mo.addAttribute("msg","�̸� �Ǵ� �̸��ϰ� ��ġ�ϴ� ���̵� �������� �ʽ��ϴ�.");
			return "seller_login_find_id";
		}
	}
	
	//��й�ȣ ã��
	@RequestMapping(value = "/seller_login_find_password")
	public String seller_login_find_password()
	{
		return "seller_login_find_password";
	}
	
	//DB���� ��й�ȣ ã��
	@RequestMapping(value = "/seller_login_find_password_save",method=RequestMethod.POST)
	public String seller_login_find_password_save(HttpServletRequest request,Model mo)
	{
		String seller_id=request.getParameter("seller_id");
		String seller_email=request.getParameter("seller_email");
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ArrayList<SellerDTO> list = ss.seller_login_find_password_save(seller_id,seller_email);
		if(list.size() != 0)
		{
		mo.addAttribute("list",list);
		return "seller_login_find_password_view";
		}
		else
		{
			mo.addAttribute("msg","���̵� �Ǵ� �̸����� ��ġ���� �ʽ��ϴ�.");
			return "seller_login_find_password";
		}
	}
	
	//���� ������ seller_number�� ���� �˻�
	@RequestMapping(value = "/seller_info")
	public String seller_info(HttpServletRequest request,Model mo)
	{
		int seller_number=Integer.parseInt(request.getParameter("seller_number"));
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ArrayList<SellerDTO> list = ss.seller_info(seller_number);
		mo.addAttribute("list", list);
		return "seller_info";
	}
	
	//�Ǹ��� ���� ���� ��
	@RequestMapping(value = "/seller_info_modify")
	public String seller_info_modify(int seller_number,Model mo)
	{
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ArrayList<SellerDTO> list = ss.seller_info_modify(seller_number);
		mo.addAttribute("list", list);
		return "seller_info_modify_view";
	}
	
	//�Ǹ��� ���� ���� DB ����
	@RequestMapping(value = "/seller_info_modify_update",method=RequestMethod.POST)
	public String seller_info_modify_update(HttpServletRequest request,Model mo)
	{
		String seller_password=request.getParameter("seller_password");
		String seller_phone_number=request.getParameter("seller_phone_number");
		String seller_company_number=request.getParameter("seller_company_number");
		String seller_company_address=request.getParameter("seller_company_address");
		int seller_number=Integer.parseInt(request.getParameter("seller_number"));
		SellerService ss = sqlSession.getMapper(SellerService.class);
		ss.seller_info_modify_update(seller_password,seller_phone_number,seller_company_number,seller_company_address,seller_number);
		ArrayList<SellerDTO> list = ss.seller_info(seller_number);
		mo.addAttribute("list", list);
		return "seller_info";
	}
	
	//�Ǹ��� ȸ�� Ż��
	@ResponseBody
	@RequestMapping(value = "/seller_info_exit",method=RequestMethod.POST)
	public String seller_info_exit(HttpServletRequest request)
	{
		SellerService ss = sqlSession.getMapper(SellerService.class);
		int seller_number=Integer.parseInt(request.getParameter("seller_number"));
		String seller_password=request.getParameter("seller_password");
		SellerDTO dto = ss.seller_password_check(seller_number,seller_password);//DB�� ��й�ȣ�� �ִ��� üũ
		HttpSession hs = request.getSession();
		if(dto!=null)
		{
			ss.seller_info_exit(seller_number);//����
			hs.removeAttribute("loginstate");
			hs.setAttribute("loginstate",false);
			return "ok";
		}
		else
		{
			return "no";
		}
	}


	
}
