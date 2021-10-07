package com.waap.community.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("replyVO")
public class ReplyVO {
	private int com_no;
	private int reply_no;
	private String reply_cont;
	private String member_id;
	private Date regdate;
	
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_cont() {
		return reply_cont;
	}
	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [com_no=" + com_no + ", reply_no=" + reply_no + ", reply_cont=" + reply_cont + ", member_id="
				+ member_id + ", regdate=" + regdate + "]";
	}
	
	
	
}
