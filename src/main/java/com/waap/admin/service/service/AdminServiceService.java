package com.waap.admin.service.service;

import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

public interface AdminServiceService {
	public void FAQWrite(FAQVO faqVO) throws Exception;
	public void FAQViewUpdate(FAQVO faqVO) throws Exception;
	public void FAQViewDelete(FAQVO faqVO) throws Exception;
	public void serviceCustomerViewReply(ServiceCustomerVO serviceCustomerVO) throws Exception;
}
