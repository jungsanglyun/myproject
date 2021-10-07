<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>자주묻는질문 상세</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
  </head>
  <script>
	var update;
		
	function FAQDetailViewupdate(){
		adminUpdateContent = document.getElementById('adminUpdateContent');
		adminUpdateContent.disabled = false;
		
		updateContent = document.getElementById('adminUpdateReply');
		adminUpdateReply.disabled = false;
		
		document.getElementById('admin_mode').style.display ="none";
		
		document.getElementById('UpdateMode').style.display ="block";	
	
	}

</script>
  <body>
    <div class="container">
		<h2 class="font-weight-bold mt-5" align="center">자주 묻는 질문 상세페이지</h2>
	</div>
	<br>
	<br>
	<form action="" id="ServiceCustomerDetailViewForm">
      <!-- 메인 테이블 시작 -->
      <div class="container">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col-1" class="bg-light">번호</th>
                <td scope="col-1">${faqVO.faq_code}</td>
                <th scope="col-1" class="bg-light">작성자</th>
                <td scope="col-3">관리자</td>
                <th scope="col-1" class="bg-light">작성일</th>
                <td scope="col-2">${faqVO.faq_writeDay}</td>
                <th scope="col-1" class="bg-light">조회수</th>
                <td scope="col-2">${faqVO.faq_clickCount}</td>
              </tr>
              <tr>
                <th scope="col" class="bg-light align-top">질문</th>
                <td scope="col" colspan="11">
                    <textarea id="adminUpdateContent" class="form-control" name="faq_content" maxlength="40" rows="1" style="width:100%; resize: none; background: transparent; border:0; text-align:left" spellcheck="false" disabled>${faqVO.faq_content}</textarea>
                </td>
              </tr>
            </thead>
            <tbody>
            <tr>
           	  <th scope="col" class="bg-light">답변</th>
              <td colspan="12" style="height: 350px">
                <textarea id="adminUpdateReply" class="form-control" name="faq_reply" maxlength="40" rows="10" style="width:100%; border:none; background: transparent; border:0; resize: none; text-align:left"  spellcheck="false" disabled> ${faqVO.faq_reply}</textarea>
              </td>
             </tr>
            </tbody>
          </table>
    
          <input type="hidden" value="${faqVO.faq_code }" name="faq_code">
          
          <c:if test="${memberInfo.member_id == 'admin'}">
			<div id="admin_mode">
				<input type="button" class="btn btn-outline-secondary col-1"  onclick=FAQDetailViewupdate() value="수정">
				<input type="submit" class="btn btn-outline-secondary col-1"  value="삭제" onclick="javascript:form.action='${contextPath}/admin/service/FAQViewDelete.do'">
			</div>
			
			<div id="UpdateMode" style="display:none;">
				<input type="submit" class="btn btn-outline-secondary col-1" value="수정완료" onclick="javascript:form.action='${contextPath}/admin/service/FAQViewUpdate.do';">
				<input type="button" class="btn btn-outline-secondary col-1" onclick="location.href='${contextPath}/service/FAQViewDetail.do?member_id=${memberInfo.member_id}&faq_code=${faqVO.faq_code }'" value="수정취소">
			</div>						
		</c:if>
		<div class="d-flex justify-content-center">
          <button
            type="button"
            class="btn btn-outline-secondary btn-sm mr-2"
            onclick="location.href='${contextPath}/service/FAQView.do'"
          >
            목록
          </button>
        </div>
        </div>
      </div>
      
      
     </form>
  </body>
</html>