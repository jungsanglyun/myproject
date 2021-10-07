<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
<meta charset="utf-8">

<head>
	<script type="text/javascript">

		$(document).ready(function(){
			var formObj = $("form[name='frm_list_member']");
			
			// 돌아가기
			$(".return_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/admin/management/mmm.do");
				formObj.attr("method", "post");
				formObj.submit();				
			})
			
		   
		})
</script>
</head>
<body>
	<div class="container">
		<h2 class="font-weight-bold mt-5" align="center">회원 상세정보</h2>
	</div>
	
	<form name="frm_list_member" id="listForm">
	<div class="container d-flex justify-content-center mt-5">
		<span class="border py-3">	
      		<div class="container">
            <!-- 아이디 그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  아이디
                </button>
                <!-- 아이디 데이터 -->
                <div class="col-3">
                  <input
                    type="text"
                    class="form-control"
                    id="member_id"
                    name="member_id"
                    value="${info.member_id}"
                    readonly
                  />
                </div>
                <div class="col-4"></div>
                <div></div>
             	</div>
            </div>
            <!-- 아이디 그룹 끝 -->
            <!-- 비밀번호 그룹 -->
            <div class="form-group">
              <div class="form-row">
              <button
                type="button"
                class="btn btn-outline-secondary col-2"
                disabled
              >
                비밀번호
              </button>
              <!-- 비밀번호 데이터 -->
              <div class="col-3">
                <input
                  type="password"
                  class="form-control"
                  id="member_pw"
                  name="member_pw"
				  value="${info.member_pw}"
				  readonly
                />
	            </div>
	            </div>
            </div>
            <!-- 비밀번호 그룹 끝 -->
            <!-- 이름 그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  이름
                </button>
              <!-- 이름 데이터 -->
              <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_name"
                  value="${info.member_name}"  readonly
                />
              </div>
              </div>
            </div>
            <!-- 이름 그룹 끝 -->
            <!-- 성별 그룹 -->
            <fieldset class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  성별
                </button>
              

              <div class="col-3 d-flex justify-content-center align-items-center ">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="member_gender"
                    value="남"
                    <c:if test="${info.member_gender eq '남'}">checked</c:if>
                  />
                  <label class="form-check-label" for="gridRadios1">
                    남자
                  </label>
                </div>
                <div class="col-1"></div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="member_gender"
                    value="여"
                    <c:if test="${info.member_gender eq '여'}">checked</c:if>
                  />
                  <label class="form-check-label" for="gridRadios2">
                    여자
                  </label>
                </div>
              </div>
            </div>
            </fieldset>
            <!-- 성별 그룹 끝 -->
            <!-- 전화번호 그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  전화번호
                </button>
              <div class="col-3">
                <input
                type="text"
                class="form-control"
                id=""
                name="member_hp"
                maxlength="4"
                value="${info.member_hp}" readonly
              />
              </div>

              <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_hp2"
                  maxlength="4"
                  value="${info.member_hp2}" readonly
                />
              </div>

              <div class="col-3 ">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_hp3"
                  maxlength="4"
                  value="${info.member_hp3}" readonly
                />
              </div>
              </div>
          </div>
          <!-- 전화번호 그룹 끝 -->
          <!-- 생년월일 그룹 -->
          <div class="form-group">
            <div class="form-row">           
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  생년월일
                </button>
              <div class="col-3">                
                <input type="text"  class="form-control" name="member_birth_y" value="${info.member_birth_y} 년" readonly> 
              </div>
              <div class="col-3">                
                <input type="text" class="form-control" name="member_birth_m" value="${info.member_birth_m} 월" readonly>
              </div>
              <div class="col-3">              
                <input type="text" class="form-control" name="member_birth_d" value="${info.member_birth_d} 일" readonly>
              </div>
            </div>
          </div>
          <!-- 생년월일 그룹 끝 -->
          <!-- 이메일 그룹 -->
             <div class="form-group">
               <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  이메일
                </button>
              <div class="col-4">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_email"
                  value="${info.member_email}" readonly
                />
              </div>
              <div class="col-4">
              <input type="text" class="form-control" name="member_email2" value="${info.member_email2}" readonly />
            </div>
        </div>
          </div>
          <!-- 이메일 그룹 끝 -->
          <!-- 주소그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  주소
                </button>
                <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id="member_zonecode"
                  name="member_zonecode"
                  value="${info.member_zonecode}" readonly
                />
              </div>
            </div>
          </div>
          <div class="form-group">
                <input
                  type="text"
                  class="form-control col-11"
                  id="member_roadAddress"
                  name="member_roadAddress"
                  value="${info.member_roadAddress}"
                  readonly
                />             
            </div>
              <div class="form-group">              
                <input
                  type="text"
                  class="form-control col-11"
                  id="member_remainingAddress"
                  name="member_remainingAddress"
                  value="${info.member_remainingAddress}"
                  readonly
                />
              </div>
            </div>
            <!-- 주소그룹 끝 -->
           
            <div class="mt-4 mb-1 d-flex justify-content-center">
              <button type="button" class="return_btn btn btn-outline-secondary">
                돌아가기
              </button>
            </div>  
	      </span>
      	</div>
      </form>
  </body>

</html>