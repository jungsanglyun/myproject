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

	
	
	// ?????? ??????
	// select box ?????? , ??? ??????
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

		// ??? ????????????(1????????? 12???)

		for (var i = 1; i <= 12; i++) {

			$("#start_day_month").append(
					"<option value='" + i + "'>" + i + "</option>")
		}

		for (var i = 1; i <= 12; i++) {
			$("#end_day_month").append(
					"<option value='" + i + "'>" + i + "</option>");
		}

		

		// ??? ????????????(1????????? 31???)
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

<!-- ?????? ?????? -->

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
			
			
			
				<h2 class="font-weight-bold mt-5" style="font-family: 'Nanum Myeongjo', serif;">?????? ????????? ??????</h2>
				<br>

				<div class="row" style="width: 1000px">
					<div class="col-2">
						<span class="badge badge-pill badge-primary">??????</span> <br> <br>
						<select name="pro_div_code" id="pro_div_code"
							class="btn btn-outline-dark">
							<option value="1">????????????</option>
							<option value="2">?????????</option>
						</select>


					</div>

					<div class="col-2">
						<span class="badge badge-pill badge-primary">??????</span> <br> <br>
						<select name="weather_condition" id="weather_condition"
							class="btn btn-outline-dark">
							<option value="??????">??????</option>
							<option value="?????????">?????????</option>
							<option value="??????">??????</option>
						</select>
					</div>


					<div class="col-2">
						<span class="badge badge-pill badge-primary">??????</span> <br> <br>
						<select name="pro_area" id="pro_area" class="btn btn-outline-dark">
							<option value="??????">??????</option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>

						</select>

					</div>
					<div class="col-4">
						<span class="badge badge-pill badge-primary">??????</span> <br> <br>
						????????? : <select name="start_day_year" id="start_day_year"
							class="btn btn-outline-dark">

						</select> <select name="start_day_month" id="start_day_month"
							class="btn btn-outline-dark">

						</select> <select name="start_day_day" id="start_day_day"
							class="btn btn-outline-dark">

						</select> <br> <br> ????????? : <select name="end_day_year"
							id="end_day_year" class="btn btn-outline-dark">

						</select> <select name="end_day_month" id="end_day_month"
							class="btn btn-outline-dark">

						</select> <select name="end_day_day" id="end_day_day"
							class="btn btn-outline-dark">

						</select>

					</div>

					<div class="col-2">
						<input type="submit" class="btn btn-secondary btn-sm" value="????????????"
							style="height: 150px">
					</div>







				</div>
			</div>
		</div>
	</form>





	<div class="container px-0">
		<div class="container px-0 mt-5">
			<h5>
				?????? : ${pro_area } || ????????? ?????? : ${weather_condition } ||

				<c:choose>
					<c:when test="${pro_div_code==1}">
						????????????
					</c:when>
					<c:when test="${pro_div_code==2 }">
						?????????
					</c:when>

				</c:choose>
				|| ?????? : ${resultMap.start_day } ~ ${resultMap.end_day }
				<button type="button"
					class="btn btn-outline-secondary btn float-right mb-2"
					id="export_button" onclick="downloadCSV()">CSV ??????</button>
			</h5>



		</div>





		<div style="overflow: auto; height: 300px; width: 100%;">
			<div class="table-title">
				<table id="result-table" class="table table-bordered">
					<thead class="thead-light" id="result_table_thead">
						<tr>
							<th scope="row" id="head_pro_period">??????</th>
							<th scope="row" id="head_pro_sub_name">????????????</th>
							<th scope="row" id="head_pro_aver_cost">????????????</th>
							<th scope="row" id="head_weather_aver_tem">????????????</th>
							<th scope="row" id="head_weather_high_tem">????????????</th>
							<th scope="row" id="head_weather_low_tem">????????????</th>
							<th scope="row" id="head_weather_percipitation">?????????</th>
							<th scope="row" id="head_weather_aver_wind">????????????</th>
							<th scope="row" id="head_weather_high_wind">????????????</th>
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


<!-- ????????? ????????? ?????? -->

