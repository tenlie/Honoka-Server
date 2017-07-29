<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//기업 회원으로 변경
	function check(){
		for(var i=0;i<document.getElementsByName("checkbox").length;i++){			
			if(document.getElementsByName("checkbox")[i].checked){
				if(confirm("선택한 회원들을 기업 회원으로 변경하시겠습니까?")){
					document.getElementById("corpUpdate").submit();
				}
			}
		}
	} 
</script>
</head>
<body>
<section id="main" class="container">
	<div class="row">
	<div class="12u">
	<section class="box">
	<h3 align="center">기업회원 가입 승인</h3>
	<hr/>
	<form action="updateCorp.do" method="post" id="corpUpdate">
	<div class="table-wrapper">
		<table>
		<thead>
			<tr>
				<th>회원아이디</th>
				<th>기업명</th>
				<th>전화번호</th>
				<th>등록번호</th>
				<th>가입승인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
			<tr><td>${list.mid}</td>
				<td>${list.mname}</td>
				<td>${list.mphone}</td>
				<td>${list.mcorpnum}</td>
				<td><input type="checkbox" id="${list.mid}" value="${list.mid}" name="checkbox">
					<label for="${list.mid}"></label>
				</td>
			</tr>
			</c:forEach>
			<tr align="center">
			<td colspan="5">
			<input type="button" value="확인" onclick="check()" class="special button small"/>
			<input type="button" value="회원 전체 목록" onclick="location.href='memberListPage.do'"
			class="button small"/>
			</td></tr>
		</tbody>
		</table>
	</div>
	</form>
	</section>
	</div></div></section>
</body>
</html>