<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bus_graph_page.jsp</title>
<style type="text/css">
table {
	height: 400px;
}

th, td {
	width: 120%;
}

@media screen and (min-width: 0px) and (max-width:200px){                
chart{width: 50px;}}            

@media screen and (min-width: 300px) and (max-width: 500px){
chart{width: 350px;}}

@media screen and (min-width: 500px) and (max-width: 700px){
chart{width: 600px;}}

@media screen and (min-width: 800px){
chart{width: 850px;}}
</style>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		// Some raw data (not necessarily accurate)
		var arr = ${listForBarGraph};
		var routeid = ${routeid}
		var data = google.visualization.arrayToDataTable([
				[ '노선', '요청건수'], 
				[ '5시~6시', arr[0]],
				[ '6시~7시', arr[1]], 
				[ '7시~8시', arr[2]],
				[ '8시~9시', arr[3]], 
				[ '9시~10시', arr[4]],
				[ '10시~11시', arr[5]], 
				[ '11시~12시', arr[6]],
				[ '12시~13시', arr[7]], 
				[ '13시~14시', arr[8]],
				[ '14시~15시', arr[9]], 
				[ '15시~16시', arr[10]],
				[ '16시~17시', arr[11]],
				[ '17시~18시', arr[12]],
				[ '18시~19시', arr[13]],
				[ '19시~20시', arr[14]],
				[ '20시~21시', arr[15]],
				[ '21시~22시', arr[16]],
				[ '22시 이후~', arr[17]]
				]);
		var options = {
			title : '시간대별 요청건 수',
			titlePosition : 'out',
			titleTextStyle: {bold: false, fontSize:14, color:'#747474'},
			vAxis : {
					textStyle: {
						fontName: "맑은 고딕",
						color: 'black',
						italic: false
					},
					titleTextStyle: {
						fontName: "맑은 고딕",
						color: 'black',
						italic: false
					}
			},
			hAxis : {
				title : "시간대",
				textStyle: {
					fontName: "맑은 고딕",
					color: 'black',
					italic: false
				},
				titleTextStyle: {
					fontName: "맑은 고딕",
					color: 'black',
					italic: false
				}
			
			},
			seriesType : "bars",
			fontSize: 11,
			//fontName: 'malgun gothic',
			width: "100%"
			//series : {1 : {type : "line"}}
		}

	var chart = new google.visualization.ComboChart(document
			.getElementById('chart'));
	chart.draw(data, options);
	}
	
	google.setOnLoadCallback(drawChart);
	
	 function drawChart() {
		 	var arr = ${listForBarGraph};
	        var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
	          [ '출근시간(5시~9시)', arr[0]+arr[1]+arr[2]+arr[3]],
			  [ '오전(9시~12시)', arr[4]+arr[5]+arr[6]],
			  [ '오후(12시~17시)', arr[7]+arr[8]+arr[9]+arr[10]+arr[11]], 
			  [ '퇴근시간(17시~21시)', arr[12]+arr[13]+arr[14]+arr[15]],
			  [ '밤', arr[16]+arr[17]],
	        ]);

	        var options = {
	          title: '',
	          pieHole: 0.2,
	          chartArea: {left:30,top:20,bottom:20, width:'80%',height:'80%'},
	          fontName: 'malgun gothic',
	          fontSize: '80px',
	          legend: {position: 'labeled'},
	          width: "60%",
	          height: '100%'
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(data, options);
	      }
</script>
</head>
<body>
	<section id="main" class="container"> <section class="box">
	<h3 align="center">증차요청 통계 분석</h3>
	<hr/>
	<section class="box special features">
	<div class="features-row">
			<section > 
					[노선번호] ${route.routenum}
					<c:if test="${route.routetype=='0' || route.routetype=='13' || route.routetype=='23' }">일반</c:if>
					<c:if test="${route.routetype=='8'}">급행</c:if> 
					<c:if test="${route.routetype=='11'}">시외</c:if> 
					<c:if test="${route.routetype=='12'}">좌석</c:if> 
					<c:if test="${route.routetype=='14'}">광역</c:if> <br/><br/> 
					${route.startstop} - ${route.endstop}<br/><br/> 
					<font size="2px">첫차 : ${route.starttime} 막차 : ${route.endtime}</font><br/> 
				</section>
			<section> 
			<span>시간대별 요청비율</span>
			<div id="donutchart" align="center"></div></section>
		</div>
	<div class="table-wrapper">
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
					<td align="center" id="chart"></td>
				</tr>
			</tbody>
		</table>
	</div>
	</section> </section>
</body>
</html>