package com.waap.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.waap.common.base.SearchCriteria;
import com.waap.member.vo.MemberVO;

public interface AdminMemberService {
	public List<MemberVO> adminMemberControlView() throws Exception;
	public Map<String, Object> memberAllData(MemberVO memberVO, SearchCriteria scri) throws DataAccessException;
}