<script>
	var result_table_count = $('#result_table_tbody tr').length;
	var weather_condition = "${weather_condition}";

	
	var weather_dataSet = new Array(); // ?????? ????????? ???
	
	var weather_dataMap = new Map([
		["???", new Array()],
		["???", new Array()],
		["???", new Array()],
		["?????????", new Array()],
		["??????", new Array()],
		["?????????", new Array()],
		["??????", new Array()],
		["??????", new Array()]
	]
	); // ????????? ?????? ???????????? ?????? ???
	
	
	var weather_statusMap = new Map(); //
	
	var weather_label;


	
	var bubble_color;

	function www(x){
		if (weather_condition == "??????"){
			 return $('#result_table_tbody').children().eq(x).children().eq(3).text()
		 }else if(weather_condition == "?????????"){
			 return $('#result_table_tbody').children().eq(x).children().eq(3).text()
		 }else if(weather_condition == "??????"){
			 return $('#result_table_tbody').children().eq(x).children().eq(3).text()
		 }
	}
	
	 
		 
		 
		 

	if(${pro_div_code} == 1){
		
			for (var i = 0; i <= result_table_count; i++) {
				
				if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "???"){
					
					var weather_data = weather_dataMap.get("???");
					
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("???", weather_data)
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "???"){
					
					var weather_data = weather_dataMap.get("???");
					
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("???", weather_data)
					
					
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "???"){
					
					var weather_data = weather_dataMap.get("???")
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("???", weather_data)
					
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "?????????"){
					
					var weather_data = weather_dataMap.get("?????????")
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
									
					weather_dataMap.set("?????????", weather_data)
					
					
				}else if($('#result_table_tbody').children().eq(i).children().eq(1)
						.text() == "??????"){
					
					var weather_data = weather_dataMap.get("??????")
					
					weather_data.push({
						x : $('#result_table_tbody').children().eq(i).children().eq(2)
								.text(),				
						y : www(i),
						r : 5
					})
					
					weather_dataMap.set("??????", weather_data)
					
				}
				
				
				

			}
			
			
		
		
			weather_dataSet.push({
				label : "???",
				data : weather_dataMap.get("???"),
				backgroundColor : 'rgb(255, 153, 153)',
				fill : false,
				borederColor : 'rgb(255, 153, 153)' // ?????????
			})
		
			weather_dataSet.push({
						label : "???",
						data : weather_dataMap.get("???"),
						backgroundColor : 'rgb(102, 255, 255)',
						fill : false,
						borederColor : 'rgb(102, 255, 255)' // ??????
					})
		
					
			weather_dataSet.push({
						label : "???",
						data : weather_dataMap.get("???"),
						backgroundColor : 'rgb(255, 255, 051)',
						fill : false,
						borederColor :'rgb(255, 255, 051)' // ??????
					})
					
					
			weather_dataSet.push({
						label : "?????????",
						data : weather_dataMap.get("?????????"),
						backgroundColor :'rgb(102,051,000)',
						fill : false,
						borederColor : 'rgb(102,051,000)' // ??????
					})
					
			weather_dataSet.push({
						label : "??????",
						data : weather_dataMap.get("??????"),
						backgroundColor : 'rgb(102,000,204)',
						fill : false,
						borederColor : 'rgb(102,000,204)' // ?????????
					})
		
		
	}else if(${pro_div_code} ==2 ){
		
		for (var i = 0; i <= result_table_count; i++) {
			
			if($('#result_table_tbody').children().eq(i).children().eq(1)
					.text() == "?????????"){
				
				var weather_data = weather_dataMap.get("?????????");
				
				
				weather_data.push({
					x : $('#result_table_tbody').children().eq(i).children().eq(2)
							.text(),				
					y : www(i),
					r : 5
				})
				
				weather_dataMap.set("?????????", weather_data)
				
			}else if($('#result_table_tbody').children().eq(i).children().eq(1)
					.text() == "??????"){
				
				var weather_data = weather_dataMap.get("??????");
				
				
				weather_data.push({
					x : $('#result_table_tbody').children().eq(i).children().eq(2)
							.text(),				
					y : www(i),
					r : 5
				})
				
				weather_dataMap.set("??????", weather_data)
				
				
				
			}else if($('#result_table_tbody').children().eq(i).children().eq(1)
					.text() == "??????"){
				
				var weather_data = weather_dataMap.get("??????")
				
				weather_data.push({
					x : $('#result_table_tbody').children().eq(i).children().eq(2)
							.text(),				
					y : www(i),
					r : 5
				})
				
				weather_dataMap.set("??????", weather_data)
				
				
			}
			
			

		}
	
	
		weather_dataSet.push({
			label : "?????????",
			data : weather_dataMap.get("?????????"),
			backgroundColor : 'rgb(255, 153, 153)',
			fill : false,
			borederColor : 'rgb(255, 153, 153)' //?????????
		})
	
		weather_dataSet.push({
					label : "??????",
					data : weather_dataMap.get("??????"),
					backgroundColor : 'rgb(102, 255, 255)',
					fill : false,
					borederColor : 'rgb(102, 255, 255)' // ?????????
				})
	
				
		weather_dataSet.push({
					label : "??????",
					data : weather_dataMap.get("??????"),
					backgroundColor : 'rgb(255, 255, 051)',
					fill : false,
					borederColor :'rgb(255, 255, 051)' //?????????
				})
				
				
	}

	 

	/* ?????? ?????? */

	var chart1 = new Chart(document.getElementById("bubble-chart"), {
		type : 'bubble',
		data : {
			datasets : weather_dataSet
		},
		options : {

		}
	});
</script>





