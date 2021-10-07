package com.waap.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waap.common.base.SearchCriteria;
import com.waap.notice.dao.NoticeDAO;
import com.waap.notice.vo.NoticeVO;



@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO DAO;
	

	//공지사항 목록 조회
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		return DAO.list(scri);
	}
	
	//공지사항 게시글 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return DAO.listCount(scri);
	}
	
	//공지사항 글 조회
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		return DAO.read(notice_no);
	}

	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception {
		
		return DAO.selectFileList(notice_no);
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return DAO.selectFileInfo(map);
	}
	
	//조회수
	@Override
	public int viewsCount(int notice_no) throws Exception {
		return DAO.viewsCount(notice_no);
	}	
}
