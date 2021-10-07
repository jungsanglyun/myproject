package com.waap.admin.management.dao;

import java.util.List;

import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;

public interface ManagementDAO {
	
	//회원 관리 메인
	public List<MemberVO> list(SearchCriteria scri) throws Exception;
	
	//회원 총 몇명
	public int listCount(SearchCriteria scri) throws Exception;
	
	//회원 상세 정보
	public MemberVO info(String member_id) throws Exception;
	
	//회원 추방
	public void deport(MemberVO vo) throws Exception;
	
	//관리자 작성 글 목록 조회
	public List<CommunityVO> mylist(String member_id, SearchCriteria scri) throws Exception;
		
	//관리자 작성 글 총 개수
	public int mylistCount(String member_id, SearchCriteria scri) throws Exception;
	
}
