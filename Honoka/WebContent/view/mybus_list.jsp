<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//마이버스에서 삭제
function deleteMyBus(mid, routeid, routenum){
	var c=confirm(routenum+"번 버스를 마이버스 목록에서 삭제하시겠습니까?")
	if(c){
		location.href="deleteMyBus.do?mid="+mid+"&routeid="+routeid;
	}
}

</script>
</head>
<body>
	<section id="main" class="container 75%">
		<section class="box">
		<div class="row">
			<div class="4u 12u(1)">
				<h3 align="center">${mid}님의 노선</h3><hr/><br/>
				<ul class="alt">
				<c:if test="${not empty list}">
				<c:forEach items="${list}" var="list">
					<li><a href="getRouteLocation.do?routeid=${list.ROUTEID}">
					${list.ROUTENUM}(${list.REGION})</a>
					　　${list.STARTSTOP}-${list.ENDSTOP}
					<font style="position: relative; float: right; font-weight: bold; cursor: pointer;" 
					onclick="deleteMyBus('${mid}','${list.ROUTEID}','${list.ROUTENUM}')">삭제</font>
					</li>
				</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<li style="text-align: center">마이 버스가 없습니다. 등록해주세요.</li>
				</c:if>
				</ul>
			</div>
			</div>
		</section>
	</section>
</body>
</html>