package com.team.project.seller;

import java.util.ArrayList;

public interface SellerService {
	public void seller_join_save(SellerDTO dto);
	public SellerDTO seller_login_save(String seller_id, String seller_password);
	//회원가입시 아이디 중복 검사
	public int seller_id_check(String seller_id);
	public ArrayList<SellerDTO> seller_info(int seller_number);
	public ArrayList<SellerDTO> seller_info_modify(int seller_number);
	public void seller_info_modify_update(String seller_password,String seller_phone_number,String seller_company_number,String seller_company_address,int seller_number);
	public void seller_info_exit(int seller_number);
	//DB에서 아이디 찾기
	public ArrayList<SellerDTO> seller_login_find_id_save(String seller_name,String seller_email);
	//회원 탈퇴시 회원번호와 비밀번호가 일치하는지 검색
	public SellerDTO seller_password_check(int seller_number,String seller_password);
	//DB에서 비밀번호 찾기
	public ArrayList<SellerDTO> seller_login_find_password_save(String seller_id,String seller_address);
	public ArrayList<SellerDTO> seller_list();
	public void seller_list_delete(String parameter);

}
