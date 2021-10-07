<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />




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

		$(node).each(function(index, value) {
			result += $(value).find("#head_pro_period").text() + ",";
			result += $(value).find("#head_pro_sub_name").text() + ",";
			result += $(value).find("#head_pro_aver_cost").text() + ",";
			result += $(value).find("#head_weather_aver_tem").text() + ",";
			result += $(value).find("#head_weather_high_tem").text() + ",";
			result += $(value).find("#head_weather_low_tem").text() + ",";
			result += $(value).find("#head_weather_aver_wind").text() + ",";
			result += $(value).find("#head_weather_high_wind").text() + ",";
			result += $(value).find("#head_weather_precipitation").text() + ",\n";
		})

		var itemNodes = $("#result_table_tbody").children();
		$(itemNodes).each(function(index, value) {
			result += $(value).find("#body_pro_period").text() + ",";
			result += $(value).find("#body_pro_sub_name").text() + ",";
			result += $(value).find("#body_pro_aver_cost").text() + ",";
			result += $(value).find("#body_weather_aver_tem").text() + ",";
			result += $(value).find("#body_weather_high_tem").text() + ",";
			result += $(value).find("#body_weather_low_tem").text() + ",";
			result += $(value).find("#body_weather_aver_wind").text() + ",";
			result += $(value).find("#body_weather_high_wind").text() + ",";
			result += $(value).find("#body_weather_precipitation").text() + ",\n";
		})

		return result;
	}
</script>



<script>
	$(document).ready(function() {
		setDateBox();
	});

	
	
	// 날짜 세팅
	// select box 연도 , 월 표시
	function setDateBox() {
		var dt = new Date();
		var com_year = dt.getFullYear();
		var com_month = dt.getMonth() + 1;
		var com_day = dt.getDate();

		for (var y = com_year - 1; y <= com_year; y++) {
			$("#start_day_year").append(
					"<option value='" + y + "'>" + y + "</option>");
			$("#end_day_year").append(
					"<option value='" + y + "'>" + y + "</option>");
		}

		// 월 뿌려주기(1월부터 12월)

		for (var i = 1; i <= 12; i++) {

			$("#start_day_month").append(
					"<option value='" + i + "'>" + i + "</option>")
		}

		for (var i = 1; i <= 12; i++) {
			$("#end_day_month").append(
					"<option value='" + i + "'>" + i + "</option>");
		}

		

		// 일 뿌려주기(1일부터 31일)
		for (var i = 1; i <= 31; i++) {
			$("#start_day_day").append(
					"<option value='" + i + "'>" + i + "</option>");
			$("#end_day_day").append(
					"<option value='" + i + "'>" + i + "</option>");
		}

		end_year = com_year - 1

		$("#start_day_year > option[value=" + end_year + "]").attr("selected",
				"true");
		$("#start_day_month > option[value=" + com_month + "]").attr(
				"selected", "true");
		$("#start_day_day > option[value=" + com_day + "]").attr("selected",
				"true");

		$("#end_day_year > option[value=" + com_year + "]").attr("selected",
				"true");
		$("#end_day_month > option[value=" + com_month + "]").attr("selected",
				"true");
		$("#end_day_day > option[value=" + com_day + "]").attr("selected",
				"true");

	}
	
	
	
</script>

<!-- 차트 삽입 -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>







</head>
<body>
	<form action="${contextPath }/waap/priceView.do">
		<div class="container1">
			<div class="btn-group pl-3 pr-3 d-flex justify-content-center"
				role="group" aria-label="price-infor"></div>
			<br>
			
			<div class="mx-auto" style="width: 800px">
			
			
			
				<h2 class="font-weight-bold mt-5" style="font-family: 'Nanum Myeongjo', serif;">기상 농산물 정보</h2>
				<br>

				<div class="row" style="width: 1000px">
					<div class="col-2">
						<span class="badge badge-pill badge-primary">부류</span> <br> <br>
						<select name="pro_div_code" id="pro_div_code"
							class="btn btn-outline-dark">
							<option value="1">식량작물</option>
							<option value="2">채소류</option>
						</select>


					</div>

					<div class="col-2">
						<span class="badge badge-pill badge-primary">기상</span> <br> <br>
						<select name="weather_condition" id="weather_condition"
							class="btn btn-outline-dark">
							<option value="기온">기온</option>
							<option value="강수량">강수량</option>
							<option value="풍속">풍속</option>
						</select>
					</div>


					<div class="col-2">
						<span class="badge badge-pill badge-primary">지역</span> <br> <br>
						<select name="pro_area" id="pro_area" class="btn btn-outline-dark">
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>

						</select>

					</div>
					<div class="col-4">
						<span class="badge badge-pill badge-primary">기간</span> <br> <br>
						시작일 : <select name="start_day_year" id="start_day_year"
							class="btn btn-outline-dark">

						</select> <select name="start_day_month" id="start_day_month"
							class="btn btn-outline-dark">

						</select> <select name="start_day_day" id="start_day_day"
							class="btn btn-outline-dark">

						</select> <br> <br> 종료일 : <select name="end_day_year"
							id="end_day_year" class="btn btn-outline-dark">

						</select> <select name="end_day_month" id="end_day_month"
							class="btn btn-outline-dark">

						</select> <select name="end_day_day" id="end_day_day"
							class="btn btn-outline-dark">

						</select>

					</div>

					<div class="col-2">
						<input type="submit" class="btn btn-secondary btn-sm" value="조회하기"
							style="height: 150px">
					</div>







				</div>
			</div>
		</div>
	</form>





	<div class="container px-0">
		<div class="container px-0 mt-5">
			<h5>
				지역 : ${pro_area } || 선택한 기상 : ${weather_condition } ||

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



		</div>





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
		<canvas id="bubble-chart" width="10" height="4"></canvas>
	</div>



	






