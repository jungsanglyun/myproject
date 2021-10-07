package com.waap.admin.service.dao;

import org.springframework.dao.DataAccessException;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

public interface AdminServiceDAO {
	public void FAQWrite(FAQVO faqVO) throws DataAccessException; 
	public void FAQViewUpdate(FAQVO faqVO) throws DataAccessException;
	public void FAQViewDelete(FAQVO faqVO) throws DataAccessException;
	public void serviceCustomerViewReply(ServiceCustomerVO serviceCustomerVO) throws DataAccessException;
}
