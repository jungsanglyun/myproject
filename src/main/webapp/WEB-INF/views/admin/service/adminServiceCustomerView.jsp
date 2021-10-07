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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 타이틀 시작-->
	<div class="container">
		<h2 class="font-weight-bold mt-5 mb-4">1:1 문의사항 관리(관리자용)</h2>
	</div>




	<div class="container">
		<div class="table-responsive">



			<table border='1' class="table table-bordered table-hover">

				<thead class="bg-light text-center">
					<tr>
						<th>NO</th>
						<th>작성자</th>
						<th>제목</th>
						<th>등록일</th>
						<th>답변상황</th>
					</tr>
				</thead>

				<c:forEach var="serviceCustomerVO" items="${serviceCustomerVOList }">
					<tbody class="text-center">
						<tr>
							<th scope="row">${serviceCustomerVO.serviceCustomer_code}</th>
							<td><a
								href="${contextPath }/service/serviceCustomerDetailView.do?member_id=${serviceCustomerVO.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code}">${serviceCustomerVO.serviceCustomer_title}</a></td>
							<td>${serviceCustomerVO.member_id }</td>
							<td>${serviceCustomerVO.serviceCustomer_write_date }</td>
							<c:choose>
								<c:when
									test="${serviceCustomerVO.serviceCustomer_reply == '' || serviceCustomerVO.serviceCustomer_reply == null}">
									<td style="color: red">답변없음</td>
								</c:when>
								<c:otherwise>
									<td>답변있음</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</c:forEach>

			</table>

			<div class="container">
				<div class="d-flex justify-content-center">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link; btn btn-outline-secondary"
									href="${contextPath}/admin/service/adminServiceCustomerView.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li class="page-item"
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a class="page-link; btn btn-outline-secondary"
									href="${contextPath}/admin/service/adminServiceCustomerView.do${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link; btn btn-outline-secondary"
									href="${contextPath}/admin/service/adminServiceCustomerView.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

</body>
</html>