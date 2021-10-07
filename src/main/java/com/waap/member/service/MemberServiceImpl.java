package com.waap.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waap.member.dao.MemberDAO;
import com.waap.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		memberDAO.addMember(memberVO);
	}
	
	@Override
	public int idCheck(String member_id) throws Exception {
		return memberDAO.idCheck(member_id);
		
	}
	
	@Override
	public MemberVO emailAndNameCheck(String member_name, String member_email, String member_email2) throws Exception {
		return memberDAO.emailAndNameCheck(member_name, member_email, member_email2);
	}
	
	@Override
	public MemberVO emailAndIdCheck(String member_id, String member_email, String member_email2) throws Exception {
		return memberDAO.emailAndIdCheck(member_id, member_email, member_email2);
	}
	
}
