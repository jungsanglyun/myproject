<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <style>
      #withdrawalForm{
        width: 300px;
        height: 400px;
        top: 30%;
        border-radius: 15px;

      }
    #btn1{
        
       
        text-align: center; 
        margin-top: 100px;
      }
    .btn_2{
        width: 40%;
        height: 35px;
        top: 100px;
    }

    </style>
    <title>회원탈퇴</title>
	<script type="text/javascript">
		$(document).ready(function(){
			// 돌아가기
			$(".return_btn").on("click", function(){
				location.href="${contextPath}/mypage/list.do";			
			})

			$(".withdrawal_btn").on("click", function(){
				if($("#member_pw").val()=="" || $("#member_pw2").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#member_pw").focus();
					return false;
			}
			});
			
			
		})
		//비밀번호 확인
		$(function(){
			$('#member_pw2').blur(function(){
			   if($('#member_pw').val() != $('#member_pw2').val()){
			    	if($('#member_pw2').val()!=''){
				    alert("비밀번호가 일치하지 않습니다.");
			    	    $('#member_pw2').val('');
			          $('#member_pw2').focus();
			       }
			    }
			})  	   
		});
			
	</script>
  </head>
  <body>
  	<div class="container">
		<h2 class="font-weight-bold mt-5" align="center">회원 탈퇴</h2>
	</div>
  	<br><br>
    <form class="p-3 col-md-4 container-md bg-white mt-3 border boer-dark border-radius" action="${contextPath}/mypage/withdrawal.do" method="post" id="withdrawalForm"  >
                <div class="form-group justify-content-center">
                    <div class="container-md text-center">
                        <div class="mt-4">
                            <label for="exampleId">아이디</label>
                        </div>
                        <input type="text" class="Id1" id="member_id" name="member_id" size="20" value="${memberInfo.member_id}"  readonly>
                    </div>
                    <div class="container-md text-center">
                        <div class="">
                            <label for="examplePw">비밀번호</label>
                        </div>
                        <input type="password" class="Pw1" id="member_pw" name="member_pw"  size="20">
                    </div>
                    <div class="container-md text-center">
                        <div class="">
                            <label for="examlePw">비밀번호 확인</label>
                        </div>
                        <input type="password" id="member_pw2" name="member_pw2"  size="20">
                    </div>
                    <div class="container-md"  id="btn1">
                        <button type="button" class="return_btn btn btn-outline-secondary btn_2" >취소</button>
                        <button type="submit" class="withdrawal_btn btn btn-outline-secondary btn_2" >회원탈퇴</button>
                    </div>
                    
                </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    </form>
	<c:if test="${msg == false }">
	  <p align="center">
	   	입력한 비밀번호가 잘못 되었습니다.<br>
	   	   다시 입력해 주세요.
	  </p>
	</c:if>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
  </body>
</html> 