<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 상세페이지</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/commumity/css/communityStyle.css" />
    <script
      src="https://kit.fontawesome.com/8a5f5e4107.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/admin/notice/updateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				
				if(deleteYN == true){
					
				formObj.attr("action", "${contextPath}/admin/notice/delete.do");
				formObj.attr("method", "post");
				formObj.submit();
				
				}
			})

			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "${contextPath}/notice/list.do";
			})				
		})
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "${contextPath}/notice/fileDown.do");
			formObj.submit();
		}
	</script>
  <body>
    <div class="container">
      <!-- 제목 -->
      <h2 class="font-weight-bold text-center mt-5 mb-3">
        공지사항 상세페이지
      </h2>
      <!-- 제목 끝 -->

      <!-- 메인 테이블 시작 -->
      <form name="readForm" role="form" method="post">
		<input type="hidden" id="notice_no" name="notice_no" value="${read.notice_no}" />
		<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
	  </form>
      <div class="container">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col-1" class="bg-light text-center align-middle">번호</th>
                <td scope="col-1">${read.notice_no}</td>
                <th scope="col-1" class="bg-light text-center align-middle">작성자</th>
                <td scope="col-3">${read.member_id}</td>
                <th scope="col-1" class="bg-light text-center align-middle">작성일</th>
                <td scope="col-2"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/></td>
                <th scope="col-1" class="bg-light text-center align-middle">조회수</th>
                <td scope="col-2">${read.view_count}</td>
              </tr>
              <tr>
                <th scope="col" class="bg-light text-center align-middle">제목</th>
                <td scope="col" colspan="11">${read.notice_title}</td>
              </tr>
            </thead>
            <tbody>
             <tr>
              	<td colspan="12" style="height: 350px"><textarea rows="20" style="border:none; resize: none; background:transparent" class="chk form-control" readonly>${read.notice_cont}</textarea></td>
             </tr>
            </tbody>
            <tr>
              <th scope="col" class="col-1 bg-light text-center align-middle" style="font-size: 12px;">첨부파일
                <td colspan="12">
                  <c:forEach var="file" items="${file}">
					    <a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
				    </c:forEach>
                </td>
              </th>
            </tr>
          </table>
        </div>
      </div>
     </div>
      <!-- 메인 테이블 끝 -->

      <!-- 목록, 수정, 삭제 버튼 -->
      <div class="container">
        <div class="d-flex justify-content-end">
          <c:if test="${memberInfo.member_id == 'admin' }">
          <button
            type="button"
            class="update_btn btn btn-outline-secondary btn-sm mr-2"
          >
            수정
          </button>
          <button
            type="button"
            class="delete_btn btn btn-outline-secondary btn-sm mr-2"
          >
            삭제
          </button>
          </c:if>
        </div>
        <div class="d-flex justify-content-center">
        <button
        type="button"
        class="list_btn btn btn-outline-secondary btn-sm mr-2"
      >
        목록
      </button>
      </div>
      </div>
      <!-- 목록, 수정, 삭제 버튼 끝 -->
  </body>
</html>
