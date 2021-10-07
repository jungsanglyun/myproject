<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>


<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>헤더</title>


<!-- font awesome -->
<script src="https://kit.fontawesome.com/8a5f5e4107.js"
	crossorigin="anonymous"></script>


<!-- https://getbootstrap.com/docs/4.6/getting-started/introduction/ -->

<!-- Style -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">




<style>
nav {
	color: blue;
	font-size: 25px;
}

a {
	font-size: 18px;
	font-weight: 900;
}

#login {
	font-size: 12px;
}

.xxx:hover {
  background-color: #aaaaaa;
}

.yyy:hover .dropdown-menu {
  display: block;
  margin-top: 0;
}

* {
  font-family:Nanum Myeongjo, serif;
}

</style>

</head>


<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<i class="fas fa-cloud-sun-rain"></i> <a class="navbar-brand"
			href="${contextPath}/main/main.do">WAAP</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item xxx"><a class="nav-link"
					href="${contextPath}/waap/rankView.do">순위정보</a></li>
				<li class="nav-item xxx"><a class="nav-link"
					href="${contextPath}/waap/priceView.do">기상/농산물 시세 정보</a></li>
				<li class="nav-item xxx"><a class="nav-link"
					href="${contextPath }/notice/list.do">공지사항</a></li>
				<li class="nav-item xxx"><a class="nav-link"
					href="${contextPath}/community/list.do">커뮤니티</a></li>


				<c:choose>
				
					<c:when test="${isLogOn=='true' and memberInfo.member_id=='admin' }">
						<li class="nav-item dropdown xxx"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								고객센터 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item xxx"
									href="${contextPath }/admin/service/adminServiceCustomerView.do">1:1문의 관리자 페이지</a>
								<a class="dropdown-item xxx"
									href="${contextPath}/service/FAQView.do">자주묻는질문</a>
							</div></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown yyy xxx"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								고객센터 </a>
							<div class="dropdown-menu yyy"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item xxx"
									href="${contextPath}/service/FAQView.do">자주묻는질문</a>
								<a class="dropdown-item xxx"
									href="${contextPath }/service/serviceCustomerView.do">1:1문의사항</a>
							</div></li>

					</c:otherwise>
				</c:choose>




				<c:choose>
					<c:when
						test="${isLogOn=='true' and memberInfo.member_id=='admin' }">
						<li class="nav-item xxx"><a class="nav-link"
							href="${contextPath }/admin/management/mmm.do">관리</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item xxx"><a class="nav-link"
							href="${contextPath}/mypage/list.do">마이페이지</a></li>
					</c:otherwise>

				</c:choose>
			</ul>



		</div>

		<c:choose>
			<c:when test="${isLogOn=='true' and not empty memberInfo }">
				<a id="login" href="${contextPath }/member/logout.do">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a id="login" href="${contextPath}/member/loginForm.do">로그인</a>
							&nbsp; 
						<a id="login" href="${contextPath}/member/memberForm.do">회원가입</a>
			</c:otherwise>
		</c:choose>

	</nav>


</html>