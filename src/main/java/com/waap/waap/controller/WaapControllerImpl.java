package com.waap.waap.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.BaseController;
import com.waap.waap.service.WaapService;
import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

@Controller("waapController")
@RequestMapping(value = "/waap")
public class WaapControllerImpl extends BaseController implements WaapController {

	@Autowired
	private WaapService waapService;

	@Autowired
	private WeatherVO weatherVO;

	@Override
	@RequestMapping(value = "/priceView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView priceView(@ModelAttribute("proVO") ProVO proVO, @RequestParam Map<String, String> start_endMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		ModelAndView mav = new ModelAndView((String)request.getAttribute("viewName"));

		if (proVO.getPro_div_code() == 0) {
			
			proVO.setPro_div_code(1);
			proVO.setPro_area("서울");
			
			weatherVO.setWeather_area("서울");
			
			start_endMap.put("start_day", "2021-01-01");
			start_endMap.put("end_day", "2021-01-01");
			
			mav.addObject("pro_area", proVO.getPro_area());
			mav.addObject("pro_div_code", proVO.getPro_div_code());
			mav.addObject("weather_condition", "기온");
			
		} else {
			

			weatherVO.setWeather_area(proVO.getPro_area());
			
			String start_day_year = start_endMap.get("start_day_year");
			String start_day_month = start_endMap.get("start_day_month");
			String start_day_day = start_endMap.get("start_day_day");
			
			String start_day = start_day_year + "-" + start_day_month + "-" +  start_day_day;

			start_endMap.put("start_day", start_day);
			
			
			String end_day_year = start_endMap.get("end_day_year");
			String end_day_month = start_endMap.get("end_day_month");
			String end_day_day = start_endMap.get("end_day_day");
			
			String end_day = end_day_year + "-" + end_day_month + "-" + end_day_day;

			start_endMap.put("end_day", end_day);
			
			mav.addObject("pro_area", proVO.getPro_area());
			mav.addObject("pro_div_code", proVO.getPro_div_code());
			mav.addObject("weather_condition", (String)request.getParameter("weather_condition"));

		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = waapService.priceView(proVO, weatherVO, start_endMap);

		mav.addObject("resultMap", resultMap);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/rankView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView rankView(@ModelAttribute("proVO") ProVO proVO, @RequestParam Map<String, String> start_endMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView((String)request.getAttribute("viewName"));

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> resultMap2 = new HashMap<String, Object>();
		
		if (proVO.getPro_div_code() == 0) {

			proVO.setPro_div_code(1);
			proVO.setPro_area("서울");

			start_endMap.put("start_day", "2021-01-01");
			start_endMap.put("end_day", "2021-01-01");
			resultMap = waapService.rankView(proVO, start_endMap);
			
			start_endMap.put("start_day", "2020-12-31");
			start_endMap.put("end_day", "2020-12-31");
			resultMap2 = waapService.rankView(proVO, start_endMap);
				
			List<ProVO> proVOList = (List<ProVO>)resultMap.get("proVOList");
			List<ProVO> proVOList2 = (List<ProVO>)resultMap2.get("proVOList");
			
			
			for(int i=0; i<proVOList.size();i++) {
				proVOList.get(i).setTemp_updown(proVOList.get(i).getPro_aver_cost() - proVOList2.get(i).getPro_aver_cost());
			}
			
			Collections.sort(proVOList, Collections.reverseOrder());
			
			
			resultMap.put("start_day", "2020-12-31");
			resultMap.put("end_day", "2020-12-31");
			
			resultMap.put("proVOList", proVOList);
			
		}else {
			String start_day_year = start_endMap.get("start_day_year");
			String start_day_month = start_endMap.get("start_day_month");
			String start_day_day = start_endMap.get("start_day_day");
			
			String start_day = start_day_year + "-" + start_day_month + "-" +  start_day_day;
			
			start_endMap.put("start_day", start_day);
			start_endMap.put("end_day", start_day);
			
			resultMap = waapService.rankView(proVO, start_endMap);
			
			resultMap.put("start_day", start_day);
			
			
			String end_day_year = start_endMap.get("end_day_year");
			String end_day_month = start_endMap.get("end_day_month");
			String end_day_day = start_endMap.get("end_day_day");
			
			String end_day = end_day_year + "-" + end_day_month + "-" + end_day_day;
			
			start_endMap.put("start_day", end_day);
			start_endMap.put("end_day", end_day);
			
			resultMap2 = waapService.rankView(proVO, start_endMap);
			
			resultMap.put("end_day", end_day);
			
			List<ProVO> proVOList = (List<ProVO>)resultMap.get("proVOList");
			List<ProVO> proVOList2 = (List<ProVO>)resultMap2.get("proVOList");
			
			
			if(proVOList2.size() > 0 && proVOList.size() >0 ) {
				for(int i=0; i<proVOList.size();i++) {
					proVOList2.get(i).setTemp_updown(proVOList.get(i).getPro_aver_cost() - proVOList2.get(i).getPro_aver_cost());
				}
				
				Collections.sort(proVOList2, Collections.reverseOrder());
			}
			
			
			resultMap.put("proVOList", proVOList2);
			
			
		}

		
		
		

		mav.addObject("resultMap", resultMap);
		mav.addObject("resultMap2", resultMap2);
		
		return mav;

	}

}
