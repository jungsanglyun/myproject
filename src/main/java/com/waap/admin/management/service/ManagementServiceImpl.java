package com.waap.admin.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waap.admin.management.dao.ManagementDAO;
import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;

@Service("managementService")
public class ManagementServiceImpl implements ManagementService {
	@Autowired
	private ManagementDAO DAO;
	
	//회원 관리 메인
	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return DAO.list(scri);
	}
	
	//회원 총 몇명
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return DAO.listCount(scri);
	}
	
	//회원 상세 정보
	@Override
	public MemberVO info(String member_id) throws Exception {
		return DAO.info(member_id);
	}
	
	//회원 추방
	@Override
	public void deport(MemberVO vo) throws Exception{
		DAO.deport(vo);
	}
	
	//관리자 작성 글 목록 조회
	@Override
	public List<CommunityVO> mylist(String member_id, SearchCriteria scri) throws Exception {
		return DAO.mylist(member_id, scri);
	}
		
	//관리자 작성 글 총 개수
	@Override
	public int mylistCount(String member_id, SearchCriteria scri) throws Exception {
		return DAO.mylistCount(member_id, scri);
	}
}
