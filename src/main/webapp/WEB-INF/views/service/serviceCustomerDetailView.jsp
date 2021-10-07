<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("UTF-8");
%>


<head>
<script>
	var update;

	function ServiceCustomerDetailViewupdate() {
		updateTitle = document.getElementById('UserUpdateModeTitle');
		updateTitle.disabled = false;

		updateContent = document.getElementById('UserUpdateModeContent');
		updateContent.disabled = false;

		fileUpdate_btn = document.getElementById('fileUpdate_btn');
		fileUpdate_btn.disabled = false;

		if (document.getElementsByName('fileDel') != null) {

			var size = document.getElementsByName('fileDel').length;

			for (var i = 0; i < size; i++) {
				document.getElementsByName('fileDel')[i].disabled = false;
			}

		}

		document.getElementById('user_mode_normal').style.display = "none";

		document.getElementById('userUpdateMode').style.display = "block";

	}

	function ServiceCustomerDetailViewReply() {
		updateReply = document.getElementById('adminModeReply');
		updateReply.disabled = false;

		document.getElementById('admin_mode_normal').style.display = "none";

		document.getElementById('adminUpdateMode').style.display = "block";

	}

	function fn_addFile() {
		var fileIndex = 1;
		$("#nowFile")
				.append(
						"<div><input type='file' style='float:left;' name='file_"
								+ (fileIndex++)
								+ "'>"
								+ "</button>"
								+ "<button type='button' style='float:right;' id='fileDelBtn'>"
								+ "삭제" + "</button>" + "<br><br>" + "</div>");
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}

	function fn_fileDown(file_code) {

		location.href = "${contextPath}/service/fileDown.do?FILE_CODE="
				+ file_code;

	}

	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name) {

		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);

	}

	$(document).on("click", "#fileDel", function() {
		$(this).parent().remove();
	})
</script>




</head>


<body>



	<form action="" method="post" enctype="multipart/form-data">
		<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
		<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">


		<div class="container">
			<!-- 제목 -->
			<h2 class="font-weight-bold text-center mt-5 mb-3">1:1문의사항 상세페이지
			</h2>
			<!-- 제목 끝 -->

			<!-- 메인 테이블 시작 -->
			<div class="container">
				<div class="table-responsive">
					<table class="table table-bordered mb-0">
						<thead>
							<tr>
								<th scope="col" class="col-1 bg-light text-center">제목</th>
								<td scope="col" colspan="8"><textarea
										id="UserUpdateModeTitle" name="serviceCustomer_title" rows="1"
										style="width: 100%; resize: none; border: 0; text-align: left; background: transparent;"
										spellcheck="false" disabled>${serviceCustomerVO.serviceCustomer_title}</textarea>
								</td>
								<th scope="col" class="col-1 bg-light text-center">게시일</th>
								<td scope="col" class="col-2">${serviceCustomerVO.serviceCustomer_write_date }</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="12" style="height: 350px"><textarea
										id="UserUpdateModeContent" name="serviceCustomer_content"
										rows="20"
										style="width: 100%; resize: none; border: 0; text-align: left; background: transparent;"
										spellcheck="false" disabled>${serviceCustomerVO.serviceCustomer_content}</textarea>

								</td>
							</tr>
							<tr>
								<th scope="col" class="col-1 bg-light text-center align-middle">첨부<br>파일
								</th>

								<td id="fileIndex" colspan="11">
									<div id="nowFile">
										<c:forEach var="file" items="${fileList}" varStatus="var">

											<div>
												<input type="hidden" id="FILE_CODE"
													name="FILE_CODE_${var.index}" value="${file.FILE_CODE }">
												<input type="hidden" id="FILE_NAME" name="FILE_NAME"
													value="FILE_CODE_${var.index}"> <a href="#"
													id="fileName"
													onclick="fn_fileDown('${file.FILE_CODE}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE})
												<button id="fileDel" name="fileDel"
													onclick="fn_del('${file.FILE_CODE}','FILE_CODE_${var.index}');"
													type="button" disabled>삭제</button>
												<br>
											</div>



										</c:forEach>
									</div> <br>
								<br>

									<button type="button" id="fileUpdate_btn" onclick=fn_addFile()
										disabled>파일추가</button> <input type="hidden"
									value="${serviceCustomerVO.serviceCustomer_code }"
									name="serviceCustomer_code">
								</td>



							</tr>
							<tr>
								<th scope="col" class="col-1 bg-light text-center">답변</th>
								<td colspan="11"><textarea id="adminModeReply" name="serviceCustomer_reply" rows="10"
										style="width: 100%; resize: none; border: 0; text-align: left; background: transparent;"
										spellcheck="false" disabled>${serviceCustomerVO.serviceCustomer_reply }</textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 메인 테이블 끝 -->

			<!-- 목록, 수정, 삭제 버튼 -->
			<div class="container">
				<div class="d-flex justify-content-end">

					<c:choose>
						<c:when test="${memberInfo.member_id == 'admin'}">
							<div id="admin_mode_normal">
								<input type="button" onclick=ServiceCustomerDetailViewReply()
									value="답변"> <input type="submit" value="삭제"
									onclick="javascript:form.action='${contextPath}/service/serviceCustomerViewDelete.do'">
								<input type="button"
									onclick="location.href='${contextPath}/admin/service/adminServiceCustomerView.do'"
									value="돌아가기">

							</div>

							<div id="adminUpdateMode" style="display: none;">
								<input type="submit" value="답변완료"
									onclick="javascript:form.action='${contextPath}/admin/service/serviceCustomerViewReply.do';">
								<input type="button"
									onclick="location.href='${contextPath}/service/serviceCustomerDetailView.do?member_id=${serviceCustomerVO.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code }'"
									value="답변취소">
							</div>
						</c:when>

						<c:when
							test="${memberInfo.member_id != 'admin' and memberInfo.member_id == serviceCustomerVO.member_id }">
							<div id="user_mode_normal" style="display: block;">
								<input type="button" onclick=ServiceCustomerDetailViewupdate()
									value="수정"> <input type="submit" value="삭제"
									onclick="javascript:form.action='${contextPath}/service/serviceCustomerViewDelete.do'">
								<input type="button"
									onclick="location.href='${contextPath}/service/serviceCustomerView.do'"
									value="돌아가기">
							</div>

							<div id="userUpdateMode" style="display: none;">
								<input type="submit" value="수정완료"
									onclick="javascript:form.action='${contextPath}/service/serviceCustomerViewUpdate.do';">
								<input type="button"
									onclick="location.href='${contextPath}/service/serviceCustomerDetailView.do?member_id=${memberInfo.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code }'"
									value="수정취소">
							</div>
						</c:when>
					</c:choose>


				</div>

				<!-- 목록, 수정, 삭제 버튼 끝 -->

			</div>
		</div>
	</form>
</body>






</body>
