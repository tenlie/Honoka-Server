<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* table{
	width: 600px;
}
th, td{
	font-size: 12px;
}
.box{
	height: 500px;
} */
</style>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script>
	function requireList(mid){
		$.ajax({
			url: "busRequireList.do",
			type: "get",	
			dataType: "json",
			data: {
				mid: mid,
				term: $('#term').val()
			},
			error: function(){
				console.log("요청관리 리스트 에러");
			},
			success: function(response){
				console.log(response);
				$(".table-wrapper").empty();
				var output = "";
				output += "<table><thead><tr><th>노선번호</th><th>기점</th><th>종점</th><th>기업명</th></tr></thead>";	
				output += "<tbody>"
				$.each(response, function(index, item){
					output += "<tr><td><a href='busGraphPage.do?routeid="+item.routeid+"&term="+$('#term').val()+"'>"+item.routenum +"</a></td>"; 
					output += "<td>"+ item.startstop +"</td>"
					output += "<td>"+ item.endstop +"</td>"
					output += "<td >"+ item.companyname +"</td></tr>"
				});
				output+="</tbody></table>";
				$(".table-wrapper").html(output);
			}
		});
	};
</script>
</head>
<body>
<section id="main" class="container">
	<section class="box">
		<h3 align="center">증차요청 관리</h3>
		<hr/>
		<div align="center">		
		<select name="term" id="term" style="width: 200px; position: relative;">
			<option value="" selected="selected">기간 선택(현재로부터)  
			<option value="-2">2개월 내</option>
			<option value="-6">6개월 내</option>
		</select>
		<a href="javascript:requireList('${mid}')" id="searchByTerm" style="position: relative; top: -44px; left: 22%" class="button special icon fa-search">검색</a>
		</div>
			<div class="table-wrapper">
			<table>
				<thead>
					<tr><th>노선번호</th>
						<th>기점</th>
						<th>종점</th>
						<th>기업명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="r">
					<tr><td><a href="busGraphPage.do?&routeid=${r.routeid}&term=-2">${r.routenum}</a></td>
						<td>${r.startstop}</td>
						<td>${r.endstop}</td>
						<td id="companyname">${r.companyname}</td></tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
	</section>
</section>
</body>
</html>