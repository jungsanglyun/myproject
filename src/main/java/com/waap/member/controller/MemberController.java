package com.waap.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waap.member.vo.MemberVO;



public interface MemberController {
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addMember(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("memberVO") MemberVO memberVO) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public int idCheck(HttpServletRequest request, HttpServletResponse response, @RequestParam("member_id") String member_id) throws Exception;
	
	public Map<String, Object> idFindEmail(@RequestParam("member_name") String member_name, @RequestParam("sending_member_email") String sending_member_email, @RequestParam("sending_member_email2") String sending_member_email2, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> pwFindEmail(@RequestParam("member_id") String member_id,@RequestParam("sending_member_email") String sending_member_email,@RequestParam("sending_member_email2") String sending_member_email2, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
