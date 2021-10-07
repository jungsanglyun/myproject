<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 관리 메인</title>
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
      <h2 class="font-weight-bold mt-5 mb-4">회원 관리</h2>
    </div>
    <!-- 타이틀 끝 -->

    <!-- 메인 테이블 시작 -->
    <div class="container">
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead class="bg-light text-center">
            <tr>
              <th scope="col-1" class="col-1">번호</th>
              <th scope="col-4" class="col-4">회원 아이디</th>
              <th scope="col-3"class="col-3">가입일</th>
              <th scope="col-2"class="col-2">게시물</th>
              <th scope="col-2"class="col-2">회원 추방</th>
            </tr>
          </thead>
          <tbody class="text-center">
            <c:forEach items="${adminlist}" var = "adminlist">
						<c:if test="${adminlist.member_id != 'admin'}">
            <tr>
              <th scope="row">${adminlist.member_code}</th>
              <td><a href="${contextPath}/admin/management/minfo.do?member_id=${adminlist.member_id}"><c:out value="${adminlist.member_id}" /></a></td>
              <td><fmt:formatDate value="${adminlist.member_joinDay}" pattern="yyyy-MM-dd"/></td>
              <td>
                <div class="d-flex justify-content-center">
                <button
                type="button"
                class="writeView_btn btn btn-outline-secondary btn-sm"
                onclick="javascript:location.href='${contextPath}/admin/management/mylist.do?member_id=${adminlist.member_id}'"
              >
                작성한 글 보기
              </button>
              </div>
            </td>
            <td>
              <div class="d-flex justify-content-center">
              <button
              type="button"
              class="deport_btn btn btn-outline-secondary btn-sm"
              onclick="javascript:location.href='${contextPath}/admin/management/deportView.do?member_id=${adminlist.member_id}'"
            >
              회원 추방
            </button>
            </div>
          </td>
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
					    <li class="page-item"><a class="page-link; btn btn-outline-secondary" href="${contextPath}/admin/management/mmm.do${pageMaker.makeSearch(pageMaker.startPage - 1)}" aria-disabled="true">이전</a></li>
					</c:if> 
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					    	<a class="page-link" href="${contextPath}/admin/management/mmm.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="page-item"><a class="page-link" href="${contextPath}/admin/management/mmm.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
				</ul>
			</nav>
		</div>
	</div>
	
	<!-- 창 번호 끝 -->
    
        <!-- 검색창 시작 -->
	<form class="form-inline my-0; d-flex justify-content-center">
		<div class="row">
			<div class="col-xs-6">
				 <select name="searchType" class="form-control">
					 <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				 </select>
			</div>
			<div class="col-xs-6">
				<div class="input-group">
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
					<span class="input-group-btn">
						<button id="searchBtn" type="button" class="btn btn-outline-secondary">검색</button>
					</span>
			     </div>
			</div>
		</div>
	</form>
	
	<script>
      $(function(){
         $('#searchBtn').click(function() {
                  self.location = "${contextPath}/admin/management/mmm.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                });
           });   
    </script>

	
	
	<!-- 검색창 끝 -->
    
  </body>
</html>
