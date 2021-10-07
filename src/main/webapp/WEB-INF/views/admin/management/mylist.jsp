<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
  
  </head>
  <body>
    <!-- 타이틀 시작-->
    <div class="container">
      <h2 class="font-weight-bold mt-5 mb-4">내가 쓴 글 목록</h2>
    </div>
    <!-- 타이틀 끝 -->

    <!-- 메인 테이블 시작 -->
    <div class="container">
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead class="bg-light text-center">
            <tr>
              <th scope="col-1" class="col-1">번호</th>
              <th scope="col-7"class="col-7">제목</th>
              <th scope="col-2"class="col-2">작성일</th>
              <th scope="col-2"class="col-2">수정일</th>
            </tr>
          </thead>
          <tbody class="text-center">
          <c:forEach items="${list}" var = "list">
			<c:if test="${memberInfo.member_id != list.member_id && member_id == list.member_id }">
            <tr>
              <th scope="row">${list.com_no}</th>
              <td class="cursor_test text-left ">
                <a href="${contextPath}/community/readView.do?com_no=${list.com_no}"><c:out value="${list.com_title}" /></a>
              </td>
              <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
              <td><fmt:formatDate value="${list.modifydate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            </c:if>
          </c:forEach> 
          </tbody>
        </table>
      </div>
    </div>
    <!-- 메인 테이블 끝 -->

    <!-- 창 번호 시작 -->
    <div class="container">
      <div class="d-flex justify-content-center">
        <nav aria-label="Page navigation">
          <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li class="page-item"><a class="page-link; btn btn-outline-secondary" href="${contextPath}/admin/management/mylist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}" aria-disabled="true">이전</a></li>
            </c:if> 
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                  <li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
                  <a class="page-link" href="${contextPath}/admin/management/mylist.do${pageMaker.makeSearch(idx)}&member_id=${member_id}">${idx}</a></li>
                </c:forEach>
            
                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li class="page-item"><a class="page-link" href="${contextPath}/admin/management/mylist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                </c:if>
          </ul>
        </nav>
      </div>
    </div>
    
    <!-- 창 번호 끝 -->
   
  </body>
</html>
