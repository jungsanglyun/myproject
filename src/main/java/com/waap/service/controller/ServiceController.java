package com.waap.service.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.SearchCriteria;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;



public interface ServiceController {
	public ModelAndView serviceCustomerView(HttpServletRequest request, HttpServletResponse response, SearchCriteria scri) throws Exception;
	public ModelAndView FAQView(HttpServletRequest request, HttpServletResponse response, SearchCriteria scri) throws Exception;
	public ModelAndView serviceCustomerDetailView(HttpServletRequest request, HttpServletResponse response, @RequestParam("member_id") String member_id, @RequestParam("serviceCustomer_code") int serviceCustomer_code) throws Exception;
	public ModelAndView FAQViewDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("faq_code") int faq_code) throws Exception;
	public ResponseEntity serviceCustomerWrite(MultipartHttpServletRequest mpRequest, @ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO) throws Exception;
	public ResponseEntity serviceCustomerViewDelete(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO) throws Exception;
	public ResponseEntity serviceCustomerViewupdate(@ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO, @RequestParam(value="fileNoDel[]") String[] files, @RequestParam(value="fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception;
	
}
