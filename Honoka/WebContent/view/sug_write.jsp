<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="main" class="container">
<div class="row">
<div class="12u">
<section class="box">
	<h3 align="center">건의사항 글 등록</h3>
	<hr/>
	<form method="post" action="sugWrite.do?mid=${mid}">
		<div class="row uniform 50%">
		<div class="4u 12u(1)">
			<input type="text" id="title" name="title" placeholder="제목" value="${sug.title}"/>
		</div>
		</div>
		<div class="row uniform 50%">
		<div class="4u 12u(1)">
			<textarea id="content" name="content" rows="6" placeholder="내용">${sug.content}</textarea>
		</div>
		</div>
		<div class="12u" align="center">
		<br/>
		<ul class="actions">
			<c:if test="${empty sug}">
				<li><input type="submit" value="글 등록" class="special button small"/></li>
			</c:if>
			<c:if test="${not empty sug}">
				<li><input type="submit" value="수정" class="special button small"
				formaction="sugUpdate.do?sugnum=${sug.sugnum}&count=${sug.count}&page=${page}"/></li>
			</c:if>
			<li><input type="reset" value="취소" class="button small"/></li>
		</ul>
		</div>
	</form>
</section>											
</div></div></section>
</body>
</html>