package com.team.project.member;

public interface MemberService {

	public int emailcheck(String parameter);
	public int idcheck(String parameter);
	public MemberDTO login_check(String login_id, String login_pw);
	public void customer_join_save(MemberDTO memberDTO);
	public MemberDTO member_id_search(String member_name, String member_email);
	public MemberDTO member_pw_search(String member_id, String member_name, String member_email);

}
