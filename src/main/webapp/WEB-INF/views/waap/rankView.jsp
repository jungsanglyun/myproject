<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>

<head>

<script type="text/javascript">
	function downloadCSV() {
		const fileName = "rankView.csv";
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
		var node = $("#div_table_title").children();

		$(node).each(function(index, value) {
			result += $(value).find("#head_pro_rank").text() + ",";
			result += $(value).find("#head_pro_sub_code").text() + ",";
			result += $(value).find("#head_pro_temp_updown").text() + ",";
			result += $(value).find("#head_pro_unit").text() + ",";
			result += $(value).find("#head_pro_aver_cost").text() + ",\n";
		})

		var itemNodes = $("#div_table_list").children();
		$(itemNodes).each(function(index, value) {

			result += $(value).find(".xData1").text() + ",";
			result += $(value).find(".xData2").text() + ",";
			result += $(value).find(".xData3").text() + ",";
			result += $(value).find(".xData4").text() + ",";
			result += $(value).find(".xData5").text() + "\n";
		})

		return result;
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
					
			$("#end_day_month").append(
					"<option value='" + i + "'>" + i + "</option>")
		}

		
		// 일 뿌려주기(1일부터 31일)
		for (var i = 1; i <= 30; i++) {
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
		$("#end_day_month > option[value=" + com_month + "]").attr(
				"selected", "true");
		$("#end_day_day > option[value=" + com_day + "]").attr("selected",
				"true");

	}
</script>

<script>
	function goRankView() {
		location.href = "${contextPath }/waap/rankView.do";
	}
</script>




<!-- chart.js용 script -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>



<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>순위정보</title>


</head>

