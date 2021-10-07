package com.waap.service.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("serviceCustomerVO")
public class ServiceCustomerVO {
	private int serviceCustomer_code;
	private String serviceCustomer_title;
	private String serviceCustomer_content;
	private Date serviceCustomer_write_date;
	private String serviceCustomer_reply;
	private String member_id;
	
	
	public int getServiceCustomer_code() {
		return serviceCustomer_code;
	}
	public void setServiceCustomer_code(int serviceCustomer_code) {
		this.serviceCustomer_code = serviceCustomer_code;
	}
	public String getServiceCustomer_title() {
		return serviceCustomer_title;
	}
	public void setServiceCustomer_title(String serviceCustomer_title) {
		this.serviceCustomer_title = serviceCustomer_title;
	}
	public Date getServiceCustomer_write_date() {
		return serviceCustomer_write_date;
	}
	public void setServiceCustomer_write_date(Date serviceCustomer_write_date) {
		this.serviceCustomer_write_date = serviceCustomer_write_date;
	}
	public String getServiceCustomer_reply() {
		return serviceCustomer_reply;
	}
	public void setServiceCustomer_reply(String serviceCustomer_reply) {
		this.serviceCustomer_reply = serviceCustomer_reply;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getServiceCustomer_content() {
		return serviceCustomer_content;
	}
	public void setServiceCustomer_content(String serviceCustomer_content) {
		this.serviceCustomer_content = serviceCustomer_content;
	}
	
		
}
