package com.waap.admin.service.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.waap.admin.service.service.AdminServiceService;
import com.waap.common.base.BaseController;
import com.waap.common.base.PageMaker;
import com.waap.common.base.SearchCriteria;
import com.waap.member.vo.MemberVO;
import com.waap.service.service.ServiceService;
import com.waap.service.vo.FAQVO;
import com.waap.service.vo.ServiceCustomerVO;

@Controller("adminServiceController")
@RequestMapping(value="/admin/service")
public class AdminServiceControllerImpl extends BaseController implements AdminServiceController {
	
	@Autowired
	private AdminServiceService adminServiceService;
	
	@Autowired
	private ServiceService serviceService;
	
	
	@Override
	@RequestMapping(value="/FAQWrite.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity FAQWrite(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("FAQVO") FAQVO faqVO) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		
		HttpSession session = request.getSession();
		
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		if(memberInfo.getMember_id().equals("admin")) {
			try {
				adminServiceService.FAQWrite(faqVO);
				
				message="<script>";
				message+=" alert('글작성을 완료했습니다.');";
				message+=" location.href='"+request.getContextPath() + "/service/FAQView.do';";
				message+=("</script>");


			}catch(Exception e) {
				message="<script>";
				message+=" alert('글 작성을 실패했습니다.');";
				message+=" location.href='"+request.getContextPath() + "/admin/service/adminFAQWriteForm.do';";
				message+=("</script>");
			}
			
		
			
			
			
		}else {
			message="<script>";
			message+=" alert('관리자 계정으로 로그인해주세요');";
			message+=" location.href='"+request.getContextPath() + "/main/main.do';";
			message+=("</script>");
		}

		
		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
	}
	
	
	
	@Override
	@RequestMapping(value = "/FAQViewDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity FAQViewDelete(HttpServletRequest request, HttpServletResponse response, FAQVO faqVO)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			adminServiceService.FAQViewDelete(faqVO);
			
			message = "<script>";
			message += " alert('삭제가 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/service/FAQView.do';";
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
	@RequestMapping(value = "/FAQViewUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity FAQViewUpdate(HttpServletRequest request, HttpServletResponse response, FAQVO faqVO)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			adminServiceService.FAQViewUpdate(faqVO);
			
			message = "<script>";
			message += " alert('수정이완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/service/FAQView.do';";
			message += ("</script>");

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류로 실패했습니다. 메인으로갑니다');";
			message += " location.href='" + request.getContextPath() + "/main/main.do';";
			message += ("</script>");

			e.printStackTrace();

		}
		
		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEntity;
	}
	
	
	@Override
	@RequestMapping(value = "/adminServiceCustomerView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminServiceCustomerView(HttpServletRequest request, HttpServletResponse response, SearchCriteria scri)
			throws Exception {
		
		ModelAndView mav = new ModelAndView((String)request.getAttribute("viewName"));
		
		List<ServiceCustomerVO> serviceCustomerVOList = serviceService.serviceCustomerData("*", scri);
		
		mav.addObject("serviceCustomerVOList", serviceCustomerVOList);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(scri);
		
		pageMaker.setTotalCount(serviceService.serviceCustomerDataCount(scri));
		
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value = "/serviceCustomerViewReply.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity serviceCustomerViewReply(HttpServletRequest request, HttpServletResponse response,
			ServiceCustomerVO serviceCustomerVO) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			adminServiceService.serviceCustomerViewReply(serviceCustomerVO);
			
			message = "<script>";
			message += " alert('답변 작성이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/service/adminServiceCustomerView.do';";
			message += ("</script>");

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류로 실패했습니다. 메인으로갑니다');";
			message += " location.href='" + request.getContextPath() + "/main/main.do';";
			message += ("</script>");

			e.printStackTrace();

		}
			
		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEntity;
	}
	
	
}
