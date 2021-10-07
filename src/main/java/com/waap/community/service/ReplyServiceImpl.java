package com.waap.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waap.community.dao.ReplyDAO;
import com.waap.community.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO DAO;
	
	@Override
	public List<ReplyVO> readReply(int com_no) throws Exception {
		return DAO.readReply(com_no);
	}
	
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		DAO.writeReply(vo);
	}
	
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		DAO.updateReply(vo);
	}
	
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		DAO.deleteReply(vo);
	}
	
	@Override
	public ReplyVO selectReply(int reply_no) throws Exception {
		return DAO.selectReply(reply_no);
	}
}