</body>


<!-- 차트와 연관된 코드 -->

<script>
	var result_table_count = $('#result_table_tbody tr').length;
	var weather_condition = "${weather_condition}";

	
	var weather_dataSet = new Array(); // 최종 데이터 셋
	
	var weather_dataMap = new Map([
		["쌀", new Array()],
		["콩", new Array()],
		["팥", new Array()],
		["고구마", new Array()],
		["감자", new Array()],
		["시금치", new Array()],
		["열무", new Array()],
		["대파", new Array()]
	]
	); // 데이터 모음 집어넣기 위한 맵
	
	
	var weather_statusMap = new Map(); //
	
	var weather_label;


	
	var bubble_color;

	function www(x){
		if (weather_condition == "기온"){
			 return $('#result_table_tbody').children().eq(x).children().eq(3).text()
		 }else if(weather_condition == "강수량"){
			 return $('#result_table_tbody').children().eq(x).children().eq(3).text()
		 }else if(weather_condition == "풍속"){
			 return $('#result_table_tbody').children().eq(x).children().eq(3).text()
		 }
	}
	
	 
		 
		 
		 

	if(${pro_div_code} == 1){
		
			for (var i = 0; i <= result_table_count; i++) {
				
				if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "쌀"){
					
					var weather_data = weather_dataMap.get("쌀");
					
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("쌀", weather_data)
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "콩"){
					
					var weather_data = weather_dataMap.get("콩");
					
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("콩", weather_data)
					
					
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "팥"){
					
					var weather_data = weather_dataMap.get("팥")
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("팥", weather_data)
					
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "고구마"){
					
					var weather_data = weather_dataMap.get("고구마")
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
									
					weather_dataMap.set("고구마", weather_data)
					
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "감자"){
					
					var weather_data = weather_dataMap.get("감자")
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("감자", weather_data)
					
				}
				
				
				

			}
			
			
		
		
			weather_dataSet.push({
				label : "쌀",
				data : weather_dataMap.get("쌀"),
				backgroundColor : 'rgb(255, 153, 153)',
				fill : false,
				borederColor : 'rgb(255, 153, 153)' // 살구색
			})
		
			weather_dataSet.push({
						label : "콩",
						data : weather_dataMap.get("콩"),
						backgroundColor : 'rgb(102, 255, 255)',
						fill : false,
						borederColor : 'rgb(102, 255, 255)' // 청록
					})
		
					
			weather_dataSet.push({
						label : "팥",
						data : weather_dataMap.get("팥"),
						backgroundColor : 'rgb(255, 255, 051)',
						fill : false,
						borederColor :'rgb(255, 255, 051)' // 노랑
					})
					
					
			weather_dataSet.push({
						label : "고구마",
						data : weather_dataMap.get("고구마"),
						backgroundColor :'rgb(102,051,000)',
						fill : false,
						borederColor : 'rgb(102,051,000)' // 갈색
					})
					
			weather_dataSet.push({
						label : "감자",
						data : weather_dataMap.get("감자"),
						backgroundColor : 'rgb(102,000,204)',
						fill : false,
						borederColor : 'rgb(102,000,204)' // 보라색
					})
		
		
	}else if(${pro_div_code} ==2 ){
		
		for (var i = 0; i <= result_table_count; i++) {
			
			if($('#result_table_tbody').children().eq(i).children().eq(1)
					.text() == "시금치"){
				
				var weather_data = weather_dataMap.get("시금치");
				
				
				weather_data.push({
					x : $('#result_table_tbody').children().eq(i).children().eq(2)
							.text(),				
					y : www(i),
					r : 5
				})
				
				weather_dataMap.set("시금치", weather_data)
				
			}else if($('#result_table_tbody').children().eq(i).children().eq(1)
					.text() == "열무"){
				
				var weather_data = weather_dataMap.get("열무");
				
				
				weather_data.push({
					x : $('#result_table_tbody').children().eq(i).children().eq(2)
							.text(),				
					y : www(i),
					r : 5
				})
				
				weather_dataMap.set("열무", weather_data)
				
				
				
			}else if($('#result_table_tbody').children().eq(i).children().eq(1)
					.text() == "대파"){
				
				var weather_data = weather_dataMap.get("대파")
				
				weather_data.push({
					x : $('#result_table_tbody').children().eq(i).children().eq(2)
							.text(),				
					y : www(i),
					r : 5
				})
				
				weather_dataMap.set("대파", weather_data)
				
				
			}
			
			

		}
	
	
		weather_dataSet.push({
			label : "시금치",
			data : weather_dataMap.get("시금치"),
			backgroundColor : 'rgb(255, 153, 153)',
			fill : false,
			borederColor : 'rgb(255, 153, 153)' //살구색
		})
	
		weather_dataSet.push({
					label : "열무",
					data : weather_dataMap.get("열무"),
					backgroundColor : 'rgb(102, 255, 255)',
					fill : false,
					borederColor : 'rgb(102, 255, 255)' // 청록색
				})
	
				
		weather_dataSet.push({
					label : "대파",
					data : weather_dataMap.get("대파"),
					backgroundColor : 'rgb(255, 255, 051)',
					fill : false,
					borederColor :'rgb(255, 255, 051)' //노랑색
				})
				
				
	}

	 

	/* 차트 부분 */

	var chart1 = new Chart(document.getElementById("bubble-chart"), {
		type : 'bubble',
		data : {
			datasets : weather_dataSet
		},
		options : {

		}
	});
</script>





