package com.waap.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waap.common.base.SearchCriteria;
import com.waap.common.util.FileUtilsC;
import com.waap.community.dao.CommunityDAO;
import com.waap.community.vo.CommunityVO;



@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDAO DAO;
	
	@Autowired
	private FileUtilsC fileUtils;
	
	//커뮤니티 글 작성
	@Override
	public void write(CommunityVO communityVO, MultipartHttpServletRequest mpRequest) throws Exception {
		DAO.write(communityVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(communityVO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			DAO.insertFile(list.get(i));
		}	
	}
	
	//커뮤니티 목록 조회
	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception {
		return DAO.list(scri);
	}
	
	//커뮤니티 게시글 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return DAO.listCount(scri);
	}
	
	//커뮤니티 글 조회
	@Override
	public CommunityVO read(int com_no) throws Exception {
		return DAO.read(com_no);
	}
	
	//커뮤니티 글 수정
	public void update(CommunityVO communityVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{
		DAO.update(communityVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(communityVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("y")) {
				DAO.insertFile(tempMap);
			}else {
				DAO.updateFile(tempMap);
			}
		}
	}
	
	//커뮤니티 글 삭제
	public void delete(int com_no) throws Exception {
		DAO.delete(com_no);
	}
	
	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int com_no) throws Exception {
		
		return DAO.selectFileList(com_no);
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return DAO.selectFileInfo(map);
	}
	
	//조회수
	@Override
	public int viewsCount(int com_no) throws Exception {
		return DAO.viewsCount(com_no);
	}
	
	//댓글 개수
	@Override
	public void updateReplyCount(int com_no) throws Exception {
		DAO.updateReplyCount(com_no);
	}
	
	//커뮤니티 최신글 목록 조회
	@Override
	public List<CommunityVO> list_last(SearchCriteria scri) throws Exception {
		return DAO.list_last(scri);
	}
	
	//커뮤니티 최신글 목록 조회
	@Override
	public List<CommunityVO> list_count(SearchCriteria scri) throws Exception {
		return DAO.list_count(scri);
	}
}
