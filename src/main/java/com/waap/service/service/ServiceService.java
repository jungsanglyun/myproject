package com.waap.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waap.common.base.SearchCriteria;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

public interface ServiceService {
	public List<ServiceCustomerVO> serviceCustomerData(String member_id, SearchCriteria scri) throws Exception;
	public List<FAQVO> FAQView(SearchCriteria scri) throws Exception;
	public ServiceCustomerVO serviceCustomerDataDetail(String member_id, int serviceCustomer_code) throws Exception;
	public FAQVO FAQViewDetail(int faq_code) throws Exception;
	public void serviceCustomerWrite(ServiceCustomerVO serviceCustomerVO, MultipartHttpServletRequest mpRequest) throws Exception;
	public void serviceCustomerDelete(ServiceCustomerVO serviceCustomerVO) throws Exception;
	public int FAQViewCount(SearchCriteria scri) throws Exception;
	public int serviceCustomerDataCount(SearchCriteria scri) throws Exception;
	public void serviceCustomerUpdate(@ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO, @RequestParam(value="fileNoDel[]") String[] files, @RequestParam(value="fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int serviceCustomer_code) throws Exception;
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}
