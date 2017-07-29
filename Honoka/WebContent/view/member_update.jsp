<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type="text"] {
	width: 70%;
	display: inline-block;
}
input[type="password"] {
	width: 70%;
	display: inline-block;
}
</style>
</head>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function inputCheck(){
		var mid = document.getElementById("mid");
		var mname = document.getElementById("mname");
		var mphone = document.getElementById("mphone");
		if(mname.value.length == 0){
			alert("이름을 입력해주세요.");
			mname.focus();
			return;
		}
		if(mphone.value.length == 0){
			alert("전화번호를 입력해주세요.");
			mphone.focus();
			return;
		}
		var mpassword = document.getElementById("mpassword");
		var mpassword2 = document.getElementById("mpassword2");
		if(mpassword.value.length<6){
			alert("비밀번호는 6자 이상입니다.");
			mpassword.focus();
			return;
		}
		if(mpassword.value != mpassword2.value){
			alert("비밀번호가 같지 않습니다.");
			mpassword2.focus();
			return;
		}
		alert("회원정보가 수정되었습니다.");
		document.getElementById("memberForm").submit();
	}

</script>
<body>
	<section id="main" class="container 75%"> 
	<section class="box">
	<h3 align="center">회원정보 수정</h3>
	<hr/>
	<div class="table-wrapper">
		<h5 align="right">* 표시는 필수 항목입니다.</h5>
		<form action="updateMember.do" method="post" id="memberForm">
			<table>
				<tbody>	
				<tr>
					<th>아이디*</th>
					<td><input type="text" id="mid" name="mid" value="${member.mid}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호*</th>
					<td><input type="password" id="mpassword" name="mpassword"></td>
				</tr>
				<tr>
					<th>비밀번호확인*</th>
					<td><input type="password" id="mpassword2"></td>
				</tr>
				<tr>
					<th>이름*</th>
					<td><input type="text" id="mname" name="mname" value="${member.mname }"></td>
				</tr>
				<tr>
					<th>전화번호*</th>
					<td><input type="text" id="mphone" name="mphone" value="${member.mphone }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="memail" name="memail" value="${member.memail }"></td>
				</tr>
				<tr><td colspan="2" align="center">			
					<input type="button" onclick="inputCheck()" value="수정" 
						class="button special small">
					<input type="reset" value="취소" class="button small"></td>
				</tr>
					</tbody>
			</table>
		</form>
	</div>
	</section></section>
</body>
</html>