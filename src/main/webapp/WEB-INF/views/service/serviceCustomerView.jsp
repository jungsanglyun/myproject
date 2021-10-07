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
<title>고객센터 1:1 문의사항 관리자 메인</title>

</head>
<body>
	<!-- 타이틀 시작-->
	<div class="container">
		<h2 class="font-weight-bold mt-5 mb-4" style="font-family: 'Nanum Myeongjo', serif;">1:1 문의사항 목록</h2>
	</div>
	<!-- 타이틀 끝 -->

	<!-- 메인 테이블 시작 -->
	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="bg-light">
					<tr>
						<th scope="col-2" class="col-2">NO</th>
						<th scope="col-6" class="col-6">제목</th>
						<th scope="col-2" class="col-2">등록일</th>
						<th scope="col-2" class="col-2">답변상황</th>
					</tr>
				</thead>
				<tbody>
				<tbody>
					<c:forEach var="serviceCustomerVO"
						items="${serviceCustomerVOList }">

						<tr>
							<th>${serviceCustomerVO.serviceCustomer_code}</th>
							<td><a
								href="${contextPath }/service/serviceCustomerDetailView.do?member_id=${serviceCustomerVO.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code}">${serviceCustomerVO.serviceCustomer_title}</a></td>
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

					</c:forEach>



				</tbody>
			</table>
		</div>
	</div>
	<!-- 메인 테이블 끝 -->
	
	
	<div class="container">
		<div class="d-flex justify-content-end mb-5">
			<button class="btn btn-outline-secondary btn-sm mr-2" onclick="location.href='${contextPath}/service/serviceCustomerWriteView.do'">글쓰기
				버튼</button>
		</div>
	</div>


	<div class="container">
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
						<a class="page-link" href="${contextPath}/service/serviceCustomerView.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a class="page-link" href="${contextPath}/service/serviceCustomerView.do${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item">
						<a class="page-link" href="${contextPath}/service/serviceCustomerView.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
						</li>
					</c:if>
				</ul>

			</nav>
		</div>
	</div>


</body>
</html>




