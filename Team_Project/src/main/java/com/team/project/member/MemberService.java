package com.team.project.member;

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

}
