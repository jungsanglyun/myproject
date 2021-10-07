package com.waap.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;
import com.waap.member.vo.MemberVO;
import com.waap.mypage.service.MypageService;

@Controller("mypageController")
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MypageService service;
	
	//마이페이지 정보 조회
	@RequestMapping(value="/list.do",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView list(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("list", service.list(vo));
		
		return mav;
	}
	
	//마이페이지 내정보 수정뷰
	@RequestMapping(value="/updateView.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateView(HttpServletRequest request) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//마이페이지 내정보 수정
	@RequestMapping(value="/update.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String update(MemberVO vo, HttpSession session) throws Exception {
		
		service.update(vo);
		
		//세션 종료 (로그아웃)
		session.invalidate();
		
		return "redirect:/mypage/list.do";
	}
	
	//비밀번호 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = service.passChk(vo);
		
		return result;
	}
	
	//회원탈퇴
	@RequestMapping(value="/withdrawalView.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView withdrawalView(HttpServletRequest request) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/withdrawal.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String withdrawal(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		// 세션에서 회원정보 저장
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		
		// 세션에 저장된 패스워드
		String sessionPass = memberInfo.getMember_pw();	
		
		// vo에 입력된 패스워드
		String voPass = vo.getMember_pw();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/mypage/withdrawalView.do";
		}
		
		service.withdrawal(vo);
		session.invalidate();

		return "redirect:/main/main.do";
	
	}
	
	//마이페이지 내가 쓴글 목록 조회
	@RequestMapping(value="/mylist.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mylist(SearchCriteria scri, HttpSession session, HttpServletRequest request) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("list", service.mylist(memberInfo.getMember_id(), scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.mylistCount(memberInfo.getMember_id(), scri));
		mav.addObject("pageMaker", pageMaker);
		
		
		return mav;
	}
	
	
	
}
