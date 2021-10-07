package com.waap.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.waap.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void addMember(MemberVO memberVO) throws DataAccessException;
	public int idCheck(String member_id) throws DataAccessException;
	public MemberVO emailAndNameCheck(String member_name, String member_email, String member_email2) throws Exception;
	public MemberVO emailAndIdCheck(String member_id, String member_email, String member_email2) throws Exception;
}
