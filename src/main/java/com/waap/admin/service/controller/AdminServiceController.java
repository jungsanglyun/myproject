package com.waap.admin.service.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.SearchCriteria;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

public interface AdminServiceController {
	
	public ResponseEntity FAQWrite(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("FAQVO") FAQVO faqVO) throws Exception;
	public ResponseEntity FAQViewUpdate(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("faqVO") FAQVO faqVO) throws Exception;	
	public ResponseEntity FAQViewDelete(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("faqVO") FAQVO faqVO) throws Exception;
	public ModelAndView adminServiceCustomerView(HttpServletRequest request, HttpServletResponse response,  SearchCriteria scri) throws Exception;
	public ResponseEntity serviceCustomerViewReply(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO) throws Exception;
}
