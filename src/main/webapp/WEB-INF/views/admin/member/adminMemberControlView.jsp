<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	
	

	<h1>관리자 회원 관리 페이지</h1>

	<table border='1'>

		<thead>
			<tr>
				<th>NO</th>
				<th>회원 아이디</th>
				<th>가입일</th>
				<th>회원추방</th>
			</tr>
		</thead>

		<c:forEach var="memberVO" items="${memberVOList }">
			<tbody>
				<tr>
					<td>${memberVO.member_code}</td>
					<td><a
						href="${contextPath }/admin/member/memberAllData.do?member_id=${memberVO.member_id}">${memberVO.member_id}</a></td>
					<td>${memberVO.member_joinDay}</td>
					<td><a href="">회원추방버튼</a></td>
				</tr>
			</tbody>
		</c:forEach>

	</table>

	<hr>

	<div class="col-md-offset-3">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					<a
					href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>





</body>
</html>
