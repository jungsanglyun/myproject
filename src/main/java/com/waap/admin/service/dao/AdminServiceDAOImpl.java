package com.waap.admin.service.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

@Repository("adminServiceDAO")
public class AdminServiceDAOImpl implements AdminServiceDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public void FAQWrite(FAQVO faqVO) throws DataAccessException {
		
		

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date(System.currentTimeMillis());
		
		String now_dt = sdf.format(now);
		
		
		faqVO.setFaq_writeDay(Date.valueOf(now_dt));
		
		
		sqlsession.insert("mapper.service.FAQWrite", faqVO);
	}
	
	
	@Override
	public void FAQViewDelete(FAQVO faqVO) throws DataAccessException {
		sqlsession.delete("mapper.service.FAQViewDelete", faqVO);
		
	}
	
	@Override
	public void FAQViewUpdate(FAQVO faqVO) throws DataAccessException {
		sqlsession.update("mapper.service.FAQViewUpdate", faqVO);
		
	}
	
	
	@Override
	public void serviceCustomerViewReply(ServiceCustomerVO serviceCustomerVO) throws DataAccessException {
		sqlsession.update("mapper.service.serviceCustomerViewReply", serviceCustomerVO);
		
	}
	
}
