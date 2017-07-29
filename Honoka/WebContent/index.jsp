<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>버스타버스타 BustaBusta</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/jquery.scrollgress.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<link rel="shortcut icon" href="images/favicon.ico" />
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-wide.css" />
</noscript>
<style type="text/css">
@FONT-FACE{
	font-family: '옛날목욕탕';
	src: url("fonts/A옛날목욕탕L.TTF");
}
</style>
<script type="text/javascript">
<c:if test="${param.logout=='success'}">
alert("성공적으로 로그아웃되었습니다.");
</c:if>

$(document).ready(function(){
	mobile();
	msieversion();
})

//한글 입력인지 체크
var pattern = /[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/g;

//크롬 브라우저 이용하는지 체크
function msieversion(){
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf("MSIE");
	if(msie>0) {
		alert("버스타버스타는 크롬 브라우저에 최적화되어 있습니다.\n크롬 브라우저를 이용해주십시오.");
	}
}

//모바일로 접속했는지 체크
function mobile(){
	var filter = "win16|win32|win64|mac|macintel";
		if( navigator.platform  ){
		    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
		    	$("#banner").attr('style', 'padding: 3em');
		    	$("#getRouteList").attr('onfocus', "this.type='email';");
		    }
		}
}

//노선 검색
function search() {
	var getRouteList = document.getElementById("getRouteList");
	if ($("#getRouteList").val() == "" || pattern.test($("#getRouteList").val())) {
		alert("노선번호를 바르게 입력해주세요.")
		getRouteList.focus();
	} else {
		location.href = 'routeList.do?routenum=' + $("#getRouteList").val()
				+ '&region=' + $("#region").val();
	}
}

//검색 시 엔터를 누르면 검색이 되도록
function checkEnt(){
	if ((event.which == 13) || (event.keyCode == 13)) {
		search();
	}else {       
		return true;
	}
}

function myBusList(mid) {
	if (mid == '') {
		alert("로그인 후에 이용할 수 있습니다")
		location.href= "login.do"
	} else {
		location.href = "myBusList.do?mid=" + mid
	}
}

</script>
</head>
<body class="landing">
	<!-- Header -->
	<header id="header" class="alt">
	<h1>
		<a href="index.do">BUSTABUSTA</a> by SCSA
	</h1>
	<nav id="nav">
	<ul>
		<c:if test="${mid ne null && admin eq null}">
			<li><a href="#" class="icon fa-angle-down">${mid}님</a>
				<ul><li><a href="memberUpdatePage.do?mid=${mid}">회원정보 수정</a></li>
					<li><a href="memberDeletePage.do?mid=${mid}">회원 탈퇴</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${admin ne null}">
			<li><a href="#" class="icon fa-angle-down">${mid}님</a>
				<ul><li><a href="memberListPage.do">전체 회원정보 관리</a></li>
					<li><a href="searchCorpList.do">기업회원 가입 승인</a></li>
					<li><a href="notice.do">공지사항 등록</a></li>
				</ul>
			</li>		
		</c:if>			
		<c:if test="${corporate ne null}">
		<li><a href="" class="icon fa-angle-down">Management</a>
		<ul>
			<li><a href="requireBusPage.do?mid=${mid}">증차요청 관리</a></li>
			<li><a href="notice.do">공지사항 등록</a></li>
		</ul></li>
		</c:if>
		<li><a href="index.do">Home</a></li>
		<c:if test="${not empty content}">
			<li><a href="" class="icon fa-angle-down">Menu</a>
				<ul>
					<li><a href="routeListPage.do">Bus Route</a></li>
					<li><a href="javascript:myBusList('${mid}')">My Bus</a></li>
					<li><a href="community_main.do">Community</a>
						<ul>
							<li><a href="searchLostList.do?page=1">분실물 게시판</a></li>
							<li><a href="searchSugList.do?page=1">건의사항 게시판</a></li>
						</ul></li>
				</ul></li>
		</c:if>
		<c:if test="${empty mid}">
			<li><a href="login.do" class="button">Login</a></li>
			<li><a href="memberRegisterPage.do" class="button">SignUp</a></li>
			<!-- 로그인이 되어 있지 않은 상황에서 쿠키가 존재하는지 확인, 쿠키가 존재하면 로그인 실행하도록 -->
			<%	String mid = "";
				String mpassword = "";
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						if (cookies[i].getName().equals("mid")) {
							mid = cookies[i].getValue();
						}
						if (cookies[i].getName().equals("mpassword")) {
							mpassword = cookies[i].getValue();
						}
					}
					if (mid!=""&&mpassword!="") {
						response.sendRedirect("member_login.do?mid=" + mid
								+ "&mpassword=" + mpassword);
					}
				}
			%>
		</c:if>
		<c:if test="${mid ne null}">
			<li><a href="main.do?action=logout" class="button">Logout</a></li>
		</c:if>

	</ul>
	</nav> </header>

	<!-- Banner -->
	<section id="banner">
	<h2><font style="font-family: 옛날목욕탕;">BUSTA BUSTA</font></h2>
	<p/>
	<h4>광역버스를 스마트하고 편리하게</h4>
	</section>
	<!-- Main -->
	<section id="main" class="container"> 
	<c:if test="${empty content}">
		<section class="box special features">
		<div class="features-row">
			<section style="margin-left: 225px">
			<input type="text" id="getRouteList" placeholder="노선 번호를 입력해주세요" onkeydown="checkEnt()"/>
			<br />
			<select name="region" id="region">
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
			</select> <br />
			<a href="javascript:search()" class="button special icon fa-search">노선 검색</a>
			</section>
		</div>
		<div class="features-row">
			<section> <a href="javascript:myBusList('${mid}')" style="color: white;">
				<span style="cursor: pointer;"><img src="img/그림2.png" width="100px"></span><p/>
				<h3>My Bus</h3></a> </section>
			<section> <a href="community_main.do" style="color: white;">
				<span style="cursor: pointer;"><img src="img/그림3.png" width="100px"></span><p/>
				<h3>Community</h3></a> </section>
		</div>
		</section>
	</c:if> </section>
	<c:if test="${not empty content}">
		<jsp:include page="${content}" />
	</c:if>

	<!-- Footer -->
	<footer id="footer">
	<ul>
		<a href="aboutcompany.do" style="color: #777777;">회사소개</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="privacypolicy.do" style="color: #777777;">개인정보보호정책</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="agreement.do" style="color: #777777;">이용약관</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="guide.do" style="color: #777777;">이용안내</a>
	</ul>
	<ul class="copyright">
		<li>COMPANY. SAMSUNG SDS</li>
		<li>OWNER. BUSTABUSTA</li>
		<li>TEL. 02-3429-5240</li>
		<li>ADDRESS. 서울시 강남구 역삼동 718-5</li>
	</ul>
	<ul class="copyright">
		<li>COPYRIGHT &copy; 2014 All RIGHTS RESERVED.</li>
	</ul>
	</footer> 
</body>
</html>