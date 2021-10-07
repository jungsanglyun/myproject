<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<script>
	var codeNum = "";
	var member_id = "";

	function emailCheck() {

		var email1 = document.getElementById('email1').value;
		var email2 = "@" + document.getElementById('email2').value;
		var member_name = document.getElementById('member_name').value;

		$.ajax({
			async : false,
			type : 'POST',
			url : "${contextPath}/member/idFindEmail.do",
			data : {
				"sending_member_email" : email1,
				"sending_member_email2" : email2,
				"member_name" : member_name
			},
			success : function(request) {
				if (request.message == "없는 이메일이거나 없는 아이디 입니다.") {
					alert(request.message)
				} else {

					alert(request.message);
					codeNum = request.code;
					member_id = request.member_id;
				}

			},
			error : function(request, error) {
				alert("code:" + request.status + "\n" + "message: "
						+ request.responseText + "\n" + "error : " + error)
			}

		})
	}

	function lastCheck() {
		if (document.getElementById('checkNum').value == codeNum) {
			alert("인증번호가 일치합니다!");
			document.getElementById('submit_btn').disabled = false;
		} else {
			alert("인증번호를 다시 확인하세요");
		}

	}

	function lastSubmit() {
		alert("아이디는 " + member_id + "입니다.")

		location.href = "${contextPath}/member/loginForm.do";

	}
</script>


<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>





	<div class="container">
		<h2 class="text-center mt-5 mb-4 font-weight-bold">아이디 찾기</h2>



		<form id="form1" action="" method="post">
			<div class="col-md-4 container border rounded">
				<div class="form-group mt-3">
					<label for="exampleInputId">이름</label> <input type="text"
						class="form-control" id="member_name" name=""
						aria-describedby="emailHelp" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">E-Mail</label>
					<div class="form-row">
						<div class="col-6">
							<input type="email" class="form-control" id="email1" />
						</div>
						<div class="col-1 d-flex align-self-center">@</div>
						<div class="col-5">
							<input type="email" class="form-control" id="email2" />
						</div>
					</div>
				</div>

			
				<div class="form-group ">
					<div class="form-row ">
						<div class="col-6">
							<input type="email" class="form-control" id="checkNum" placeholder="인증번호 입력"/>
						</div>
						<div class="col-2 d-flex align-self-center">
							<button type="button" class="btn btn btn-secondary btn-sm text-white" onclick=lastCheck()>확인</button>
						</div>
						<div class="col-4 d-flex align-self-center">
							<button type="button" onclick=emailCheck()
								class="btn btn-outline-info btn-sm">인증키 전송</button>
						</div>
					</div>
				</div>
				

				<div class="d-flex justify-content-center btn-group-lg">

					<button type="button" id="submit_btn"
						class="btn btn btn-success text-white mt-4 mb-1 col-12"
						onclick=lastSubmit() disabled>아이디 찾기</button>

				</div>

				<div class="col-12 px-2">
					<div class="d-flex justify-content-center my-3">
						<button type="button"
							onclick="location.href='${contextPath}/member/loginForm.do'"
							class="btn btn-outline-secondary btn-sm col-4 mr-2">로그인</button>
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

</body>
</html>