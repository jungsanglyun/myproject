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
<script>
	var fileIndex = 1;

	function fn_addFile() {
		var fileIndex = 1;
		$("#nowFile")
				.append(
						"<div><input type='file' style='float:left;' name='file_"
								+ (fileIndex++)
								+ "'>"
								+ "</button>"
								+ "<button type='button' style='float:right;' id='fileDelBtn'>"
								+ "삭제" +  "</button>" + "<br><br>" + "</div>");
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}
	
	
	function goWrite(frm) {
		var UserUpdateModeTitle = frm.UserUpdateModeTitle.value;

		if (UserUpdateModeTitle.trim() == '') {
			alert("제목을 입력해주세요");
			return false;
		}
		
		frm.submit();
	}
	
</script>



<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<form action="${contextPath }/service/serviceCustomerWrite.do" method="post" enctype="multipart/form-data">

		<div class="container">
			<!-- 제목 -->
			<h2 class="font-weight-bold text-center mt-5 mb-3">1:1문의사항 글쓰기 페이지
			</h2>
			<!-- 제목 끝 -->

			<!-- 메인 테이블 시작 -->
			<div class="container">
				<div class="table-responsive">
					<table class="table table-bordered mb-0">
						<thead>
							<tr>
								<th scope="col" class="col-1 bg-light text-center">제목</th>
								<td scope="col" colspan="11"><textarea
										id="UserUpdateModeTitle" name="serviceCustomer_title" rows="1"
										style="width: 100%; resize: none; border: 0; text-align: left; background: transparent;"
										spellcheck="false">${serviceCustomerVO.serviceCustomer_title}</textarea>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="12" style="height: 350px"><textarea
										id="UserUpdateModeContent" name="serviceCustomer_content"
										rows="20"
										style="width: 100%; resize: none; border: 0; text-align: left; background: transparent;"
										spellcheck="false">${serviceCustomerVO.serviceCustomer_content}</textarea>
								</td>
							</tr>
							<tr>
								<th scope="col" class="col-1 bg-light text-center align-middle">첨부<br>파일
								</th>

								<td id="fileIndex" colspan="11">
									<div id="nowFile">
									</div> 
								<br>
									<button type="button" id="fileUpdate_btn" onclick=fn_addFile()>파일추가</button>
								</td>
								
							</tr>

						</tbody>
					</table>
				</div>
			</div>

			<div class="container">
				<div class="d-flex justify-content-end">
					<button type="button" onclick=goWrite(this.form)>글 작성</button>
					<input type="button" value="돌아가기" onclick="location.href='${contextPath}/main/main.do'">
					<input type="hidden" value="${memberInfo.member_id }" name="member_id">
				</div>
			</div>

		</div>
	</form>
</body>

</html>