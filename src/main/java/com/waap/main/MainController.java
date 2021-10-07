package com.waap.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.community.service.CommunityService;
import com.waap.notice.service.NoticeService;
import com.waap.waap.service.WaapService;
import com.waap.waap.vo.ProVO;
import com.waap.waap.vo.WeatherVO;

@Controller("mainController")
public class MainController{

	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private WaapService waapService;

	@Autowired
	private WeatherVO weatherVO;
	
	@Autowired
	private ProVO proVO;
	
	
	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView((String)request.getAttribute("viewName"));
		
		mav.addObject("noticeList", noticeService.list(scri)); // 공지사항 데이터 가져옴
		
		mav.addObject("communityList", communityService.list(scri)); // 커뮤니티 데이터 가저옴
		
		
		// 기상, 농산물 데이터 가져옴
		
		proVO.setPro_div_code(1);
		proVO.setPro_area("서울");
		
		weatherVO.setWeather_area("서울");
		
		Map<String, String> start_endMap = new HashMap<String, String>();
		
		start_endMap.put("start_day", "2021-01-01");
		start_endMap.put("end_day", "2021-01-01");
		
		mav.addObject("pro_area", proVO.getPro_area());
		mav.addObject("pro_div_code", proVO.getPro_div_code());
		mav.addObject("weather_condition", "기온");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = waapService.priceView(proVO, weatherVO, start_endMap);
		
		mav.addObject("resultMap", resultMap);
		
		return mav;
	}
}
