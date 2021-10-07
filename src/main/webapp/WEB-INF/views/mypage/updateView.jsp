<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<meta charset="utf-8">

<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_zonecode').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_roadAddress").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_roadAddress").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script>
	$(document).ready(function() {
		setDateBox();
	});

	// select box 연도 , 월 표시
	function setDateBox() {
		var dt = new Date();
		var com_year = dt.getFullYear();
		var com_month = dt.getMonth()+1;
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

		$("#year > option[value=" + ${memberInfo.member_birth_y} + "]").attr("selected", "true");
		$("#month > option[value=" + ${memberInfo.member_birth_m} + "]").attr("selected", "true");
		$("#day > option[value=" + ${memberInfo.member_birth_d} + "]").attr("selected", "true");

	}
</script>
<script>
		
		$(document).ready(function(){
			var formObj = $("form[name='frm_mod_member']");
			
			// 수정완료
			$(".update_btn").on("click", function(){
				if($("#member_pw").val()=="" || $("#member_pw2").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#member_pw").focus();
					return false;	
				}else{
					if($("#member_pw").val() == $("#member_pw2").val()) {
						if(confirm("수정하시겠습니까?")){
							alert("수정이 완료되었습니다 다시 로그인해주세요.")
							formObj.attr("action","${contextPath}/mypage/update.do");
							formObj.attr("method","post");
							formObj.submit();
						}
					}
				}
			 })				

			
			// 돌아가기
			$(".return_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/mypage/list.do");
				formObj.attr("method", "post");
				formObj.submit();				
			})
		
		})
		
		//비밀번호 확인
		$(function(){
			$('#member_pw2').blur(function(){			
				   if($('#member_pw').val() != $('#member_pw2').val()){
				    	if($('#member_pw2').val() != ''){
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
		<h2 class="font-weight-bold mt-5" align="center">내 정보 수정</h2>
	</div>
	
  <form name="frm_mod_member">
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
                    value="${memberInfo.member_id}"
                    readonly
                  />
                </div>
                
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
                변경 비밀번호
              </button>
              <!-- 비밀번호 데이터 -->
              <div class="col-3">
                <input
                  type="password"
                  class="form-control"
                  id="member_pw"
                  name="member_pw"
                  value="${memberInfo.member_pw}"
                  size="20"
                />
              </div>
              <button
                type="button"
                class="btn btn-outline-secondary col-3"
                disabled
              >
                변경 비밀번호 재확인
              </button>
              <!-- 비밀번호 재확인 데이터 -->
              <div class="col-3">
                <input
                  type="password"
                  class="form-control"
                  id="member_pw2"
                  name="member_pw2"
                  value="${memberInfo.member_pw}"
                  size="20"
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
                  id="member_name"
                  name="member_name"
                  value="${memberInfo.member_name}"  readonly
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
                    <c:if test="${memberInfo.member_gender eq '남'}">checked</c:if>
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
                    <c:if test="${memberInfo.member_gender eq '여'}">checked</c:if>
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
                <select id="" class="form-control text-center" name="member_hp">
                  <option selected>${memberInfo.member_hp}</option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select>
              </div>

              <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_hp2"
                  maxlength="4"
                  value="${memberInfo.member_hp2}"
                />
              </div>

              <div class="col-3 ">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_hp3"
                  maxlength="4"
                  value="${memberInfo.member_hp3}"
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
                <select id="year" class="form-control" name="member_birth_y">
                  <option selected>${memberInfo.member_birth_y} 년</option>
                </select>
              </div>
              <div class="col-3">                
                <select id="month" class="form-control" name="member_birth_m">
                  <option selected>${memberInfo.member_birth_m} 월</option>
                </select>
              </div>
              <div class="col-3">              
                <select id="day" class="form-control" name="member_birth_d">
                  <option selected>${memberInfo.member_birth_d} 일</option>
                </select>
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
                  id="member_email"
                  name="member_email"
                  value="${memberInfo.member_email}"
                />
              </div>
              <div class="col-3">
                <select id="" class="form-control" name="member_email2">
                  <option selected>${memberInfo.member_email2}</option>
                  <option value="hanmail.net">@hanmail.net</option>
                  <option value="naver.com">@naver.com</option>
                  <option value="yahoo.co.kr">@yahoo.co.kr</option>
                  <option value="hotmail.com">@hotmail.com</option>
                  <option value="paran.com">@paran.com</option>
                  <option value="nate.com">@nate.com</option>
                  <option value="google.com">@google.com</option>
                  <option value="gmail.com">@gmail.com</option>
                  <option value="empal.com">@empal.com</option>
                  <option value="korea.com">@korea.com</option>
                  <option value="freechal.com">@freechal.com</option>
                </select>
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
                  value="${memberInfo.member_zonecode}" 
                />
              </div>
              <button
                  type="button"
                  onclick="findAddr()"
                  class="btn btn-outline-secondary col-2"
                >
                  주소찾기
                </button>
            </div>
          </div>
          <div class="form-group">
                <input
                  type="text"
                  class="form-control col-11"
                  id="member_roadAddress"
                  name="member_roadAddress"
                  value="${memberInfo.member_roadAddress}"
                />             
            </div>
              <div class="form-group">              
                <input
                  type="text"
                  class="form-control col-11"
                  id="member_remainingAddress"
                  name="member_remainingAddress"
                  value="${memberInfo.member_remainingAddress}"
                 
                />
              </div>
            </div>
            <!-- 주소그룹 끝 -->
           
            <div class="mt-4 mb-1 d-flex justify-content-center">
              <button
                type="submit"
                class="update_btn btn btn-outline-secondary mr-3"
              >
                수정완료
              </button>
              <button type="button" class="return_btn btn btn-outline-secondary">
                돌아가기
              </button>
            </div>
            
      </span>
    </div>
   </form>  
  </body>
</html>