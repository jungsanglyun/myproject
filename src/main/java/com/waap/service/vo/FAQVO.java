package com.waap.service.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("FAQVO")
public class FAQVO {
	private int faq_code;
	private String faq_content;
	private String faq_reply;
	private Date faq_writeDay;
	private int faq_clickCount;
	
	public int getFaq_code() {
		return faq_code;
	}
	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_reply() {
		return faq_reply;
	}
	public void setFaq_reply(String faq_reply) {
		this.faq_reply = faq_reply;
	}
	public Date getFaq_writeDay() {
		return faq_writeDay;
	}
	public void setFaq_writeDay(Date faq_writeDay) {
		this.faq_writeDay = faq_writeDay;
	}
	public int getFaq_clickCount() {
		return faq_clickCount;
	}
	public void setFaq_clickCount(int faq_clickCount) {
		this.faq_clickCount = faq_clickCount;
	}
	
	
}
