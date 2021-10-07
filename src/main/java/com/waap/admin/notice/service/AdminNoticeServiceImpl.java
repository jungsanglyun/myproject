package com.waap.admin.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waap.admin.notice.dao.AdminNoticeDAO;
import com.waap.common.base.SearchCriteria;
import com.waap.common.util.FileUtilsN;
import com.waap.notice.vo.NoticeVO;



@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	private AdminNoticeDAO DAO;
	
	@Autowired
	private FileUtilsN fileUtilsN;
	
	//공지사항 글 작성
	@Override
	public void write(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception {
		DAO.write(noticeVO);
		
		List<Map<String,Object>> list = fileUtilsN.parseInsertFileInfo(noticeVO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			DAO.insertFile(list.get(i));
		}
	}
	
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
	
	//공지사항 글 수정
	public void update(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{
		DAO.update(noticeVO);
		
		List<Map<String, Object>> list = fileUtilsN.parseUpdateFileInfo(noticeVO, files, fileNames, mpRequest);
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
	
	//공지사항 글 삭제
	public void delete(int notice_no) throws Exception {
		DAO.delete(notice_no);
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
