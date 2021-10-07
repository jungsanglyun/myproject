<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>






<!DOCTYPE html>
<html lang="en">
<head>

<script>
	function downloadCSV() {
		const fileName = "priceView.csv";
		const csv = convertNodeToCsvString();

		var link = document.createElement("a");
		var blob = new Blob([ "\uFEFF" + csv ], {
			type : 'text/;charset=utf-8'
		});
		var url = URL.createObjectURL(blob);
		$(link).attr({
			"download" : fileName,
			"href" : url
		});
		link.click();
	}

	function convertNodeToCsvString() {
		var result = "";
		var node = $("#result_table_thead").children();

		$(node)
				.each(
						function(index, value) {
							result += $(value).find("#head_pro_period").text()
									+ ",";
							result += $(value).find("#head_pro_sub_name")
									.text()
									+ ",";
							result += $(value).find("#head_pro_aver_cost")
									.text()
									+ ",";
							result += $(value).find("#head_weather_aver_tem")
									.text()
									+ ",";
							result += $(value).find("#head_weather_high_tem")
									.text()
									+ ",";
							result += $(value).find("#head_weather_low_tem")
									.text()
									+ ",";
							result += $(value).find("#head_weather_aver_wind")
									.text()
									+ ",";
							result += $(value).find("#head_weather_high_wind")
									.text()
									+ ",";
							result += $(value).find(
									"#head_weather_precipitation").text()
									+ ",\n";
						})

		var itemNodes = $("#result_table_tbody").children();
		$(itemNodes)
				.each(
						function(index, value) {
							result += $(value).find("#body_pro_period").text()
									+ ",";
							result += $(value).find("#body_pro_sub_name")
									.text()
									+ ",";
							result += $(value).find("#body_pro_aver_cost")
									.text()
									+ ",";
							result += $(value).find("#body_weather_aver_tem")
									.text()
									+ ",";
							result += $(value).find("#body_weather_high_tem")
									.text()
									+ ",";
							result += $(value).find("#body_weather_low_tem")
									.text()
									+ ",";
							result += $(value).find("#body_weather_aver_wind")
									.text()
									+ ",";
							result += $(value).find("#body_weather_high_wind")
									.text()
									+ ",";
							result += $(value).find(
									"#body_weather_precipitation").text()
									+ ",\n";
						})

		return result;
	}
</script>


<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>메인화면</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
<!-- <link rel="stylesheet" href="/commumity/css/communityStyle.css" /> -->
<style>
.carousel .carousel-inner img {
	height: 400px;
	width: 100%;
	/* object-fit: cover; */
	overflow: hidden;
}
</style>


</head>

