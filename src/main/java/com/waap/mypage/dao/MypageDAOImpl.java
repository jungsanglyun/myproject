package com.waap.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;




@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 마이페이지 정보 조회
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		if(vo.getMember_id() == "admin") {
			
		}
		
		return sqlSession.selectList("mapper.member.list", vo);
	}
	
	// 마이페이지 수정
	@Override
	public void update(MemberVO vo) throws Exception {
		sqlSession.update("mapper.member.update", vo);
	}
	
	//패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception{
		int result = sqlSession.selectOne("mapper.member.passChk", vo);
		return result;
	}
	
	//회원 탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception{
		sqlSession.delete("mapper.member.withdrawal", vo);
	}
	
	//마이페이지 내가쓴글 목록 조회
	@Override
	public List<CommunityVO> mylist(String member_id, SearchCriteria scri) throws Exception{
		
		Map<String, Object> tempMap = new HashMap<String, Object>();
		
		tempMap.put("member_id", member_id);
		tempMap.put("rowStart", scri.getRowStart());
		tempMap.put("rowEnd", scri.getRowEnd());	
		
		
		return sqlSession.selectList("communityMapper.mylist", tempMap);
	}
	
	//마이페이지 게시글 총 개수
	@Override
	public int mylistCount(String member_id, SearchCriteria scri) throws Exception {
		Map<String, Object> tempMap = new HashMap<String, Object>();
		
		tempMap.put("member_id", member_id);
		tempMap.put("rowStart", scri.getRowStart());
		tempMap.put("rowEnd", scri.getRowEnd());	
		return sqlSession.selectOne("communityMapper.mylistCount", tempMap);
	}
	
	
}
