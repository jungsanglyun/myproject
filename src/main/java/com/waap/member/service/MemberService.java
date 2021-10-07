package com.waap.member.service;

import java.util.List;
import java.util.Map;

import com.waap.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	
	public int idCheck(String member_id) throws Exception;
	
	public MemberVO emailAndNameCheck(String member_name, String member_email, String member_email2) throws Exception;
	public MemberVO emailAndIdCheck(String member_id, String member_email, String member_email2) throws Exception;
	
}
