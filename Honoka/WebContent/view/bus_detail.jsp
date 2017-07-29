<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bus_detail.jsp</title>
<style>
table {
	border-collapse: collapse;
	width: 80%;
}

th {
	text-align: center;
	background-color: white;
	height: 40px;
}

td {
	border: 1px solid #fff;
	border-collapse: collapse;
	text-align: left;
	background-color: #fff;
	background-repeat: no-repeat;
}

#ale1, #ale2 {
	border: none;
	background-image: none;
}

img {
	width: 28px;
	height: 28px;
}

a{
	color: white;
}
#STATICMENU {
	margin: 0pt;
	padding: 0pt;
	position: absolute;
	right: 0px;
	top: 0px;
}
</style>
<!-- <script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.js"></script> -->
<script>

$(document).ready(function(){
	refresh();
	/* checkMobile(); */
})

//모바일인지 체크, 컴퓨터로 접속하는 경우 문자보내기 버튼이 보이지 않게
	function checkMobile(){
		var filter = "win16|win32|win64|mac|macintel";
			if( navigator.platform  ){
			    if( filter.indexOf(navigator.platform.toLowerCase())>=0 ){
			    	$("#sendKakao").attr('style', 'display:none');
			    }
			}
	}

//새로고침
function refresh() {
	$.ajax({
		url : "refreshSeat.do",
		type : "get",
		dataType : "json",
		data: {
			plateno: "1111"
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
		success : function(array) {
			var seated = 0;
			var currSeats = document.getElementsByTagName("td");
			for (i = 0; i < array.length; i++) {
				if (array[i] == 1) {
					currSeats[i].style.backgroundImage = 'url("images/seat2.png")'
					seated++;
				} else {
					currSeats[i].style.backgroundImage = 'url("images/seat.png")';
				}
			}
			$('#passengers').html(seated);
			$('#seats').html(45-seated);
		}
	});
};

$(function() {
	timer = setInterval( function () {
		refresh();
	}, 5000);
});


var stmnLEFT = 10; // 오른쪽 여백 
var stmnGAP1 = 0; // 위쪽 여백 
var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 150; // 스크롤 시작위치 
var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
var stmnTimer;

function RefreshStaticMenu() {
	var stmnStartPoint, stmnEndPoint;
	stmnStartPoint = parseInt(
			document.getElementById('STATICMENU').style.top, 10);
	stmnEndPoint = Math.max(document.documentElement.scrollTop,
			document.body.scrollTop)
			+ stmnGAP2;
	if (stmnEndPoint < stmnGAP1)
		stmnEndPoint = stmnGAP1;
	if (stmnStartPoint != stmnEndPoint) {
		stmnScrollAmount = Math.ceil(Math
				.abs(stmnEndPoint - stmnStartPoint) / 15);
		document.getElementById('STATICMENU').style.top = parseInt(document
				.getElementById('STATICMENU').style.top, 10)
				+ ((stmnEndPoint < stmnStartPoint) ? -stmnScrollAmount
						: stmnScrollAmount) + 'px';
		stmnRefreshTimer = stmnScrollSpeed;
	}
	stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed);
}

function InitializeStaticMenu() {
	document.getElementById('STATICMENU').style.right = stmnLEFT + 'px'; //처음에 오른쪽에 위치. left로 바꿔도.
	document.getElementById('STATICMENU').style.top = document.body.scrollTop
			+ stmnBASE + 'px';
	RefreshStaticMenu();
}

</script>
</head>
<body onload="InitializeStaticMenu();">
	<section id="main" class="container 75%"> <section
		class="box special features">
	<div class="features-row">
		<h3>
			<c:if test="${route.routetype=='0' || route.routetype=='13' || route.routetype=='23' }">일반</c:if>
							<c:if test="${route.routetype=='8'}">급행</c:if> <c:if
								test="${route.routetype=='11'}">시외</c:if> <c:if
								test="${route.routetype=='12'}">좌석</c:if> <c:if
								test="${route.routetype=='14'}">광역</c:if>
			${route.routenum}(${route.startstop}-${route.endstop})
		</h3>
		<hr/>
		<h4>${stopname}</h4>
		<input type="button" value="메세지 보내기"
		onclick="location.href='sendKakao.do?routeid=${route.routeid}&stopname=${stopname}&stoporder=${stoporder}'
		+'&plateno=${plateno}'"
		class="button special" id="sendKakao"> <br/> <br/>
		<c:if
			test="${route.routetype=='8' || route.routetype=='11'|| route.routetype=='12'|| route.routetype=='14'}">
				<div align="center">
					<ul class="alt">
						<li>전체좌석: 45석</li>
						<li>탑승자: <span id="passengers"></span>명</li>
						<li>잔여좌석: <span id="seats"></span>석</li>
					</ul>
				</div>	
			<div align="right">
				<a href="busDetail.do?routeid=${route.routeid}">실시간 위치정보</a><img
					id="refreshBtn" src="images/refreshbus.png" onclick="refresh()"
					style="cursor: pointer"/>
			</div>
			<div align="center">
			<table align="center">
				<tr>
					<th colspan="5">운전석</th>
				</tr>
				<tr>
					<th id="ale2" colspan="5"></th>
				</tr>
				<tr>
					<td>A1</td>
					<td>A2</td>
					<th id="ale1" rowspan="10"></th>
					<td>A3</td>
					<td>A4</td>
				</tr>
				<tr>
					<td>A5</td>
					<td>A6</td>
					<td>A7</td>
					<td>A8</td>
				</tr>
				<tr>
					<td>A9</td>
					<td>A10</td>
					<td>A11</td>
					<td>A12</td>
				</tr>
				<tr>
					<td>A13</td>
					<td>A14</td>
					<td>A15</td>
					<td>A16</td>
				</tr>
				<tr>
					<td>A17</td>
					<td>A18</td>
					<td>A19</td>
					<td>A20</td>
				</tr>
				<tr>
					<td>A21</td>
					<td>A22</td>
					<td>A23</td>
					<td>A24</td>
				</tr>
				<tr>
					<td>A25</td>
					<td>A26</td>
					<td>A27</td>
					<td>A28</td>
				</tr>
				<tr>
					<td>A29</td>
					<td>A30</td>
					<td>A31</td>
					<td>A32</td>
				</tr>
				<tr>
					<td>A33</td>
					<td>A34</td>
					<td>A35</td>
					<td>A36</td>
				</tr>
				<tr>
					<td>A37</td>
					<td>A38</td>
					<td>A39</td>
					<td>A40</td>
				</tr>
				<tr>
					<td>A41</td>
					<td>A42</td>
					<td>A43</td>
					<td>A44</td>
					<td>A45</td>
				</tr>
			</table>
			</div>
		</c:if>
		<c:if
			test="${route.routetype=='0'|| route.routetype=='13'|| route.routetype=='23'}">
			'남은 좌석 보기'는 좌석, 시외, 광역, 급행 버스만 가능합니다.
			</c:if>
	</div>
	</section> </section>

</body>
<div id="STATICMENU">
	<a href="#"><img src="images/top.jpg" width="30px"></a>
</div>
</html>