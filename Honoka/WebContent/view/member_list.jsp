<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member_list.jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.js"></script>
<link rel="stylesheet" href="css/jPages.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/jPages.js"></script>
<script type="text/javascript">

	function searchMember(){
		location.href = 'memberSearch.do?mtype='+$("#mtype").val()
		+'&mid='+$("#mid").val();
	}

	function deleteConfirm(mid){
		var c= confirm("해당 회원에 대한 모든 정보가 삭제됩니다. 계속하시겠습니까?");
		if(c){
			location.href="memberDelete.do?mid="+mid;
		}
	}
			
	<c:if test="${param.delete=='success'}">
	alert('해당 회원에 대한 정보가 성공적으로 삭제되었습니다.');
	</c:if>

	<c:if test="${param.delete=='fail'}">
	alert('해당 회원은 삭제할 수 없습니다.');
	</c:if>
	
	$(document).ready(function(){
		//페이징 플러그인
		$("div.holder").jPages({
			containerID : "memberList",
			perPage: 5,
			startPage : 1,
			startRange : 1,
			midRange : 3,
			endRange: 1
		});
	});
</script>
</head>
<body>
	<section id="main" class="container"> <section
		class="box">
	<h3 align="center">전체 회원정보 관리</h3>
	<hr/>
	<br />
	<select name="getMtype" id="mtype" style="width: 35%; position: relative;">
				<option value="" selected>회원 유형을 선택하세요
				<option value="personal">개인회원
				<option value="corporate">기업회원
		</option>
		</select>
		<input type="text" id="mid" placeholder="회원 아이디를 입력해주세요" style="width: 40%; position: relative; top: -44px; left: 39%"/>
		<a href="javascript:searchMember()" style="position: relative; top: -88px; left: 83%" class="button special icon fa-search">검색</a>
		<div class="table-wrapper" style="overflow-y:hidden">
		<table>
			<thead>
			<tr>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>회원유형</th>
				<th>삭제</th>
			</tr>
			</thead>
			<tbody id="memberList">
			<c:forEach items="${list}" var="m">
				<tr>
					<td>${m.mid}</td>
					<td>${m.mname}</td>
					<td>${m.mphone}</td>
					<td>${m.memail}</td>
					<td>${m.mtype}</td>
					<td><c:if test="${m.mtype!='admin'}">
					<a href="javascript:deleteConfirm('${m.mid}')" class="button small">삭제</a>
					</c:if></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
		<div class="holder" align="center"></div>
	</section></section>
</body>
</html>