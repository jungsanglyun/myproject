<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>커뮤니티 상세페이지</title>
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
    <script type="text/javascript">
      $(document).ready(function(){
        var formObj = $("form[name='readForm']");
        
        // 수정 
        $(".update_btn").on("click", function(){
          formObj.attr("action", "${contextPath}/community/updateView.do");
          formObj.attr("method", "get");
          formObj.submit();				
        })
        
        // 삭제
        $(".delete_btn").on("click", function(){
          var deleteYN = confirm("삭제하시겠습니까?");
          
          if(deleteYN == true){
            
          formObj.attr("action", "${contextPath}/community/delete.do");
          formObj.attr("method", "post");
          formObj.submit();
          
          }
        })
        
        // 목록
        $(".list_btn").on("click", function(){
          
          location.href = "${contextPath}/community/list.do";
        })
        
        //댓글 작성
        $(".replyWriteBtn").on("click", function(){
        	if(fn_valiChk()){
				return false;
			}
            var formObj = $("form[name='replyForm']");
            formObj.attr("action", "${contextPath}/community/replyWrite.do");
            formObj.submit();
        });
        
          //댓글 삭제
        $(".replyDeleteBtn").on("click", function(){
          var deleteYN = confirm("삭제하시겠습니까?");
          
          if(deleteYN == true){
            location.href = "${contextPath}/community/replyDelete.do?com_no=${read.com_no}"
              + "&page=${scri.page}"
              + "&perPageNum=${scri.perPageNum}"
              + "&searchType=${scri.searchType}"
              + "&keyword=${scri.keyword}"
              + "&reply_no="+$(this).attr("data-reply_no");
          
          }
        });
      })
      
      //댓글 입력안할시 alert 창 제공
      function fn_valiChk(){
			var regForm = $("form[name='replyForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("placeholder"));
					return true;
				}
			}
      	}
      //첨부파일 다운로드
      function fn_fileDown(fileNo){
        var formObj = $("form[name='readForm']");
        $("#FILE_NO").attr("value", fileNo);
        formObj.attr("action", "${contextPath}/community/fileDown.do");
        formObj.submit();
      }
    </script>
  </head>
  <body>
    <div class="container">
      <!-- 제목 -->
      <h2 class="font-weight-bold text-center mt-5 mb-3">
        커뮤니티 상세페이지
      </h2>
      <br>
      <!-- 제목 끝 -->

      <!-- 메인 테이블 시작 -->
      <form name="readForm" role="form" method="post">
        <input type="hidden" id="com_no" name="com_no" value="${read.com_no}" />
        <input type="hidden" id="FILE_NO" name="FILE_NO" value="">
      </form>
      <div class="container">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col-1" class="col-1 bg-light text-center align-middle">번호</th>
                <td scope="col-1" class="col-1 align-middle">${read.com_no}</td>
                <th scope="col-1" class="col-1 bg-light text-center align-middle">작성자</th>
                <td scope="col-3" class="col-3 align-middle">${read.member_id}</td>
                <th scope="col-1" class="col-1 bg-light text-center align-middle">작성일</th>
                <td scope="col-2" class="col-2 align-middle" ><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/></td>
                <th scope="col-1" class="col-1 bg-light text-center align-middle">조회수</th>
                <td scope="col-2" class="col-2">${read.view_count}</td>
              </tr>
              <tr>
                <th scope="col" class="col-1 bg-light text-center align-middle">제목</th>
                <td scope="col" colspan="11">${read.com_title}</td>
              </tr>
            </thead>
            <tbody>
              <tr>
              <td colspan="12" style="height: 350px"><textarea id="com_content" name="com_content"  rows="20"  class="chk form-control" style="border:none; background: transparent; resize:none"  readonly>${read.com_content}</textarea></td>
            </tr>
            <tr>
              <th scope="col" class="col-1 bg-light text-center align-middle" style="font-size: 12px;" >첨부파일
                <td colspan="11">
                  <c:forEach var="file" items="${file}">
					  <a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
				  </c:forEach>
                </td>
              </th>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
 
      <div class="container">
        <div class="d-flex justify-content-end">
        <c:if test="${memberInfo.member_id == read.member_id || memberInfo.member_id == 'admin' }">
          <button
            type="submit"
            class="update_btn btn btn-outline-secondary btn-sm mr-2"
          >
            수정
          </button>
          <button
            type="submit"
            class="delete_btn btn btn-outline-secondary btn-sm mr-2"
          >
            삭제
          </button>
        </c:if>
        </div>
        <div class="d-flex justify-content-center">
          <button
            type="submit"
            class="list_btn btn btn-outline-secondary btn-sm mr-2"
          >
            목록
          </button>
        </div>
      </div>
      <!-- 목록, 작성, 수정, 삭제 버튼 끝 -->

      <div class="container" id="reply">
      	<c:forEach items="${replyList}" var="replyList">
        <div class="card-header p-2">
            <table>
              <tr class="align-middle">
                <td rowspan="2" class="pr-2">
                  <i class="fa fa-user-o fa-2x"></i>
                </td>
                <td class="ml">${replyList.member_id}</td>
              </tr>
              <tr>
                <td>
                  <font size="2"><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></font>

                  <c:if test="${memberInfo.member_id == replyList.member_id || memberInfo.member_id == 'admin' }">
                    <button type="button" class="replyDeleteBtn btn-outline-secondary btn-sm mr-2" data-reply_no="${replyList.reply_no}">삭제</button>
                  </c:if>
                </td>
              </tr>
            </table>
        </div>
        <div class="card-body">
          <p class="card-text">${replyList.reply_cont}</p>
        </div>
        </c:forEach>
      </div>
    </div>
	
	<!-- 댓글 -->
      <form name="replyForm" method="post" class="form-horizontal">
        <input type="hidden" id="com_no" name="com_no" value="${read.com_no}" />
        <input type="hidden" id="page" name="page" value="${scri.page}"> 
        <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
        <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
        <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">

	      <div class="container mt-3">
	        <div class="card mb-2">
	          <div class="card-header bg-light">
	            <i class="fa fa-comment fa"></i><input type="text" id="member_id" name="member_id" value="${memberInfo.member_id}" style="border:none; background: transparent;" readonly/>
	          </div>
	                <div class="form-inline"></div>
	                <textarea
	                  class="chk form-control"
	                  id="reply_cont" name="reply_cont" 
	                  rows="2" style="resize: none" placeholder="댓글을 입력하세요."
	                  ></textarea>
	                <div class="d-flex justify-content-end">
	                  <button
	                    type="button"
	                    class="replyWriteBtn btn btn-outline-secondary btn-sm mt-3"
	                  >
	                    작성
	                  </button>
	                </div>
	          </div>
	        </div>
      </form>
     
    <!-- 댓글 끝 -->
  </body>
</html>
