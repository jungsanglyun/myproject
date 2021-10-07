package com.waap.community.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("communityVO")
public class CommunityVO {
	private int com_no;
	private String com_title;
	private String com_content;
	private String member_id;
	private int view_count;
	private int reply_count;
	private Date regdate;
	private Date modifydate;
	
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModifydate() {
		return modifydate;
	}
	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
	
	@Override
	public String toString() {
		return "CommunityVO [com_no=" + com_no + ", com_title=" + com_title + ", com_content=" + com_content
				+ ", member_id=" + member_id + ", view_count=" + view_count + ", reply_count=" + reply_count
				+ ", regdate=" + regdate + ", modifydate=" + modifydate + "]";
	}
	
	
	
	
	
	
	
}
