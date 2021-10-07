package com.waap.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waap.common.base.SearchCriteria;
import com.waap.common.util.FileUtilsC;
import com.waap.common.util.FileUtilsS;
import com.waap.service.dao.ServiceDAO;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

@Service("serviceService")
public class ServiceServiceImpl implements ServiceService{
	
	@Autowired
	private ServiceDAO serviceDAO;
	
	@Autowired
	private FileUtilsS fileUtilsS;
	
	
	@Override
	public List<ServiceCustomerVO> serviceCustomerData(String member_id, SearchCriteria scri) throws Exception {		
		return serviceDAO.serviceCustomerData(member_id, scri);
	}
	
	@Override
	public int serviceCustomerDataCount(SearchCriteria scri) throws Exception {
		return serviceDAO.serviceCustomerDataCount(scri);
	}
	
	
	@Override
	public List<FAQVO> FAQView(SearchCriteria scri) throws Exception {
		return serviceDAO.FAQView(scri);
	}
	
	@Override
	public int FAQViewCount(SearchCriteria scri) throws Exception {
		
		return serviceDAO.FAQViewCount(scri);
	}
	
	
	@Override
	public ServiceCustomerVO serviceCustomerDataDetail(String member_id, int serviceCustomer_code) throws Exception {
		
		return serviceDAO.serviceCustomerDataDetail(member_id, serviceCustomer_code);
	}
	
	
	@Override
	public FAQVO FAQViewDetail(int faq_code) throws Exception {
		
		serviceDAO.FAQDetailClickUpdate(faq_code);
		FAQVO faqVO = serviceDAO.FAQViewDetail(faq_code);
		return faqVO;

	}
	
	@Override
	public void serviceCustomerWrite(ServiceCustomerVO serviceCustomerVO, MultipartHttpServletRequest mpRequest) throws Exception {
		serviceDAO.serviceCustomerWrite(serviceCustomerVO);	
		
		List<Map<String, Object>> fileDataList = fileUtilsS.parseInsertFileInfo(serviceCustomerVO, mpRequest);
		
		for(int i=0; i<fileDataList.size(); i++) {
			
			serviceDAO.insertFile(fileDataList.get(i));
		}
		
		
	}
	
	
	@Override
	public void serviceCustomerDelete(ServiceCustomerVO serviceCustomerVO) throws Exception {
		serviceDAO.serviceCustomerDelete(serviceCustomerVO);
		
	}
	
	@Override
	public void serviceCustomerUpdate(@ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO, @RequestParam(value="fileNoDel[]") String[] files, @RequestParam(value="fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		serviceDAO.serviceCustomerUpdate(serviceCustomerVO);
		
		List<Map<String, Object>> list = fileUtilsS.parseUpdateFileInfo(serviceCustomerVO, files, fileNames, mpRequest);
		
		Map<String, Object> tempMap = null;
		
		int size = list.size();
		
		for(int i=0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("y")) {
				serviceDAO.insertFile(tempMap);
			}else {
				serviceDAO.updateFile(tempMap);
			}
		}
		
		
	}
	
	
	@Override
	public List<Map<String, Object>> selectFileList(int serviceCustomer_code) throws Exception {
		return serviceDAO.selectFileList(serviceCustomer_code);
		
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return serviceDAO.selectFileInfo(map);
	}
	
	
}
