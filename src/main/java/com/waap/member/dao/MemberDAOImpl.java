package com.waap.member.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.waap.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO login(Map loginMap) throws DataAccessException {
		return (MemberVO) sqlSession.selectOne("mapper.member.login", loginMap);
	}

	@Override
	public void addMember(MemberVO memberVO) throws DataAccessException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date now = new Date(System.currentTimeMillis());

		String now_dt = sdf.format(now);

		memberVO.setMember_joinDay(Date.valueOf(now_dt));

		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}

	@Override
	public int idCheck(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.idCheck", member_id);
	}

	@Override
	public MemberVO emailAndNameCheck(String member_name, String member_email, String member_email2) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("member_email", member_email);
		map.put("member_email2", member_email2);
		map.put("member_name", member_name);
		
		return sqlSession.selectOne("mapper.member.emailAndNameCheck", map);
	}

	@Override
	public MemberVO emailAndIdCheck(String member_id, String member_email, String member_email2) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("member_email", member_email);
		map.put("member_email2", member_email2);
		map.put("member_id", member_id);
		
		return sqlSession.selectOne("mapper.member.emailAndIdCheck", map);
	}

}
