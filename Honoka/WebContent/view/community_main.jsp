<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	$(document).ready(function() {
		checkMobile();
	})
	function checkMobile() {
		var filter = "win16|win32|win64|mac|macintel";
		if (navigator.platform) {
			if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
				$(".boarddetail").attr('style', 'display:none');
			}
		}
	}
</script>
</head>
<body>
	<section id="main" class="container"> <section class="box">
	<h3 align="center">Community</h3>
	<hr />
	<br />
		<h4>
			<a href="searchLostList.do?page=1">분실물 게시판(더보기)</a>
		</h4>
	<div class="table-wrapper">
		<table id="lostnfound">
			<tbody>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th class="boarddetail">작성일</th>
				<th class="boarddetail">조회수</th>
			</tr>
			<c:forEach items="${lostList}" var="lost" begin="0" end="2">
				<tr>
					<td>${lost.lostnum}</td>
					<td><a
						href="getLostDetail.do?lostnum=${lost.lostnum}&count=${lost.count}&page=1">
							${lost.title}</a>(${lost.replycount})
							<c:if test="${lost.image ne null}">
							<img src="images/imageicon2.png" width="18px">
							</c:if>
							</td>
					<td>${lost.mid}</td>
					<td class="boarddetail">${lost.writedate}</td>
					<td class="boarddetail">${lost.count}</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
			<div class="pager1" align="center"></div>
		<h4>
			<a href="searchSugList.do?page=1">건의사항 게시판(더보기)</a>
		</h4>
		<table id="suggestions">
			<tbody>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th class="boarddetail">작성일</th>
					<th class="boarddetail">조회수</th>
				</tr>
				<c:forEach items="${sugList}" var="sug" begin="0" end="2">
					<tr>
						<td>${sug.sugnum}</td>
						<td><a
							href="getSugDetail.do?sugnum=${sug.sugnum}&count=${sug.count}&page=1">
								${sug.title}</a>(${sug.replycount})</td>
						<td>${sug.mid}</td>
						<td class="boarddetail">${sug.writedate}</td>
						<td class="boarddetail">${sug.count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pager2" align="center"></div>
	</div>
	</section></section>
</body>
</html>