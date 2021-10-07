<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>자주묻는질문 글작성 페이지</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
  </head>
  
  <body>
    <div class="container">
		<h2 class="font-weight-bold mt-5" align="center">자주 묻는 질문 글 작성 페이지</h2>
	</div>
	<br>
	<br>
	<form action="${contextPath }/admin/service/FAQWrite.do">
      <!-- 메인 테이블 시작 -->
      <div class="container">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col" class="bg-light align-top">질문내용</th>
                <td scope="col" colspan="11">
                    <textarea name="faq_content" class="form-control" style="border:none; resize: none; background: transparent;"></textarea>
                </td>
              </tr>
            </thead>
            <tbody>
            <tr>
           	  <th scope="col" class="bg-light">답변내용</th>
              <td colspan="12" style="height: 350px">
                <textarea name="faq_reply"  cols="50" rows="20" class="form-control" style="border:none; resize: none; background: transparent;"></textarea>
              </td>
             </tr>
            </tbody>
          </table>
 
			<div id="admin_mode">
				<input type="button" class="btn btn-outline-secondary col-1"  onclick="location.href='${contextPath}/service/FAQView.do'" value="돌아가기">
				<input type="submit" class="btn btn-outline-secondary col-1"  value="등록">
			</div>

        </div>
      </div>
      
      
     </form>
  </body>
</html>