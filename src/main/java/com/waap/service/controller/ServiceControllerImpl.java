
package com.waap.service.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.waap.common.base.BaseController;
import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;

import com.waap.member.vo.MemberVO;
import com.waap.service.service.ServiceService;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

@Controller("serviceController")
@RequestMapping(value = "/service")
public class ServiceControllerImpl extends BaseController implements ServiceController {
	@Autowired
	private ServiceService serviceService;

	@Override
	@RequestMapping(value = "/serviceCustomerView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView serviceCustomerView(HttpServletRequest request, HttpServletResponse response,
			SearchCriteria scri) throws Exception {

		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));

		HttpSession session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		
		// 로그인 안하고 1:1문의 클릭시 오류 발생 예외처리
		if(memberInfo == null) {
			return mav;
		}
		
		
		List<ServiceCustomerVO> serviceCustomerVOList = serviceService.serviceCustomerData(memberInfo.getMember_id(),
				scri);
		
		mav.addObject("serviceCustomerVOList", serviceCustomerVOList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);

		pageMaker.setTotalCount(serviceService.serviceCustomerDataCount(scri));

		mav.addObject("pageMaker", pageMaker);

		return mav;
	}

	@Override
	@RequestMapping(value = "/serviceCustomerDetailView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView serviceCustomerDetailView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("member_id") String member_id, @RequestParam("serviceCustomer_code") int serviceCustomer_code)
			throws Exception {
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));

		ServiceCustomerVO serviceCustomerVO = serviceService.serviceCustomerDataDetail(member_id, serviceCustomer_code);

		mav.addObject("serviceCustomerVO", serviceCustomerVO);
		
		List<Map<String, Object>> fileList = serviceService.selectFileList(serviceCustomer_code);
		mav.addObject("fileList", fileList);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/FAQView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FAQView(HttpServletRequest request, HttpServletResponse response, SearchCriteria scri)
			throws Exception {

		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));

		List<FAQVO> FAQVOList = serviceService.FAQView(scri);

		mav.addObject("FAQVOList", FAQVOList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);

		pageMaker.setTotalCount(serviceService.FAQViewCount(scri));

		mav.addObject("pageMaker", pageMaker);

		return mav;
	}

	@Override
	@RequestMapping(value = "/FAQViewDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FAQViewDetail(HttpServletRequest request, HttpServletResponse response, int faq_code)
			throws Exception {
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));

		FAQVO faqVO = serviceService.FAQViewDetail(faq_code);

		mav.addObject("faqVO", faqVO);

		return mav;
	}

	@Override
	@RequestMapping(value = "/serviceCustomerWrite.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity serviceCustomerWrite(MultipartHttpServletRequest mpRequest,
			ServiceCustomerVO serviceCustomerVO) throws Exception {
		
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			serviceService.serviceCustomerWrite(serviceCustomerVO, mpRequest);

			message = "<script>";
			message += " alert('작성이 완료되었습니다.');";
			message += " location.href='" + mpRequest.getContextPath() + "/service/serviceCustomerView.do';";
			message += ("</script>");

		} catch (Exception e) {

			message = "<script>";
			message += " alert('작성이 실패했습니다.');";
			message += " location.href='" + mpRequest.getContextPath() + "/service/serviceCustomerWriteView.do';";
			message += ("</script>");

			e.printStackTrace();

		}

		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEntity;
	}

	@Override
	@RequestMapping(value = "/serviceCustomerViewDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity serviceCustomerViewDelete(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			serviceService.serviceCustomerDelete(serviceCustomerVO);
			
			message = "<script>";
			message += " alert('삭제가 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/service/serviceCustomerView.do';";
			message += ("</script>");

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류로 삭제가 실패했습니다. 메인으로 돌아갑니다.');";
			message += " location.href='" + request.getContextPath() + "/main/main.do';";
			message += ("</script>");

			e.printStackTrace();

		}

		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEntity;
	}
	
	
	@Override
	@RequestMapping(value = "/serviceCustomerViewUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity serviceCustomerViewupdate(@ModelAttribute("serviceCustomerVO") ServiceCustomerVO serviceCustomerVO, @RequestParam(value="fileNoDel[]") String[] files, @RequestParam(value="fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		

		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			serviceService.serviceCustomerUpdate(serviceCustomerVO, files, fileNames, mpRequest);
			
			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + mpRequest.getContextPath() + "/service/serviceCustomerView.do';";
			message += ("</script>");

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류로 수정이 실패했습니다. 메인으로 돌아갑니다.');";
			message += " location.href='" + mpRequest.getContextPath() + "/main/main.do';";
			message += ("</script>");

			e.printStackTrace();

		}
		
		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEntity;
	}
	
	
	//첨부파일 다운로드
	@Override
	@RequestMapping(value="/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
				
		Map<String, Object> resultMap = serviceService.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("D:\\waap_project_file\\service\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	

}
