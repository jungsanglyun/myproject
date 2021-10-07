package com.waap.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.waap.admin.member.service.AdminMemberService;
import com.waap.common.base.BaseController;
import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.member.vo.MemberVO;
import com.waap.service.service.ServiceService;


@Controller("adminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberControllerImpl extends BaseController implements AdminMemberController{
	
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private ServiceService serviceService;
	

	@Override
	@RequestMapping(value="/adminMemberControlView.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminMemberControlView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		
		List<MemberVO> memberVOList = adminMemberService.adminMemberControlView();
		
		mav.addObject("memberVOList", memberVOList);
		
		
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/memberAllData.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView memberAllData(HttpServletRequest request, HttpServletResponse response, MemberVO memberVO, SearchCriteria scri)
			throws Exception {
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		
		Map<String, Object> MemberAllMap = adminMemberService.memberAllData(memberVO, scri);
		
	
		
		mav.addObject("serviceCustomerVOList", MemberAllMap.get("serviceCustomerVOList"));
		
		mav.addObject("memberVO", memberVO);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);

		pageMaker.setTotalCount(serviceService.serviceCustomerDataCount(scri));

		mav.addObject("pageMaker", pageMaker);
		
		
		
		
		return mav;
	}
	
	
	
}
