package com.waap.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waap.community.vo.ReplyVO;

@Repository("replyDAO")
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int com_no) throws Exception {
		return sqlSession.selectList("replyMapper.readReply", com_no);
	}
	
	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sqlSession.insert("replyMapper.writeReply", vo);
	}
	
	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sqlSession.update("replyMapper.updateReply", vo);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sqlSession.delete("replyMapper.deleteReply", vo);
	}
	
	//선택된 댓글 조회
	public ReplyVO selectReply(int reply_no) throws Exception {
		return sqlSession.selectOne("replyMapper.selectReply", reply_no);
	}
}
