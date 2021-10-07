package com.waap.waap.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

public interface WaapController {
	public ModelAndView priceView(@ModelAttribute("proVO") ProVO proVO, @RequestParam Map<String, String> start_endMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView rankView(@ModelAttribute("proVO") ProVO proVO, @RequestParam Map<String, String> start_endMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
