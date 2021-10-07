package com.waap.notice.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private int notice_no;
	private String notice_title;
	private String notice_cont;
	private String member_id;
	private Date regdate;
	private int view_count;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_cont() {
		return notice_cont;
	}
	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
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
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_cont=" + notice_cont
				+ ", member_id=" + member_id + ", regdate=" + regdate + ", view_count=" + view_count + "]";
	}
	
	
	
	
	
	
	
	
}
