<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 수정페이지</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <script
      src="https://kit.fontawesome.com/8a5f5e4107.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$("#fileDel").on("click", function(){
				$(this).parent().remove();
				
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "${contextPath}/notice/readView.do?notice_no=${update.notice_no}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/admin/notice/update.do");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
		
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("placeholder"));
					return true;
				}
			}
		}
		
		
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button>"+"<br><br>"+" </div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
		
	</script>
  <body>
    <div class="container">
      <!-- 제목 -->
      <h2 class="font-weight-bold text-center mt-5 mb-3">
        공지사항 수정페이지
      </h2>
      <!-- 제목 끝 -->

      <!-- 메인 테이블 시작 -->
      <form name="updateForm" role="form" method="post" action="${contextPath}/admin/notice/update.do" enctype="multipart/form-data">
        <input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
        <input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
      	<input type="hidden" id="notice_no" name="notice_no" value="${update.notice_no}">
      <div class="container">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col-1" class="bg-light text-center align-middle">번호</th>
                <td scope="col-1">${update.notice_no}</td>
                <th scope="col-1" class="bg-light text-center align-middle">작성자</th>
                <td scope="col-3">${update.member_id}</td>
                <th scope="col-1" class="bg-light text-center align-middle">작성일</th>
                <td scope="col-2"><fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/></td>
                <th scope="col-1" class="bg-light text-center align-middle">조회수</th>
                <td scope="col-2">${update.view_count}</td>
              </tr>
              <tr>
                <th scope="col" class="bg-light text-center align-middle">제목</th>
                <td scope="col" colspan="11"> <input type="text" id="notice_title" name="notice_title" class="chk form-control" value="${update.notice_title}" style="border:none; resize: none" placeholder="제목을 입력하세요." /></td>
              </tr>
            </thead>
            <tbody>
             <tr>
              	<td colspan="12" style="height: 350px"><textarea id="notice_cont" name="notice_cont" class="chk form-control" style="border:none; resize: none" placeholder="내용을 입력하세요.">${update.notice_cont}</textarea></td>
             </tr>
            </tbody>
            <tr>
              <th scope="col" class="col-1 bg-light text-center">첨부파일
                <td colspan="11">
                    <div id="fileIndex" class="form-group" style="border: 1px solid #dbdbdb;">	
                 		<c:forEach var="file" items="${file}" varStatus="var">
                        <div>
                              <input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
                              <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
                              <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
                              <button class="fileDel" id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button" >삭제</button>
                         </div>
                         <p>
                         </c:forEach>
                    </div> 
                </td>
            </tr>
          </table>
      </div>
      	<div>
  			<button type="button" class="fileAdd_btn btn btn-outline-secondary btn-sm mr-2">파일추가</button>
  		</div>
      </div>
     	<div class="container">
	        <div class="d-flex justify-content-center">
	          
	          <button type="button" class="update_btn btn btn-outline-secondary btn-sm mr-2">저장</button>
	          <button type="button" class="cancel_btn btn btn-outline-secondary btn-sm mr-2">취소</button>

	        </div>
	      </div>	  
     </form>
    </div>    
  </body>
</html>
