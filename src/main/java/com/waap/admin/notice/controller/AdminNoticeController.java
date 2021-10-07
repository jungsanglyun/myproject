package com.waap.admin.notice.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waap.admin.notice.service.AdminNoticeService;
import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.notice.vo.NoticeVO;


@Controller("AdminNoticeController")
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {

	@Autowired
	private AdminNoticeService service;

	
	// 공지사항 글 작성 화면
	@RequestMapping(value="/writeView.do",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView writeView(HttpServletRequest request)  throws Exception{
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	// 공지사항 글 작성
	@RequestMapping(value="/write.do",method={RequestMethod.POST,RequestMethod.GET})
	public String write(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception{
		
		service.write(noticeVO, mpRequest);
		return "redirect:/notice/list.do";
	}
	
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
		
	// 공지사항 수정뷰
	@RequestMapping(value="/updateView.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView updateView(@ModelAttribute("scri") NoticeVO noticeVO, SearchCriteria scri,
			     HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String viewName = (String)request.getAttribute("viewName");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
			
		mav.addObject("update", service.read(noticeVO.getNotice_no()));
		mav.addObject("scri", scri);
			
		List<Map<String, Object>> fileList = service.selectFileList(noticeVO.getNotice_no());
		mav.addObject("file", fileList);
			
		return mav;
	}
		
	// 공지사항 수정
	@RequestMapping(value="/update.do", method={RequestMethod.POST,RequestMethod.GET})
	public String update(@ModelAttribute("scri") NoticeVO noticeVO, SearchCriteria scri, RedirectAttributes rttr,
						 @RequestParam(value="fileNoDel[]") String[] files,
						 @RequestParam(value="fileNameDel[]") String[] fileNames,
						 MultipartHttpServletRequest mpRequest) throws Exception {
		service.update(noticeVO, files, fileNames, mpRequest);
			
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/notice/list.do";
			
	}
		
	//공지사항 삭제
	@RequestMapping(value="/delete.do", method={RequestMethod.POST,RequestMethod.GET})
	public String delete(NoticeVO noticeVO) throws Exception {
		service.delete(noticeVO.getNotice_no());
			
		return "redirect:/notice/list.do";
			
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
