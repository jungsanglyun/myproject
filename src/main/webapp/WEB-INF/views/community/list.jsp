<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>커뮤니티 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
</head>

<body>
	<!-- 타이틀 시작-->
	<div class="container">
		<h2 class="font-weight-bold mt-5">커뮤니티</h2>
	</div>
	<!-- 타이틀 끝 -->

	<!-- 최신글 인기글 시작 -->
	<div class="container">
		<div class="d-flex justify-content-end">
			<button type="button" class="btn btn-outline-secondary btn-sm mr-2"
				id="last" name="last" onclick="javascript:location.href='${contextPath}/community/list_last.do'">최신글</button>
			<button type="button" class="btn btn-outline-secondary btn-sm mr-2"
				id="popular" name="popular" onclick="javascript:location.href='${contextPath}/community/list_count.do'">인기글</button>
		</div>
	</div>
	<!-- 최신글 인기끝 끝 -->
	<br />

	<!-- 메인 테이블 시작 -->
	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="bg-light">
					<tr>
						<th scope="col-1">번호</th>
						<th scope="col-4">제목</th>
						<th scope="col-2">작성자</th>
						<th scope="col-2">작성일</th>
						<th scope="col-1">조회수</th>
					</tr>
				</thead>


				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td scope="row"><c:out value="${list.com_no}" /></td>
							<td class="cursor_test"><a
								href="${contextPath}/community/readView.do?com_no=${list.com_no}"><c:out value="${list.com_title}" /> 
									<c:if test="${list.reply_count ne 0 }">
										<small><b><font color="red">[&nbsp;<c:out value="${list.reply_count}" />&nbsp;]	</font></b></small>
									</c:if> 
									</a>
							</td>
							<td class="cursor_test"><c:out value="${list.member_id}" /></td>
							<td><fmt:formatDate value="${list.regdate}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${list.view_count}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 메인 테이블 끝 -->

	<!-- 게시물 등록, 내글보기 시작 -->

	<div class="container">
		<div class="d-flex justify-content-end mb-5">
			<button type="button" class="btn btn-outline-secondary btn-sm mr-2"
				id="writebtn" name="writebtn" onclick="javascript:location.href='${contextPath}/community/writeView.do'">게시물 등록</button>
			<button type="button" class="btn btn-outline-secondary btn-sm mr-2"
				id="mywritebtn" name="mywritebtn" onclick="javascript:location.href='${contextPath}/mypage/mylist.do'">내글 보기</button>
		</div>
	</div>
	<!-- 게시물 등록, 내글보기 끝 -->


	<!-- 창 번호 시작 -->
	<div class="container">
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
					    <li class="page-item"><a class="page-link; btn btn-outline-secondary" href="${contextPath}/community/list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}" aria-disabled="true">이전</a></li>
					</c:if> 
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					    	<a class="page-link" href="${contextPath}/community/list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="page-item"><a class="page-link" href="${contextPath}/community/list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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
					 <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색조건</option>
				     <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					 <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					 <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					 <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
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
                  self.location = "${contextPath}/community/list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                });
           });   
    </script>

	
	
	<!-- 검색창 끝 -->

</body>
</html>
