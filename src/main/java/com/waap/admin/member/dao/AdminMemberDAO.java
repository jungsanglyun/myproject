package com.waap.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.waap.member.vo.MemberVO;

public interface AdminMemberDAO {
	public List<MemberVO> adminMemberControlView() throws DataAccessException;
	
	
}
