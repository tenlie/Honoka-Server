<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//카카오톡 인증키
Kakao.init('8836c3ff49acda8ef878874c225dfa04');

//카카오톡 전송
function sendLink() {
  Kakao.Link.sendTalkLink({
	  label: "[Busta]"+$("#num").val()+"번 버스("+$("#plateno").val()+")승차\n현재 위치 : "
	  +$("#startSelect").val()+"\n하차 정류장 : "+$("#stopSelect").val()
  });
  Kakao.cleanup()
}

//문자 전송
function sms() {
	var checkMobile=navigator.userAgent.toLowerCase(); //모바일 기기 체크
	if(checkMobile.match('iphone')){ //아이폰은 전송 불가
		alert("iOS의 경우 문자 보내기를 실행할 수 없습니다")
	}else if(checkMobile.match('android')){ //안드로이드 경우에만 전송 가능
		var phoneNum=prompt("수신 번호를 입력해주세요");
		if(phoneNum==null){
			return;
		}else if(phoneNum=='' || phoneNum.length<10 || phoneNum.length>11 || pattern.test(phoneNum)){
			alert("수신 번호를 바르게 입력해주세요")
			sms()
		}else{
			location.href = "sms:"+phoneNum+"?body=[Busta]"+$('#num').val() + "번 버스("
					+$("#plateno").val()+")승차/ 현재 위치 :"+$('#startSelect').val() 
					+ "/ 하차 정류장 : "+ $('#stopSelect').val()
		}
	}
}

</script>
</head>
<body>
<section id="main" class="container 75%"> 
<section class="box special features">
	<div class="features-row">
	<input type="hidden" value="${route.routeid}" id="routeid"/>
		버스 번호 <input type="text" id="num" value="${route.routenum}" readonly="readonly" /> 
			<input type="hidden" id="plateno" value="${plateno}"/>
		현재 위치 <input type="text" id="startSelect" value="${stopname}" readonly="readonly">
		하차 정류장 <select id="stopSelect">
			<c:forEach items="${list}" var="stop">
				<option value="${stop.stopname}">${stop.stopname}</option>
			</c:forEach>
		</select> <br/>
		<br/>
		<ul class="icons">
			<li><a onclick="sms()" class="button special">문자전송</a></li>
			<li><a onclick="sendLink()" class="button">카카오톡</a></li>
		</ul>
	</div>
	</section></section>
</body>
</html>