<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>자주묻는질문 메인</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/service.css" />
  </head>

  <body>
    <div class="container">
		<h2 class="font-weight-bold mt-5">자주 묻는 질문</h2>
	</div>
    <br>
    <br>
      <div class="col-6 col-md-12">
        <div class="container">
          <div
            class="btn-group pl-3 pr-3 d-flex justify-content-center"
            role="group"
            aria-label="price-infor"
          ></div>
          <div class="container" style="width: 1000px; margin: 0px;">
            <div class="table-title">
              <table class="table table-bordered">
                <thead class="bg-light">
                  <tr>
                    <th scope="row">번호</th>
                    <th scope="row">질문</th>
                    <th scope="row">작성자</th>
                    <th scope="row">작성일</th>
                    <th scope="row">조회수</th>
                  </tr>
                </thead>
                <c:forEach var="FAQVO" items="${FAQVOList }">
                <tbody>  
                  <tr>
                    <th scope="row">${FAQVO.faq_code}</th>
                    <td><a href="${contextPath }/service/FAQViewDetail.do?faq_code=${FAQVO.faq_code}">${FAQVO.faq_content}</a></td>
                    <td>관리자</td>
                    <td>${FAQVO.faq_writeDay}</td>
                    <td>${FAQVO.faq_clickCount}</td>
                  </tr>
                </tbody>
                </c:forEach>
              </table>
              
              <c:if test="${memberInfo.member_id == 'admin' }">

					<button class= "btn btn-outline-secondary col-1"
						onclick="location.href='${contextPath}/admin/service/adminFAQWriteForm.do'">
					글 작성</button>
			</c:if>
            </div>
          </div>
        </div>
      </div>
      <!-- 창 번호 시작-->
      <div class="container">
        <div class="d-flex justify-content-center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageMaker.prev}">
                        <li class="page-item"><a class="page-link; btn btn-outline-secondary" href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(pageMaker.startPage - 1)}" aria-disabled="true">이전</a></li>
                    </c:if> 
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                            <li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
                            <a class="page-link" href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
                        </c:forEach>
                    
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                            <li class="page-item"><a class="page-link" href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                        </c:if>
                </ul>
            </nav>
        </div>
        <h5 class="text-danger mt-5">
	      고객센터 전화상담은 10시~16시 까지, (12시~1시)점심시간 상담 불가
	    </h5>
    </div>
    
    
    
  </body>
</html>