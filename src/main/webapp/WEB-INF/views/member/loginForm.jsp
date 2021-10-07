<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<!-- 입력한 아이디나 비밀번호가 오류일 경우 -->
<c:set var="message" value="${message}" />

<c:if test='${not empty message }'>
	<script>
		alert("아이디나 비밀번호가 틀립니다. 다시 시도하세요.")
	</script>

</c:if>

<!-- 아이디나 비밀번호를 입력안하고 버튼을 눌렀을 경우 -->

<script>
	function goLogin(frm) {
		var member_id = frm.member_id.value;
		var member_pw = frm.member_pw.value;

		if (member_id.trim() == '') {
			alert("아이디를 입력해주세요");
			return false;
		}
		if (member_pw.trim() == '') {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		frm.submit();
	}
</script>

<c:set var="login_demand" value="${login_demand}" />


</head>


<div class="container">
	<h2 class="text-center mt-5 mb-4 font-weight-bold">로그인</h2>
	<form id="form1" action="${contextPath}/member/login.do" method="post">
		<div class="col-md-4 container border rounded">
			<div class="form-group mt-3">
				<label for="exampleInputId">아이디</label> <input type="text"
					class="form-control" id="exampleInputId" name="member_id"
					aria-describedby="emailHelp" />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">비밀번호</label> <input
					type="password" class="form-control" id="exampleInputPassword"
					name="member_pw" />
			</div>
			<div class="d-flex justify-content-center btn-group-lg">
				<input type="submit"
					class="btn btn btn-success text-white mt-4 mb-1 col-12" value="로그인" />
			</div>

			<div class="col-12 px-2">
				<div class="d-flex justify-content-center my-3">
					<input type="button" value="아이디 찾기"
						onclick="location.href='${contextPath}/member/idFindForm.do'"
						class="btn btn-outline-secondary btn-sm col-4 mr-2">
					<button type="button"
						class="btn btn-outline-secondary btn-sm col-4 mr-2"
						onclick="location.href='${contextPath}/member/pwFindForm.do'">비밀번호
						찾기</button>
					<button type="button"
						class="btn btn-outline-secondary btn-sm col-4"
						onclick="location.href='${contextPath}/member/memberForm.do'">회원가입</button>

					
				</div>
			</div>
		</div>
	</form>
</div>


</html>