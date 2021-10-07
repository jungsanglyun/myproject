package com.waap.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.waap.admin.member.dao.AdminMemberDAO;
import com.waap.common.base.SearchCriteria;
import com.waap.member.vo.MemberVO;
import com.waap.service.dao.ServiceDAO;
import com.waap.service.vo.ServiceCustomerVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	@Autowired
	private ServiceDAO serviceDAO;
	
	@Override
	public List<MemberVO> adminMemberControlView() throws Exception {
		
		return adminMemberDAO.adminMemberControlView();
		
	}
	
	@Override
	public Map<String, Object> memberAllData(MemberVO memberVO, SearchCriteria scri) throws DataAccessException {
		
		Map<String, Object> memberDataMap = new HashMap<String, Object>();
		
		
		List<ServiceCustomerVO> serviceCustomerVOList = serviceDAO.serviceCustomerData(memberVO.getMember_id(), scri); 
		
		
		memberDataMap.put("serviceCustomerVOList", serviceCustomerVOList);
		
		
		
		// 커뮤니티 내가 쓴 글 기능 아직 미완성 
		
		
		
		
		return memberDataMap;
		
	}
}
