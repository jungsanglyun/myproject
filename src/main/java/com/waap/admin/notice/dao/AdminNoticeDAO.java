package com.waap.admin.notice.dao;

import java.util.List;
import java.util.Map;

import com.waap.common.base.SearchCriteria;
import com.waap.notice.vo.NoticeVO;



public interface AdminNoticeDAO {
	//공지사항 글 작성
	public void write(NoticeVO noticeVO) throws Exception;
		
	//공지사항 글 목록 조회
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
		
	//공지사항 게시글 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
		
	//공지사항 글 조회
	public NoticeVO read(int notice_no) throws Exception;
		
	//공지사항 글 수정
	public void update(NoticeVO noticeVO) throws Exception;
		
	//공지사항 글 삭제
	public void delete(int notice_no) throws Exception;
		
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map)throws Exception;
		
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception;
		
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	//첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
		
	//공지사항 조회수
	public int viewsCount(int notice_no) throws Exception;
	
}
