package com.waap.waap.service;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

public interface WaapService {
	public Map<String, Object> priceView(ProVO proVO, WeatherVO weatherVO, @RequestParam Map<String, String> start_endMap) throws Exception;
	public Map<String, Object> rankView(ProVO proVO, @RequestParam Map<String, String> start_endMap) throws Exception; 
}
