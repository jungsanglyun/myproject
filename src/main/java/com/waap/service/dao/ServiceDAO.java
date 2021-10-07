package com.waap.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.waap.common.base.SearchCriteria;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

public interface ServiceDAO {
	public List<ServiceCustomerVO> serviceCustomerData(String member_id, SearchCriteria scri) throws DataAccessException;
	public int serviceCustomerDataCount(SearchCriteria scri) throws DataAccessException;
	public List<FAQVO> FAQView(SearchCriteria scri) throws DataAccessException;
	public ServiceCustomerVO serviceCustomerDataDetail(String member_id, int serviceCustomer_code) throws DataAccessException;
	public FAQVO FAQViewDetail(int faq_code) throws DataAccessException;
	public void FAQDetailClickUpdate(int faq_code) throws DataAccessException;
	public void serviceCustomerWrite(ServiceCustomerVO serviceCustomerVO) throws DataAccessException;
	public void serviceCustomerDelete(ServiceCustomerVO serviceCustomerVO) throws DataAccessException;
	public int FAQViewCount(SearchCriteria scri) throws DataAccessException;
	public void serviceCustomerUpdate(ServiceCustomerVO serviceCustomerVO) throws DataAccessException;
	public void insertFile(Map<String, Object> fileMap) throws Exception;
	public void updateFile(Map<String, Object> map) throws DataAccessException;	
	public List<Map<String, Object>> selectFileList(int serviceCustomer_code) throws Exception;
	
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
}
