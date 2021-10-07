package com.waap.waap.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("weatherVO")
public class WeatherVO {
	private int weather_code;
	private Date weather_period;
	private String weather_area;
	private Double weather_aver_tem;
	private Double weather_high_tem;
	private String weather_low_tem;
	private Double weather_precipitation;
	private Double weather_aver_wind;
	private Double weather_high_wind;
	public int getWeather_code() {
		return weather_code;
	}
	public void setWeather_code(int weather_code) {
		this.weather_code = weather_code;
	}
	public Date getWeather_period() {
		return weather_period;
	}
	public void setWeather_period(Date weather_period) {
		this.weather_period = weather_period;
	}
	public String getWeather_area() {
		return weather_area;
	}
	public void setWeather_area(String weather_area) {
		this.weather_area = weather_area;
	}
	public double getWeather_aver_tem() {
		return weather_aver_tem;
	}
	public void setWeather_aver_tem(double weather_aver_tem) {
		this.weather_aver_tem = weather_aver_tem;
	}
	public double getWeather_high_tem() {
		return weather_high_tem;
	}
	public void setWeather_high_tem(double weather_high_tem) {
		this.weather_high_tem = weather_high_tem;
	}
	public String getWeather_low_tem() {
		return weather_low_tem;
	}
	public void setWeather_low_tem(String weather_low_tem) {
		this.weather_low_tem = weather_low_tem;
	}
	public double getWeather_precipitation() {
		return weather_precipitation;
	}
	public void setWeather_precipitation(double weather_precipitation) {
		this.weather_precipitation = weather_precipitation;
	}
	public double getWeather_aver_wind() {
		return weather_aver_wind;
	}
	public void setWeather_aver_wind(double weather_aver_wind) {
		this.weather_aver_wind = weather_aver_wind;
	}
	public double getWeather_high_wind() {
		return weather_high_wind;
	}
	public void setWeather_high_wind(double weather_high_wind) {
		this.weather_high_wind = weather_high_wind;
	}
	
	
	
	
	
	
	
}
