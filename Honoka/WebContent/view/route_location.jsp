<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	getURL();
});

$(document).ready(function(){
	checkMobile();
})

 function checkMobile(){
		var filter = "win16|win32|win64|mac|macintel";
			if( navigator.platform  ){
			    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
			    	$("#imgRefresh").remove();
			    	$("#STATICMENU").append('</p><img src="images/refreshbus.png" onclick="refresh()"'
			    			+'style="cursor: pointer;" id="imgRefresh"/>');
			    }
			}
	}

	//proxy 이용, 해당 노선의 버스들의 현재 위치를 받아옴
	function getURL(){
		var routeid=$(".routeLocation").attr('id');
		var url="view/busLocation_proxy.jsp?routeid="+routeid;
		$.get(url, get_location);
	}

	//getURL() 함수를 통해 받아온 데이터들을 출력
	function get_location(data){
		var selector = "busLocationList";
		$(selector, data).each(function(index, item){
			var location=$("stationSeq", this).text();
			var plateno=$("plateNo", this).text();
			console.log(plateno)
			var stopname=$("#"+location+"name > span").text();
			$("#"+location).html('<img src="images/busicongani.png" onclick=busDetail("'+stopname
					+'","'+location+'","'+plateno+'") width="27px"'
					+'style="position: relative;top: 20px;cursor: pointer"/>');
			$("#"+location+"name").attr({
				onclick: 'busDetail("'+stopname+'","'+location+'","'+plateno+'")',
				style : 'font-weight: bold;cursor: pointer'})
		})
		
		
	}
	
	//버스 상세 보기
	function busDetail(stopname, stoporder, plateno){
		location.href="busDetail.do?routeid="+$(".routeLocation").attr('id')
				+"&stopname="+stopname+"&stoporder="+stoporder+"&plateno="+plateno;
	}
	
	//마이 버스에 추가
	function myBusAdd(mid, routeid){
		if(mid==''){ //로그인이 되어있지 않은 경우
			alert("로그인 후에 이용할 수 있습니다")
			location.href="login.do"
		}else{ //로그인이 되어 있으면 추가
			$.ajax({
				url: 'addMyBus.do',
				dataType : 'text',
				data : {
					mid : mid,
					routeid : routeid			
				},
				success : function(data){
					if(data=='false'){
						var c=confirm("이미 My Bus에 추가되어 있는 노선입니다.\nMy Bus를 보시겠습니까?");
						if(c){
							location.href="myBusList.do?mid="+mid;
						}
					}else{
						alert("My Bus에 추가되었습니다")
					}
				}
			})
		}
	}
	
	//증차 요청
	function increaseBus(routeid, companyname){
		$.ajax({
			url: 'increaseBus.do',
			data:{
				routeid: routeid,
				companyname: companyname
			},
			success : function(data){
				alert("증차 요청이 완료되었습니다.");
				$("#increaseBus").attr('disabled', true);
			}
		})
	}
	
	//버스 현재 위치 새로고침
	function refresh(){
		$.ajax({
			url: 'refreshLocation.do',
			data:{
				routeid: $(".routeLocation").attr('id')
			},
			success : function(data){
				for(var i=0;i<data.length;i++){
					$("#"+data[i].stoporder+"name").attr('style', 'none')
					$("#"+data[i].stoporder+"name").removeAttr("onclick")
					if(data[i].direction=="정"){
						$("#"+data[i].stoporder).html("<img src='images/forward.png' height='30px'/>"
								+"<br/><img src='images/forward.png' height='30px'/>")
					}else if(data[i].direction=='역'){
						$("#"+data[i].stoporder).html("<img src='images/reverse.png' height='30px'/>"
								+"<br/><img src='images/reverse.png' height='30px'/>")
					}
				}
				getURL();
			}
		})
	}
	
	//자동 새로고침
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
		<h3 align="center" id="${route.routeid}" class="routeLocation"> 
		<c:if test="${route.routetype=='8'}">급행</c:if>
		<c:if test="${route.routetype=='11'}">시외</c:if>
		<c:if test="${route.routetype=='12'}">좌석</c:if>
		<c:if test="${route.routetype=='14'}">광역</c:if> 
		${route.routenum}번 검색 결과</h3>
		<hr/>
	<div class="table-wrapper">
		<table>
			<thead>
			<tr><td colspan="2" align="center"><input type="button" class="button special small" value="My Bus" 
				onclick="myBusAdd('${mid}','${route.routeid}')"/>
				<input type="button" id="increaseBus" class="button small" value="증차 요청" 
				onclick="increaseBus('${route.routeid}','${route.companyname}')"/> <td></tr>
			<tr><td colspan="2">기점.종점　|　
				<font style="font-weight: bold;">${route.startstop}↔${route.endstop}</font>
				</td>
			</tr>
			<tr><td colspan="2">운행 시간　|　
				첫차  <font style="font-weight: bold;">${route.starttime}</font>　
				막차  <font style="font-weight: bold;">${route.endtime}</font>
				<img src="images/refreshbus.png" onclick="refresh()" 
				style="cursor: pointer;float: right;" id="imgRefresh" />
			</td></tr>
			</thead>
			<tbody>	
			<c:forEach items="${list}" var="stop">
				<tr id="${stop.stoporder}row">
				<td width="70px" class="stoporder" id="${stop.stoporder}" align="center">
				<c:if test="${stop.direction=='정'}">
					<img src="images/forward.png" height="30px"/><br/><img src="images/forward.png" height="30px"/>
				</c:if>
				<c:if test="${stop.direction=='역'}">
					<img src="images/reverse.png" height="30px"/><br/><img src="images/reverse.png" height="30px"/>
				</c:if>
					</td>
				<td id="${stop.stoporder}name"><span>${stop.stopname}</span><br/>
					<font size="2px">${stop.stopid}</font></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</section></section>
</body>
<div id="STATICMENU">
	<a href="#"><img src="images/top.jpg" width="30px"></a><br/>
	
</div>
</html>