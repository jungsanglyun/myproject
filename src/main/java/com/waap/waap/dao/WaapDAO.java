package com.waap.waap.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

public interface WaapDAO {
	public List<WeatherVO> weatherView(WeatherVO weatherVO, @RequestParam Map<String, String> start_endMap) throws DataAccessException;
	public List<ProVO> proView(ProVO proVO, @RequestParam Map<String, String> weatherMap) throws DataAccessException;
	
}
