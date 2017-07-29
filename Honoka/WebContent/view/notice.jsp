<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lost_write.jsp</title>
<style type="text/css">
</style>
<script type="text/javascript">
	<c:if test="${success=='yes'}"> //전송 성공시
	alert("공지사항 전송을 성공했습니다.");
	</c:if>
	<c:if test="${success=='no'}"> //전송 실패시
	alert("공지사항 전송에 실패했습니다.");
	</c:if>
	
	//전송 전에 체크
	function noticeCheck(){
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		var beginDate=document.getElementById("beginDate");
		var endDate=document.getElementById("endDate");
		var today=new Date();
 		if(title.value.length==0){
			alert("제목을 입력해주세요.");
			title.focus();
			return;
		}
		if(content.value.length==0){
			alert("내용을 입력해주세요.");
			content.focus();
			return;
		}
		if(beginDate.value.length==0){ //날짜를 입력하지 않으면 value에 현재 날짜를 입력
			beginDate.value=today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate();
		}
		if(endDate.value.length==0){  //날짜를 입력하지 않으면 value에 현재 날짜를 입력
			endDate.value=today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate();
		}
		if(beginDate.value>endDate.value){ //시작 날짜가 끝나는 날짜보다 빠르면 실행 x
			alert("기간이 잘못되었습니다. 다시 입력해주세요")
			beginDate.focus();
		}
		var c=confirm("공지사항을 전송하시겠습니까?");
		if(c){
			document.getElementById("noticeForm").submit();
		}
	}
</script>
</head>
<body>
	<form action="sendNotice.do" id="noticeForm" method="post" enctype="multipart/form-data">
		<section id="main" class="container">
		<div class="row">
			<div class="12u">
			<section class="box">
			<h3 align="center">공지사항 등록</h3><hr/>
				<div class="row uniform 50%">
				<div class="4u 12u(1)">
					<table>
						<tr>
							<th style="text-align: center;"><span>${mid}</span></th>
							<td><input type="text" name="title" id="title"
								placeholder="제목(30자 이내)" maxlength="30" value="" /></td>
						</tr>
					</table>
				</div>
				</div>
				<div class="row uniform 50%">
				<div class="4u 12u(1)">
					<table>
						<tr>
							<th style="text-align: center; width: 33%;">적용기간</th>
							<td><input type="date" name="beginDate" id="beginDate" min="2014-12-09"/>
								부터 &nbsp;&nbsp;
								<input type="date" name="endDate" id="endDate" /> 까지</td>
						</tr>
					</table>
				</div>
				</div>
				<div class="row uniform 50%">
					<div class="4u 12u(1)"></div>
				</div>
				<div class="row uniform 50%">
					<div class="4u 12u(1)">
						<textarea name="content" id="content" rows="6" placeholder="내용을 입력하세요(100자 이내)">${notice.content}</textarea>
					</div>
				</div>
				<div class="12u" align="center">
					<br />
					<ul class="actions">
					<li><input type="button" value="공지 등록"
						class="special button small" onclick="noticeCheck()"/></li>
					</ul>
				</div>
				</section>
			</div>
		</div>
		</section>
	</form>
</body>
</html>