<div class="row flex-xl-nowrap justify-content-center">
	<!-- 공지사항 시작 -->
	<div class="col-md-12 col-xl-3">
		<h2 class="font-weight-bold text-center mt-5">공지사항</h2>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead class="bg-light text-center">
					<tr>
						<th scope="col-2" class="col-2">번호</th>
						<th scope="col-8" class="col-8">제목</th>
						<th scope="col-2" class="col-2">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="list" end="4">
						<tr>
							<th scope="row" class="text-center"><c:out
									value="${list.notice_no}" /></th>
							<td class="cursor_test"><a
								href="${contextPath}/notice/readView.do?notice_no=${list.notice_no}"><c:out
										value="${list.notice_title}" /></a></td>
							<td class="text-center"><c:out value="${list.view_count}" /></td>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 공지사항 끝 -->

		<!-- 커뮤니티 시작 -->
		<h2 class="font-weight-bold text-center mt-5">커뮤니티</h2>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead class="bg-light text-center">
					<tr>
						<th scope="col-2" class="col-2">번호</th>
						<th scope="col-8" class="col-8">제목</th>
						<th scope="col-2" class="col-2">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${communityList}" var="list" end="4">
						<tr>
							<th scope="row" class="text-center"><c:out
									value="${list.com_no}" /></th>
							<td class="cursor_test"><a
								href="${contextPath}/community/readView.do?com_no=${list.com_no}"><c:out
										value="${list.com_title}" /> <c:if
										test="${list.reply_count ne 0 }">
										<small><b><font color="red">[&nbsp;<c:out
														value="${list.reply_count}" />&nbsp;]
											</font></b></small>
									</c:if> </a></td>
							<td class="text-center"><c:out value="${list.view_count}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 커뮤니티끝 -->
	<!-- 슬라이드 테이블 -->
	<div class="col-md-12 col-xl-8 mx-5 mt-5">
		<div id="carouselExampleCaptions" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleCaptions" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner rounded" style="height: 400px">
				<div class="carousel-item active" data-interval="10000">
					<img
						src="https://c.pxhere.com/photos/3a/72/cucumbers_vegetables_eating_kitchen_ensiling_cucumbers_pig_iron_luncheon_eat-710456.jpg!d"
						srcset="https://c.pxhere.com/photos/3a/72/cucumbers_vegetables_eating_kitchen_ensiling_cucumbers_pig_iron_luncheon_eat-710456.jpg!d"
						alt="식물, 요리, 식품, 샐러드, 녹색, 생기게 하다, 야채, 부엌, 먹다, 쿡, 박, 먹기, 야채, 공식 만찬, 오이, 쑥쑥, 오이, 작은 오이, 점심, 선철, 꽃 피는 식물, 오이 피클, 오징어, 메이저, 키시, 육상 식물, 오이 박과 멜론 가족, 여름 스쿼시, 무료 이미지 In PxHere">
					<div class="carousel-caption d-block ">
						<h5 class="font-weight-bolder">편리성</h5>
						<p class="font-weight-bold">복잡한 기능을 쉽게 할수있는 농산물 분석 사이트</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="https://c.pxhere.com/photos/48/bd/leaf_vegetable_cabbage_green-156992.jpg!d"
						srcset="https://c.pxhere.com/photos/48/bd/leaf_vegetable_cabbage_green-156992.jpg!d"
						alt="식물, 잎, 꽃, 녹색, 생기게 하다, 야채, 식물학, 플로라, 양배추, 매크로 사진, 꽃 피는 식물, 육상 식물, 프랙탈 아트, 무료 이미지 In PxHere">
					<div class="carousel-caption d-block">
						<h5 class="font-weight-bolder">다양성</h5>
						<p class="font-weight-bold">10년치 데이터로 년도, 기온, 풍속, 강우량 등 어려운
							분석을 한번에 가능한 농산물 분석 사이트</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="https://c.pxhere.com/images/53/1f/b5dea804ceaee6a9891359371fd1-1418869.jpg!d"
						srcset="https://c.pxhere.com/images/53/1f/b5dea804ceaee6a9891359371fd1-1418869.jpg!d"
						alt="늙은, 야채, 채소, 건강, 건강한, 양배추, 당근, 회향, 검은 배경, 식품, 아직도 인생 사진, 유기체, 정물, 식물, 야채, 생기게 하다, 플로랄 디자인, 무료 이미지 In PxHere">
					<div class="carousel-caption d-block">
						<h5 class="font-weight-bolder">가시성</h5>
						<p class="font-weight-bold">표와 그래프로 시각화 하여 쉽게 분석 가능하도록 설계된 사이트</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleCaptions"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">이전</span>
			</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">다음</span>
			</a>
		</div>
		<!-- 슬라이드 테이블 끝 -->
		<!-- 메인 표 테이블 -->


		<div class="mt-5">
			<h5>
				지역 : ${pro_area } || 선택한 기상 : ${weather_condition } || 품종 :

				<c:choose>
					<c:when test="${pro_div_code==1}">
						식량작물
					</c:when>
					<c:when test="${pro_div_code==2 }">
						채소류
					</c:when>

				</c:choose>

				|| 기간 : ${resultMap.start_day } ~ ${resultMap.end_day }
				<button type="button"
					class="btn btn-outline-secondary btn float-right mb-2"
					id="export_button" onclick="downloadCSV()">CSV 다운</button>
			</h5>

			<div style="overflow: auto; height: 300px; width: 100%;">
				<div class="table-title">
					<table id="result-table" class="table table-bordered">
						<thead class="thead-light" id="result_table_thead">
							<tr>
								<th scope="row" id="head_pro_period">기간</th>
								<th scope="row" id="head_pro_sub_name">품목이름</th>
								<th scope="row" id="head_pro_aver_cost">평균가격</th>
								<th scope="row" id="head_weather_aver_tem">평균온도</th>
								<th scope="row" id="head_weather_high_tem">최고온도</th>
								<th scope="row" id="head_weather_low_tem">최저온도</th>
								<th scope="row" id="head_weather_percipitation">강수량</th>
								<th scope="row" id="head_weather_aver_wind">평균풍속</th>
								<th scope="row" id="head_weather_high_wind">최대풍속</th>
							</tr>

						</thead>

						<tbody id="result_table_tbody">
							<c:forEach var="proVO" items="${resultMap.proVOList }">
								<tr>

									<td id="body_pro_period">${proVO.pro_period }</td>
									<td id="body_pro_sub_name">${proVO.pro_sub_name }</td>
									<td id="body_pro_aver_cost">${proVO.pro_aver_cost }</td>
									<c:forEach var="weatherVO" items="${resultMap.weatherVOList }">
										<c:if
											test="${proVO.pro_period eq weatherVO.weather_period && proVO.pro_area eq weatherVO.weather_area}">
											<td id="body_weather_aver_tem">${weatherVO.weather_aver_tem }</td>
											<td id="body_weather_high_tem">${weatherVO.weather_high_tem }</td>
											<td id="body_weather_low_tem">${weatherVO.weather_low_tem }</td>
											<td id="body_weather_percipitation">${weatherVO.weather_precipitation }</td>
											<td id="body_weather_aver_wind">${weatherVO.weather_aver_wind }</td>
											<td id="body_weather_high_wind">${weatherVO.weather_high_wind }</td>
										</c:if>
									</c:forEach>

								</tr>
							</c:forEach>

						</tbody>

					</table>

				</div>
			</div>
		</div>
	</div>
	<!-- 메인 표테이블 끝 -->
</div>



</html>