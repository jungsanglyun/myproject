package com.waap.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waap.common.base.SearchCriteria;
import com.waap.notice.vo.NoticeVO;


@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	

	//공지사항 목록 조회
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("noticeMapper.listPage", scri);
	}
		
	//공지사항 게시글 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("noticeMapper.listCount", scri);
	}
		
	//공지사항 글 조회
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		return sqlSession.selectOne("noticeMapper.read", notice_no);
	}

	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int notice_no) throws Exception {
		return sqlSession.selectList("noticeMapper.selectFileList", notice_no);
	}
		
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("noticeMapper.selectFileInfo", map);
	}

	//공지사항 조회수
	@Override
	public int viewsCount(int notice_no) throws Exception {
		return sqlSession.update("noticeMapper.viewsCount", notice_no);
	}
}
