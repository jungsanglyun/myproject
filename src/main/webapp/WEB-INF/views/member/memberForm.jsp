<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>
<html>
<head>

<!-- 아이디 중복 체크 -->
<script>
	$(function() {
		$('#member_id').blur(
				function() {

					var member_id = $('#member_id').val();

					$
							.ajax({
								async : false,
								type : 'POST',
								url : '${contextPath}/member/idCheck.do',
								data : {
									member_id : member_id
								},
								dataType : "text",

								/* data = 1 아이디 중복, data = 0 아이디 중복 안됨. */
								success : function(data) {
									if (data == 1) {
										$("#id_check_message").text(
												"사용중인 아이디입니다");
										$("#id_check_message").css("color",
												"red");
										$("#submit_button").attr("disabled",
												true);

										$("#id_check_message_sub")
												.text(" --- ");
										$("#id_check_message_sub").css("color",
												"#FFFFFF");

									} else {
										if (member_id == "") {
											$("#id_check_message").text(
													'아이디를 입력해주세요');
											$("#id_check_message").css('color',
													'red');
											$("#submit_button").attr(
													"disabled", true);

											$("#id_check_message_sub").text(
													" - ");
											$("#id_check_message_sub").css(
													"color", "#FFFFFF");
										} else {
											$("#id_check_message").text(
													"사용가능한 아이디입니다.");
											$("#id_check_message").css('color',
													'blue');

											$("#id_check_message_sub").text(
													" - ");
											$("#id_check_message_sub").css(
													"color", "#FFFFFF");

											$("#submit_button").attr(
													"disabled", false);
										}
									}

								},
								error : function(request, error) {
									alert("code:" + request.status + "\n"
											+ "message: "
											+ request.responseText + "\n"
											+ "error : " + error)
								}

							})

				})
	});

	$(function() {
		$('#member_pw_check').blur(function() {
			var member_pw = $("#member_pw").val();
			var member_pw_check = $("#member_pw_check").val();

			if (member_pw == member_pw_check && member_pw_check != undefined) {

				$("#pw_check_message2").text('비밀번호가 일치합니다');
				$("#pw_check_message2").css('color', 'blue');
				$("#submit_button").attr("disabled", false);

				$("#pw_check_message").text(" - ");
				$("#pw_check_message").css("color", "#FFFFFF");

			} else if (member_pw_check == undefined) {

				$("#pw_check_message2").text('비밀번호를 입력하세요');
				$("#pw_check_message2").css('color', 'red');

				$("#pw_check_message").text(" - ");
				$("#pw_check_message").css("color", "#FFFFFF");

			} else {
				$("#pw_check_message2").text('비밀번호가 일치하지 않습니다');
				$("#pw_check_message2").css('color', 'red');
				$("#submit_button").attr("disabled", true);

				$("#pw_check_message").text(" - ");
				$("#pw_check_message").css("color", "#FFFFFF");

			}

		})
	})
</script>

<!-- 다음 주소 검색 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
						document.getElementById('member_zonecode').value = data.zonecode;
						document.getElementById('member_zonecode').focus();

						document.getElementById('member_roadAddress').value = data.jibunAddress;
						document.getElementById('member_roadAddress').focus();

					}
				}).open();
	}
</script>




<!-- 생년월일 연월일 데이터 생성 스크립트 -->
<script>
	$(document).ready(function() {
		setDateBox();
	});

	// select box 연도 , 월 표시
	function setDateBox() {
		var dt = new Date();
		var com_year = dt.getFullYear();
		var com_month = dt.getMonth() + 1;
		var com_day = dt.getDate();

		// 올해 기준으로 -50년부터 +1년을 보여준다.
		for (var y = (com_year - 50); y <= (com_year + 1); y++) {
			$("#year").append(
					"<option value='" + y + "'>" + y + " 년" + "</option>");
		}

		// 월 뿌려주기(1월부터 12월)
		for (var i = 1; i <= 12; i++) {
			$("#month").append(
					"<option value='" + i + "'>" + i + " 월" + "</option>");
		}

		// 일 뿌려주기(1일부터 31일)
		for (var i = 1; i <= 31; i++) {
			$("#day").append(
					"<option value='" + i + "'>" + i + " 일" + "</option>");
		}

		$("#year > option[value=" + com_year + "]").attr("selected", "true");
		$("#month > option[value=" + com_month + "]").attr("selected", "true");
		$("#day > option[value=" + com_day + "]").attr("selected", "true");

	}
</script>

<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>




