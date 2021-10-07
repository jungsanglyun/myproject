package com.waap.admin.service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waap.admin.service.dao.AdminServiceDAO;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

@Service("adminServiceService")
public class AdminServiceServiceImpl implements AdminServiceService{
	
	
	@Autowired
	private AdminServiceDAO adminServiceDAO;
		
	@Override
	public void FAQWrite(FAQVO faqVO) throws Exception {
		adminServiceDAO.FAQWrite(faqVO);
		
	}
	
	
	@Override
	public void FAQViewDelete(FAQVO faqVO) throws Exception {
		adminServiceDAO.FAQViewDelete(faqVO);
		
	}
	
	@Override
	public void FAQViewUpdate(FAQVO faqVO) throws Exception {
		adminServiceDAO.FAQViewUpdate(faqVO);
		
	}
	
	
	@Override
	public void serviceCustomerViewReply(ServiceCustomerVO serviceCustomerVO) throws Exception {
		adminServiceDAO.serviceCustomerViewReply(serviceCustomerVO);
		
	}
	
}
