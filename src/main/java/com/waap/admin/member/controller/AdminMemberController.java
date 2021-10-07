package com.waap.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.SearchCriteria;
import com.waap.member.vo.MemberVO;

public interface AdminMemberController {
	
	public ModelAndView adminMemberControlView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberAllData(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("memberVO") MemberVO memberVO, SearchCriteria scri) throws Exception;
	
	
	
	
}
