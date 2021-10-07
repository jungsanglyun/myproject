package com.waap.notice.dao;

import java.util.List;
import java.util.Map;

import com.waap.common.base.SearchCriteria;
import com.waap.notice.vo.NoticeVO;



public interface NoticeDAO {

		
	//공지사항 글 목록 조회
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
		
	//공지사항 게시글 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
		
	//공지사항 글 조회
	public NoticeVO read(int notice_no) throws Exception;
		
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception;
		
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	//공지사항 조회수
	public int viewsCount(int notice_no) throws Exception;
	
}
