package com.waap.mypage.service;

import java.util.List;

import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;

public interface MypageService {
	
	//마이페이지 정보 조회
	public List<MemberVO> list(MemberVO vo) throws Exception;
	
	//마이페이지 수정
	public void update(MemberVO vo) throws Exception;
	
	//패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void withdrawal(MemberVO vo) throws Exception;
	
	//마이페이지 내가쓴글 목록 조회
	public List<CommunityVO> mylist(String member_id, SearchCriteria scri) throws Exception;
	
	//마이페이지 게시글 총 개수
	public int mylistCount(String member_id, SearchCriteria scri) throws Exception;
	
	
}
