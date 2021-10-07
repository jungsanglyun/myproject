package com.waap.admin.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waap.common.base.SearchCriteria;
import com.waap.notice.vo.NoticeVO;


public interface AdminNoticeService {
	//공지사항 글 작성
	public void write(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception;
		
	//공지사항 글 목록 조회
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
		
	//공지사항 게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
		
	//공지사항 글 조회
	public NoticeVO read(int notice_no) throws Exception;
		
	//공지사항 글 수정
	public void update(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
		
	//공지사항 글 삭제
	public void delete(int notice_no) throws Exception;
		
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception;
		
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	//조회수
	public int viewsCount(int notice_no) throws Exception;
	
		
}
