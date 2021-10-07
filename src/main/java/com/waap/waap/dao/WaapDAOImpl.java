package com.waap.waap.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

@Repository("waapDAO")
public class WaapDAOImpl implements WaapDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<WeatherVO> weatherView(WeatherVO weatherVO, @RequestParam Map<String, String> start_endMap) throws DataAccessException {
		
		Map<String, Object> weatherMap = new HashMap<String, Object>();
		
		weatherMap.put("start_day", start_endMap.get("start_day"));
		weatherMap.put("end_day", start_endMap.get("end_day"));
		weatherMap.put("weather_area", weatherVO.getWeather_area());
		
		List<WeatherVO> weatherVOList = sqlSession.selectList("mapper.waap.weatherView", weatherMap);
		
		return weatherVOList;
	}
	
	@Override
	public List<ProVO> proView(ProVO proVO, @RequestParam Map<String, String> start_endMap) throws DataAccessException {
		
		Map<String, Object> proViewMap = new HashMap<String, Object>();
		
		List<ProVO> proVOList = new ArrayList<ProVO>();
		
		try {
			
			
			proViewMap.put("pro_div_code", proVO.getPro_div_code());
			proViewMap.put("pro_area", proVO.getPro_area());
			proViewMap.put("start_day", Date.valueOf(start_endMap.get("start_day")));
			proViewMap.put("end_day", Date.valueOf(start_endMap.get("end_day")));
			
		    proVOList = sqlSession.selectList("mapper.waap.proView", proViewMap);
			
			
		}catch(Exception e){
			System.out.println("예외처리");
			System.out.println("예외처리");
			System.out.println("예외처리");
			System.out.println("예외처리");
			System.out.println("예외처리");
		}
		
		return proVOList;
	}

	
	
	
}

