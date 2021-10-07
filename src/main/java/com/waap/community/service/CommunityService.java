package com.waap.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;


public interface CommunityService {
	//커뮤니티 글 작성
	public void write(CommunityVO communityVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//커뮤니티 글 목록 조회
	public List<CommunityVO> list(SearchCriteria scri) throws Exception;
	
	//커뮤니티 게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//커뮤니티 글 조회
	public CommunityVO read(int com_no) throws Exception;
	
	//커뮤니티 글 수정
	public void update(CommunityVO communityVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//커뮤니티 글 삭제
	public void delete(int com_no) throws Exception;
	
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int com_no) throws Exception;
	
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	//조회수
	public int viewsCount(int com_no) throws Exception;
	
	//댓글 개수
	public void updateReplyCount(int com_no) throws Exception;
	
	//커뮤니티 최신글 목록 조회
	public List<CommunityVO> list_last(SearchCriteria scri) throws Exception;
	
	//커뮤니티 인기글 목록 조회
	public List<CommunityVO> list_count(SearchCriteria scri) throws Exception;
	
}
