package com.waap.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waap.common.base.SearchCriteria;
import com.waap.community.vo.CommunityVO;



@Repository("communityDAO")
public class CommunityDAOImpl implements CommunityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//커뮤니티 글 작성
	@Override
	public void write(CommunityVO communityVO) throws Exception {
		
		sqlSession.insert("communityMapper.insert", communityVO);
	}
	
	//커뮤니티 목록 조회
	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("communityMapper.listPage", scri);
	}
	
	//커뮤니티 게시글 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("communityMapper.listCount", scri);
	}
	
	//커뮤니티 글 조회
	@Override
	public CommunityVO read(int com_no) throws Exception {
		return sqlSession.selectOne("communityMapper.read", com_no);
	}
	
	//커뮤니티 글 수정
	@Override
	public void update(CommunityVO communityVO) throws Exception{
		sqlSession.update("communityMapper.update", communityVO);
	}
	
	//커뮤니티 글 삭제
	@Override
	public void delete(int com_no) throws Exception{
		sqlSession.delete("communityMapper.delete", com_no);
	}
	
	//첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("communityMapper.insertFile", map);
	}
	
	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int com_no) throws Exception {
		return sqlSession.selectList("communityMapper.selectFileList", com_no);
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("communityMapper.selectFileInfo", map);
	}
	
	//첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("communityMapper.updateFile", map);
	}
	
	//커뮤니티 조회수
	@Override
	public int viewsCount(int com_no) throws Exception {
		return sqlSession.update("communityMapper.viewsCount", com_no);
	}
	
	//댓글 개수
	@Override
	public void updateReplyCount(int com_no) throws Exception {
		sqlSession.update("communityMapper.updateReplyCount", com_no);
	}
	
	//커뮤니티 최신 글 목록 조회
	@Override
	public List<CommunityVO> list_last(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("communityMapper.last_listPage", scri);
	}
	
	//커뮤니티 인기 글 목록 조회
	@Override
	public List<CommunityVO> list_count(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("communityMapper.count_listPage", scri);
	}
}

