package com.team.project.member;

import java.util.ArrayList;

public interface MemberService {

	public int emailcheck(String parameter);
	public int idcheck(String parameter);
	public MemberDTO login_check(String login_id, String login_pw);
	public void customer_join_save(MemberDTO memberDTO);
	public MemberDTO member_id_search(String member_name, String member_email);
	public MemberDTO member_pw_search(String member_id, String member_name, String member_email);
	public boolean customer_info_exit(String member_id, String member_name, String member_email,
			String member_password);
	public boolean customer_phone_number_modify(String newPhoneNumber, String member_id, String member_email);
	public MemberDTO newcustomer(String member_id, String member_name, String member_email);
	public boolean customer_address_modify(String parameter, String member_id, String member_email);
	public boolean customer_password_modify(String parameter, String member_id, String member_email);
	public void member_point_up(int member_number, String member_email);
	public boolean customer_point_update(String member_id, String member_email);
	public ArrayList<MemberDTO> point_management(int member_number);
	public void pointcharge(int point, String member_id, String member_name, String member_email);
	public int pointcheck(int member_number);
	public void product_point_deduction(int totalProductPrice,int member_number);
	public ArrayList<MemberDTO> user_product_order(int member_number);
	public void order_buy_final(int member_point, int member_number);
	public ArrayList<MemberDTO> customer_info(int member_number);
	public void order_buy_point_up(int product_price, int member_number);
	public int adminlogin(String adminid, String adminpw);
	public ArrayList<MemberDTO> user_list();
	public void user_list_delete(String parameter);
}
