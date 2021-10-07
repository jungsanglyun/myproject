package com.waap.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;
import com.waap.mypage.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO DAO;
	
	//마이페이지 정보 조회
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		return DAO.list(vo);
	}
	
	//마이페이지 수정
	@Override
	public void update(MemberVO vo) throws Exception {
		DAO.update(vo);
	}
	
	//패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception{
		int result = DAO.passChk(vo);
		return result;
	}
	
	//회원 탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception{
		DAO.withdrawal(vo);
	}
	
	//마이페이지 내가쓴글 목록 조회
	@Override
	public List<CommunityVO> mylist(String member_id, SearchCriteria scri) throws Exception {
		return DAO.mylist(member_id, scri);
	}
	
	//마이페이지 게시글 총 개수
	@Override
	public int mylistCount(String member_id, SearchCriteria scri) throws Exception {
		return DAO.mylistCount(member_id, scri);
	}
	
	
}
