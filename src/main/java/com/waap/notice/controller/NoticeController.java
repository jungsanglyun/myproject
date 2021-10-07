package com.waap.notice.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.notice.service.NoticeService;
import com.waap.notice.vo.NoticeVO;


@Controller("noticeController")
@RequestMapping(value="/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;


	// 공지사항 목록 조회
	@RequestMapping(value="/list.do",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView list(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	// 공지사항 조회
		@RequestMapping(value="/readView.do", method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView read(@RequestParam("notice_no") int notice_no, NoticeVO noticeVO, SearchCriteria scri,  
				HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			//조회수 증가
			service.viewsCount(notice_no);
			
			String viewName = (String)request.getAttribute("viewName");
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("read", service.read(noticeVO.getNotice_no()));
			mav.addObject("scri", scri);

			List<Map<String, Object>> fileList = service.selectFileList(noticeVO.getNotice_no());
			mav.addObject("file", fileList);
			
			return mav;
			
		}
		

		
	//첨부파일 다운로드
	@RequestMapping(value="/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
			
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("D:\\waap_project_file\\notice\\file\\"+storedFileName));
			
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
