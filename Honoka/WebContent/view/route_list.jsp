<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function(){
		mobile();
	})
	function selectRoute(routeid) {
		location.href = "getRouteLocation.do?routeid=" + routeid;
	}

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
<style type="text/css">
#STATICMENU {
	margin: 0pt;
	padding: 0pt;
	position: absolute;
	right: 0px;
	top: 0px;
}
</style>
</head>
<body onload="InitializeStaticMenu();">
	<section id="main" class="container 75%"> 
	<section class="box"> 
		<input type="text" id="getRouteList" placeholder="${routenum}번 ${region} 검색 결과" 
		style="width: 40%;" onkeydown="checkEnt()"/> 
		<select name="region" id="region"
		style="width: 35%; position: relative; top: -44px; left: 43%">
		<option value="" selected>지역명을 선택하세요.
		<option value="가평">가평
		<option value="고양">고양
		<option value="고양시일산서">고양시일산서
		<option value="과천">과천
		<option value="광명">광명
		<option value="광주">광주
		<option value="구리">구리
		<option value="군포">군포
		<option value="김포">김포
		<option value="남양주">남양주
		<option value="동두천">동두천
		<option value="부천">부천
		<option value="서울">서울
		<option value="성남">성남
		<option value="수원">수원
		<option value="시흥">시흥
		<option value="안성">안성
		<option value="안양">안양
		<option value="양주">양주
		<option value="양평">양평
		<option value="여주">여주
		<option value="연천">연천
		<option value="오산">오산
		<option value="용인">용인
		<option value="용인시기흥">용인시기흥
		<option value="의왕">의왕
		<option value="의정부">의정부
		<option value="이천">이천
		<option value="인천">인천
		<option value="진천">진천
		<option value="천안">천안
		<option value="파주">파주
		<option value="평택">평택
		<option value="포천">포천
		<option value="하남">하남
		<option value="화성">화성
	</select> <a href="javascript:search()"
		style="position: relative; top: -88px; left: 82%"
		class="button special icon fa-search">검색</a>
	<div class="table-wrapper">
		<table>
			<thead>
			<tr>
				<th width="30%">노선번호</th>
				<th>출발지-도착지</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="route">
					<tr>
						<td onclick="selectRoute('${route.routeid}')"
							style="cursor: pointer;">${route.routenum}번 
							<c:if test="${route.routetype=='8'}">급행</c:if> 
							<c:if test="${route.routetype=='11'}">시외</c:if> 
							<c:if test="${route.routetype=='12'}">좌석</c:if> 
							<c:if test="${route.routetype=='14'}">광역</c:if> <br /> 
							<font size="2px">${route.region}</font>
						</td>
						<td onclick="selectRoute('${route.routeid}')" style="cursor: pointer;">
							${route.startstop}-${route.endstop}<br /> 
							<font size="2px">첫차 : ${route.starttime} 막차 : ${route.endtime}</font>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td colspan='2'>노선이 존재하지 않습니다. 다시 검색해주세요.</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	</section></section>
</body>
<div id="STATICMENU">
	<a href="#"><img src="images/top.jpg" width="30px"></a>
</div>
</html>