<body>

	<form action="${contextPath }/member/addMember.do" method="POST">
		<div class="container d-flex justify-content-center mt-5">
			<span class="border py-3">

				<div class="container">
					<!-- 아이디 그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>아이디</button>

							<!-- 아이디 데이터 -->
							<div class="col-3">
								<input type="text" class="form-control" id="member_id"
									name="member_id" value="" />
							</div>
							
						</div>
						
						<div class="form-row py-2">
							
							
							<div id="id_check_message">
							<div id="id_check_message_sub" class=""></div>
						</div>
					</div>
					<!-- 아이디 그룹 끝 -->
					<!-- 비밀번호 그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>비밀번호</button>
							<!-- 비밀번호 데이터 -->
							<div class="col-3">
								<input type="password" class="form-control" id="member_pw"
									name="member_pw" />
							</div>
							<button type="button" class="btn btn-outline-secondary col-3"
								disabled>비밀번호 재확인</button>
							<!-- 비밀번호 재확인 데이터 -->
							<div class="col-3">
								 <input
									type="password" class="form-control" id="member_pw_check"
									name="member_pw_check" />
							</div>
						</div>
						
						<div class="form-row">
							<div id="pw_check_message"></div>
							<div id="pw_check_message2"></div>	
						</div>
						
						
					</div>
					<!-- 비밀번호 그룹 끝 -->
					<!-- 이름 그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>이름</button>
							<!-- 이름 데이터 -->
							<div class="col-3">
								<input type="text" class="form-control" id="" name="member_name" />
							</div>
						</div>
					</div>
					<!-- 이름 그룹 끝 -->
					<!-- 성별 그룹 -->
					<fieldset class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>성별</button>


							<div
								class="col-3 d-flex justify-content-center align-items-center ">
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="member_gender" value="남" checked /> <label
										class="form-check-label" for="gridRadios1"> 남자 </label>
								</div>
								<div class="col-1"></div>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="member_gender" value="여" /> <label
										class="form-check-label" for="gridRadios2"> 여자 </label>
								</div>
							</div>
						</div>
					</fieldset>
					<!-- 성별 그룹 끝 -->
					<!-- 전화번호 그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>전화번호</button>
							<div class="col-3">
								<select id="" class="form-control text-center" name="member_hp">
									<option selected>010</option>
									<option>011</option>
									<option>012</option>
									<option>013</option>
									<option>014</option>
									<option>015</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
							</div>

							<div class="col-3">
								<input type="text" class="form-control" id="" name="member_hp2"
									maxlength="4" />
							</div>

							<div class="col-3 ">
								<input type="text" class="form-control" id="" name="member_hp3"
									maxlength="4" />
							</div>
						</div>
					</div>
					<!-- 전화번호 그룹 끝 -->
					<!-- 생년월일 그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>생년월일</button>
							<div class="col-3">
								<select id="year" class="form-control" name="member_birth_y">
									<option></option>
								</select>
							</div>
							<div class="col-3">
								<select id="month" class="form-control" name="member_birth_m">
									<option></option>
								</select>
							</div>
							<div class="col-3">
								<select id="day" class="form-control" name="member_birth_d">
									<option></option>
								</select>
							</div>
						</div>
					</div>
					<!-- 생년월일 그룹 끝 -->
					<!-- 이메일 그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>이메일</button>
							<div class="col-6">
								<input type="text" class="form-control" id=""
									name="member_email" />
							</div>
							<div class="col-3">
								<select id="" class="form-control" name="member_email2">
									<option selected>@naver.com</option>
									<option>@daum.net</option>
									<option>@google.com</option>
								</select>
							</div>
						</div>
					</div>
					<!-- 이메일 그룹 끝 -->
					<!-- 주소그룹 -->
					<div class="form-group">
						<div class="form-row">
							<button type="button" class="btn btn-outline-secondary col-2"
								disabled>주소</button>
							<div class="col-3">
								<input type="text" class="form-control" id="member_zonecode"
									name="member_zonecode" placeholder="우편번호" readonly />
							</div>
							<button type="button" onclick="openDaumPostcode()"
								class="btn btn-outline-secondary col-2">주소찾기</button>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control col-11"
							id="member_roadAddress" name="member_roadAddress" readonly />
					</div>
					<div class="form-group">
						<input type="text" class="form-control col-11"
							id="member_remainingAddress" name="member_remainingAddress" />
					</div>
				</div> <!-- 주소그룹 끝 --> <!-- 가입하기, 뒤로기가 버튼 -->
				<div class="mt-4 mb-1 d-flex justify-content-center">
					<button type="submit" class="btn btn-outline-secondary mr-3"
						id="submit_button">가입하기</button>
					<button type="button" class="btn btn-outline-secondary">
						뒤로가기</button>
				</div> <!-- 가입하기, 뒤로가기 버튼 끝 -->

			</span>
		</div>



	</form>




</body>
</html>