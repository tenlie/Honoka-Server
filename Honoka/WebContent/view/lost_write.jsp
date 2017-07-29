<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lost_write.jsp</title>
<script type="text/javascript">
	/* function lostUpdate(lostnum, count){
		var page = ${page};
		location.href='lostUpdate.do?lostnum='+lostnum+'&count='+count+'&page='+page;
	} */
</script>
</head>
<body>
<form action="lostWrite.do?mid=${mid}" method="post" enctype="multipart/form-data">
<section id="main" class="container">
	<div class="row">
	<div class="12u">
	<section class="box">
		<h3 align="center">분실물 글 등록</h3>
		<hr/>
			<div class="row uniform 50%">
			<div class="4u 12u(1)">
				<input type="text" name="title" placeholder="제목" value="${lost.title}"/>
			</div>
			</div>
			<div class="row uniform 50%">
			<div class="4u 12u(1)">
				<input type="text" name="location" placeholder="획득 장소" value="${lost.location}"/>
			</div>
			</div>
			<div class="row uniform 50%">
			<div class="4u 12u(1)">
				<input type="file" name="lostimage"/>
			</div>
			</div>
			<div class="row uniform 50%">
			<div class="4u 12u(1)">
				<textarea name="content" rows="6" placeholder="내용">${lost.content}</textarea>
			</div>
			</div>
			<div class="12u" align="center">
			<br/>
				<ul class="actions">
					<c:if test="${empty lost}">
						<li><input type="submit" value="글 등록" class="special button small"/></li>
					</c:if>
					<c:if test="${not empty lost}">
						<li><input type="submit" value="수정" class="special button small"
						formaction="lostUpdate.do?lostnum=${lost.lostnum}&count=${lost.count}&page=${page}"/></li>
						<%-- <li><input type="submit" value="수정" class="special button small"
						formaction="javascript:lostUpdate('${lost.lostnum}','${lost.count}')"/></li> --%>
					</c:if>
				</ul>
			</div>
	</section>
</div></div></section>
</form>
</body>
</html>