<body>



	<form action="">
		<div class="container1">
			<div class="btn-group pl-3 pr-3 d-flex justify-content-center"
				role="group" aria-label="price-infor"></div>
			<br>
			<div class="mx-auto" style="width: 800px">
				<h2 class="font-weight-bold mt-5" style="font-family: 'Nanum Myeongjo', serif;">순위정보</h2>
				<br>

				<div class="row ">
					<div class="col-2">
						<span class="badge badge-pill badge-primary">부류</span> <br> <br>
						<select name="pro_div_code" id="pro_div_code"
							class="btn btn-outline-dark">
							<option value="1">식량작물</option>
							<option value="2">채소류</option>
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
					<div class="col-6">
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




					<input type="submit" onclick=goRankView()
						class="btn btn-secondary btn-sm" value="조회하기">



				</div>
			</div>
		</div>
	</form>


	<div class="container px-0">
		<div class="container px-0 mt-5">
			<h5>
				지역 : ${resultMap.proVOList[1].pro_area } ||
				
				품종 :
				<c:choose>
					<c:when test="${resultMap.proVOList[1].pro_div_code==1}">
						식량작물
					</c:when>
					<c:when test="${resultMap.proVOList[1].pro_div_code==2 }">
						채소류
					</c:when>

				</c:choose>
				
				||
				
				기간 : ${resultMap.start_day } ~
				${resultMap.end_day }
				<button type="button"
					class="btn btn-outline-secondary btn float-right mb-2"
					id="export_button" onclick="downloadCSV()">CSV 다운</button>
			</h5>

		</div>





		<input type="hidden" id="xxx" value="Xxx">



		<div style="overflow: auto; height: 300px; width:100%">
			<div class="table-title">
				<table id="result_table" class="table table-bordered">
					<thead class="thead-light" id="div_table_title">
						<tr>
							<th scope="row" id="head_pro_rank">순위</th>
							<th scope="row" id="head_pro_sub_code">품목</th>
							<th scope="row" id="head_pro_temp_updown">일일 등락 가격</th>
							<th scope="row" id="head_pro_unit">단위</th>
							<th scope="row" id="head_pro_aver_cost">평균가격</th>

						</tr>
					</thead>
					<tbody id="div_table_list">
						<c:choose>
							<c:when test="${fn:length(resultMap.proVOList)-1 > 0 }">
								<c:forEach begin="0" end="${fn:length(resultMap.proVOList)-1}"
									var="i">

									<tr id="${1000 + i}">
										<th scope="row" class="xData1">${i +1 }</th>
										<td class="xData2">${resultMap.proVOList[i].pro_sub_name }</td>

										<c:choose>


											<c:when test="${resultMap.proVOList[i].temp_updown == null}">
												<td>${resultMap.start_day }에 값이 없습니다. 유효기간(20.09.03 ~
													21.09.23</td>

											</c:when>


											<c:when test="${resultMap.proVOList[i].temp_updown > 0 }">
												<td id="${resultMap.proVOList[i].temp_updown + 10000}">
													<i class="bi-alarm" style="color: red;"><svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															fill="currentColor" class="bi bi-caret-up-fill"
															viewBox="2 2 16 16">
												        <path
																d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
												      	</svg></i>
												<p class="xdata3" style="display: inline">${resultMap.proVOList[i].temp_updown }</p>
												</td>
											</c:when>
											<c:when test="${resultMap.proVOList[i].temp_updown < 0 }">

												<td id="${resultMap.proVOList[i].temp_updown + 10000}">
													<i class="bi-alarm" style="color: blue;"> <svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															fill="currentColor" class="bi bi-caret-down-fill"
															viewBox="2 2 16 16">
													    <path
																d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
													    </svg></i>
													<p class="xData3" style="display: inline">${Math.abs(resultMap.proVOList[i].temp_updown) }</p>
												</td>
											</c:when>
											<c:otherwise>
												<td id="${resultMap.proVOList[i].temp_updown + 10000}"><p
														class="xData3" style="display: inline">${resultMap.proVOList[i].temp_updown }</p></td>
											</c:otherwise>


										</c:choose>
										<td class="xData4">${resultMap.proVOList[i].pro_unit}</td>
										<td class="xData5">${resultMap.proVOList[i].pro_aver_cost}</td>

									</tr>


								</c:forEach>

							</c:when>

							<c:otherwise>

								<td>${resultMap.end_day }에는값이 없습니다. 유효기간(20.09.03 ~
									21.09.23)</td>

							</c:otherwise>


						</c:choose>

					</tbody>

				</table>

			</div>
		</div>




		<canvas id="bar-line-chart" width="300" height="230"></canvas>



	</div>
</body>


<script>
	new Chart(document.getElementById("bar-line-chart"), {
		
		
		type : 'bar',
		data : {
			labels : [ $("#1000").children().eq(1).text(),
				$("#1001").children().eq(1).text(),
				$("#1002").children().eq(1).text(),
				$("#1003").children().eq(1).text(),
				$("#1004").children().eq(1).text() ],
			datasets : [ {
				label : '평균가격',
				yAxisID : 'A',
				data : [ $("#1000").children().eq(4).text(),
					$("#1001").children().eq(4).text(),
					$("#1002").children().eq(4).text(),
					$("#1003").children().eq(4).text(),
					$("#1004").children().eq(4).text() ]
			}, {
				type:'bar',
				label : '일일 등락 가격',
				data : [ $("#1000").children().eq(2).attr("id")-10000,
					$("#1001").children().eq(2).attr("id") -10000,
					$("#1002").children().eq(2).attr("id") -10000,
					$("#1003").children().eq(2).attr("id") -10000,
					$("#1004").children().eq(2).attr("id") -10000],
				lineTension : 0.3,
				backgroundColor : 'rgb(255, 153, 153)'
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					id : 'A',
					type : 'linear',
					position : 'left',
					ticks :{
						suggestedMin:-10000,
						beginAtZero:true
					}
				}, {
					id : 'A',
					type : 'linear',
					position : 'right',
					ticks : {
						
						beginAtZero: true
					}
				} ]
			},
			annotation : {
				annotations : [ {
					type : 'bar',
					mode : 'horizontal',
					scaleID : 'y-axis-0',
					value : 32,
					borderWidth : 4,
					label : {
						enabled : false,
						content : 'Test label'
					}
				} ]
			}
		}
	});

</script>


</html>
