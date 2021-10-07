package com.waap.waap.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.waap.waap.dao.WaapDAO;
import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

@Service("waapService")
public class WaapServiceImpl implements WaapService{
	
	@Autowired
	private WaapDAO waapDAO;
	
	@Override
	public Map<String, Object> priceView(ProVO proVO, WeatherVO weatherVO, @RequestParam Map<String, String> start_endMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		List<ProVO> proVOList = waapDAO.proView(proVO, start_endMap);
		resultMap.put("proVOList", proVOList);
		
		List<WeatherVO> weatherVOList = waapDAO.weatherView(weatherVO, start_endMap);
		resultMap.put("weatherVOList", weatherVOList);
		
		resultMap.put("start_day", start_endMap.get("start_day"));
		resultMap.put("end_day", start_endMap.get("end_day"));
		
		
		return resultMap;
		
	}
	
	@Override
	public Map<String, Object> rankView(ProVO proVO, @RequestParam Map<String, String> start_endMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<ProVO> proVOList = waapDAO.proView(proVO, start_endMap);
		resultMap.put("proVOList", proVOList);
		
		resultMap.put("start_day", start_endMap.get("start_day"));
		resultMap.put("end_day", start_endMap.get("end_day"));
		
		
		
		
		
		
		return resultMap; 
				
				
	}
	
	
	
}
