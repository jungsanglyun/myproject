package com.waap.waap.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("proVO")
public class ProVO implements Comparable<ProVO>{
		// 부류 정보
		private int pro_div_code;
		private String pro_div_name;
		
		// 품목 정보
		private int pro_sub_code;
		private String pro_sub_name;
		
		private int pro_code;
		private int pro_aver_cost;
		private String pro_unit;
		private String pro_area;
		private Date pro_period;
		
		private Integer temp_updown;
		
		public int getPro_div_code() {
			return pro_div_code;
		}
		public void setPro_div_code(int pro_div_code) {
			this.pro_div_code = pro_div_code;
		}
		public String getPro_div_name() {
			return pro_div_name;
		}
		public void setPro_div_name(String pro_div_name) {
			this.pro_div_name = pro_div_name;
		}
		public int getPro_sub_code() {
			return pro_sub_code;
		}
		public void setPro_sub_code(int pro_sub_code) {
			this.pro_sub_code = pro_sub_code;
		}
		public String getPro_sub_name() {
			return pro_sub_name;
		}
		public void setPro_sub_name(String pro_sub_name) {
			this.pro_sub_name = pro_sub_name;
		}
		public int getPro_code() {
			return pro_code;
		}
		public void setPro_code(int pro_code) {
			this.pro_code = pro_code;
		}
		public int getPro_aver_cost() {
			return pro_aver_cost;
		}
		public void setPro_aver_cost(int pro_aver_cost) {
			this.pro_aver_cost = pro_aver_cost;
		}
		public String getPro_unit() {
			return pro_unit;
		}
		public void setPro_unit(String pro_unit) {
			this.pro_unit = pro_unit;
		}
		public String getPro_area() {
			return pro_area;
		}
		public void setPro_area(String pro_area) {
			this.pro_area = pro_area;
		}
		public Date getPro_period() {
			return pro_period;
		}
		public void setPro_period(Date pro_period) {
			this.pro_period = pro_period;
		}
		
		
		public Integer getTemp_updown() {
			return temp_updown;
		}
		public void setTemp_updown(Integer temp_updown) {
			this.temp_updown = temp_updown;
		}
		
		@Override
		public int compareTo(ProVO o) {
		// TODO Auto-generated method stub
		return temp_updown.compareTo(o.getTemp_updown());
		}
		
		
}
