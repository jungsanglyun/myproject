package com.waap.admin.member.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.waap.member.vo.MemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<MemberVO> adminMemberControlView() throws DataAccessException {
		
		List<MemberVO> memberVOList = sqlsession.selectList("mapper.member.adminMemberControlView");
		
		return memberVOList;
	}
	
	
}
