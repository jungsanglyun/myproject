package com.waap.service.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.waap.common.base.SearchCriteria;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

@Repository("serviceDAO")
public class ServiceDAOImpl implements ServiceDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ServiceCustomerVO> serviceCustomerData(String member_id, SearchCriteria scri) throws DataAccessException {
		
		
		Map<String, Object> tempMap = new HashMap<String, Object>();
		
		tempMap.put("member_id", member_id);		
		tempMap.put("rowStart", scri.getRowStart());
		tempMap.put("rowEnd", scri.getRowEnd());	
		
		if(member_id != "*") {
			List<ServiceCustomerVO> serviceCustomerVOList = sqlSession.selectList("mapper.service.serviceCustomerData", tempMap);
			return serviceCustomerVOList;
		}else {
			List<ServiceCustomerVO> serviceCustomerVOList = sqlSession.selectList("mapper.service.allServiceCustomerData", tempMap);
			return serviceCustomerVOList;
		}
		
		
	}
	
	
	@Override
	public List<FAQVO> FAQView(SearchCriteria scri) throws DataAccessException {
		List<FAQVO> FAQVOList = sqlSession.selectList("mapper.service.FAQView", scri);
		
		return FAQVOList; 
	}
	
	@Override
	public ServiceCustomerVO serviceCustomerDataDetail(String member_id, int serviceCustomer_code)
			throws DataAccessException {
		Map<String, Object> temp_map = new HashMap<String, Object>();
		
		temp_map.put("member_id", member_id);
		temp_map.put("serviceCustomer_code", serviceCustomer_code);
		
		ServiceCustomerVO serviceCustomerVO = sqlSession.selectOne("mapper.service.serviceCustomerDataDetail", temp_map);
		return serviceCustomerVO;
	}
	
	@Override
	public FAQVO FAQViewDetail(int faq_code) throws DataAccessException {
		
		FAQVO faqVO = sqlSession.selectOne("mapper.service.FAQViewDetail", faq_code);
		return faqVO;
	}
	
	@Override
	public void FAQDetailClickUpdate(int faq_code) throws DataAccessException {
		sqlSession.update("mapper.service.FAQDetailClickUpdate", faq_code);
		
	}
	
	
	@Override
	public void serviceCustomerWrite(ServiceCustomerVO serviceCustomerVO) throws DataAccessException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date(System.currentTimeMillis());
		
		String now_dt = sdf.format(now);
		
		serviceCustomerVO.setServiceCustomer_write_date(Date.valueOf(now_dt));
		
		
		sqlSession.insert("mapper.service.ServiceCustomerWrite", serviceCustomerVO);
		
	}
	
	@Override
	public int FAQViewCount(SearchCriteria scri) throws DataAccessException {
		return sqlSession.selectOne("mapper.service.FAQViewCount", scri);
	}
	
	@Override
	public int serviceCustomerDataCount(SearchCriteria scri) throws DataAccessException {
		return sqlSession.selectOne("mapper.service.serviceCustomerDataCount", scri);
	}
	
	@Override
	public void serviceCustomerDelete(ServiceCustomerVO serviceCustomerVO) throws DataAccessException {
		sqlSession.delete("mapper.service.serviceCustomerDelete", serviceCustomerVO);
		
	}
	
	@Override
	public void serviceCustomerUpdate(ServiceCustomerVO serviceCustomerVO) throws DataAccessException {
		sqlSession.update("mapper.service.serviceCustomerUpdate", serviceCustomerVO);
		
	}
	
	@Override
	public void insertFile(Map<String, Object> fileMap) throws Exception {
		
		
		
		
		sqlSession.insert("mapper.service.insertFile", fileMap);
	}
		
	@Override
	public List<Map<String, Object>> selectFileList(int serviceCustomer_code) throws Exception {
		return sqlSession.selectList("mapper.service.selectFileList", serviceCustomer_code);
	}
	
	@Override
	public void updateFile(Map<String, Object> map) throws DataAccessException {
		sqlSession.update("mapper.service.updateFile", map);
		
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("mapper.service.selectFileInfo", map);
	}
	
}
