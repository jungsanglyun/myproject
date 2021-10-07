package com.waap.admin.management.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waap.admin.management.service.ManagementService;
import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;

@Controller("managementController")
@RequestMapping("/admin/management")
public class ManagementController {
	@Autowired
	private ManagementService service;
	
	//회원 관리 메인
	@RequestMapping(value="/mmm.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView list(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("adminlist", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	//회원 상세 정보
	@RequestMapping(value="/minfo.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView info(MemberVO vo, HttpServletRequest request) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("info", service.info(vo.getMember_id()));
		
		return mav;
	}
	
	//회원추방
	@RequestMapping(value="/deportView.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView deport(MemberVO vo, HttpServletRequest request) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("info", service.info(vo.getMember_id()));
		
		return mav;
	}
		
	@RequestMapping(value="/deport.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String withdrawal(MemberVO vo) throws Exception{
			
		service.deport(vo);

		return "redirect:/admin/management/mmm.do";
		
	}
	
	//관리자 작성 글 목록 조회
	@RequestMapping(value="/mylist.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mylist(@RequestParam("member_id") String member_id, CommunityVO communityVO, SearchCriteria scri, HttpSession session, HttpServletRequest request) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("list", service.mylist(member_id, scri));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.mylistCount(member_id, scri));
		
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("member_id", member_id);
		return mav;
	}
}
