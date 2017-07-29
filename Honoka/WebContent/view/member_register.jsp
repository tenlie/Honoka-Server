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
<script type="text/javascript">

	function inputCheck(){
		var mid = document.getElementById("mid");
		var mname = document.getElementById("mname");
		var mphone = document.getElementById("mphone");
		if(mid.value.length == 0){
			alert("아이디를 입력해주세요.");
			mid.focus();
			return;
		}
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
		if(isNaN(mphone.value)){
			alert("전화번호는 숫자만 입력해주세요");
			mphone.focus();
			return;
		}
		var mpassword = document.getElementById("mpassword");
		var mpassword2 = document.getElementById("mpassword2");
		if(mpassword.value.length<4){
			alert("비밀번호는 4자 이상입니다.");
			mpassword.focus();
			return;
		}
		if(mpassword.value != mpassword2.value){
			alert("비밀번호가 같지 않습니다.");
			mpassword2.focus();
			return;
		}
		alert("회원가입이 완료되었습니다.");
		document.getElementById("memberForm").submit();
	}
	
	$(function(){
		$(document).on('click', '#idcheckbtn', function(){
			if($('#mid').val().length<5 || $('#mid').val().length>12 || pattern.test($('#mid').val())){
				alert("아이디는 5-12자의 영문 또는 숫자입니다.")
				return;
			}
			$.ajax({
				url: 'idcheck.do',
				datatype: 'json',
				data:{
					mid: $('#mid').val()
				},
				success : function(data){
					console.log(data);
					if(data==true){
						alert("사용 가능한 아이디입니다.");
						if(!$("#corporate").is(":checked")){
							$("#check").attr('disabled', false);
						}
						document.getElementById("mpassword").focus();
					}else{
						alert("이미 사용중인 아이디입니다.");
						document.getElementById("mid").focus();
					}
				}
			})
		})
	})
	
	//기업회원 클릭했을 때
	$(document).on('click', '#corporate', function(){
		$("#nameCheck").remove()
		$("#corpnum").attr('style' , 'display: inlineblock');
		$("#name").html("기업명*")
		$("#check").attr('disabled', true);
		$("#corpCheck").append('<input type="button" value="기업확인" id="nameCheck"'
				+'class="button special small"/>')
		alert("기업 회원의 경우, 관리자의 승인 후 기업 회원 기능을 사용할 수 있습니다.")
	})
	
	//개인회원 클릭했을 때
	$(document).on('click', '#personal', function(){
		$("#corpnum").attr('style' , 'display: none');
		$("#nameCheck").remove()
		$("#name").html("이름*")
	});
	
	//기업회원 이름 체크
	$(function(){
		$(document).on('click', '#nameCheck', function(){
			$.ajax({
				url: 'corpCheck.do',
				datatype: 'json',
				data:{
					mname: $('#mname').val()
				},
				success : function(data){
					if(data==false){
						alert("노선이 존재하는 기업만 기업회원으로 가입할 수 있습니다.\n기업명을 다시 입력해주세요.")
					}else if(data==true){
						alert("사용 가능한 기업명입니다")
						$("#check").attr('disabled', false);
					}
				}
			})
		})
	})
	
</script>
<body>
	<section id="main" class="container 75%"> 
	<section class="box">
	<h3 align="center">회원가입</h3>
	<hr/>
	<div class="table-wrapper">
		<h5 align="right">* 표시는 필수 항목입니다.</h5>
		<form action="insertMember.do" method="post" id="memberForm">
			<table>
			<tbody>	
			<tr>
				<th>회원 타입*</th>
				<td id="corp">
					<div class="row uniform 50%">
					<div class="4u 12u(2)">
						<input type="radio" id="personal" name="mtype" value="personal" checked>
						<label for="personal">개인회원</label>
					</div>
					<div class="4u 12u(2)">
						<input type="radio" id="corporate" name="mtype" value="personal">
						<label for="corporate">기업회원</label>
					</div>
					</div>
				</td>				
			</tr>
			<tr id="corpnum" style="display: none;">
				<th>기업번호*</th>
				<td><input type="text" id="mcorpnum" name="mcorpnum"/></td>
			</tr>
			<tr>
				<th>아이디*</th>
				<td><input type="text" id="mid" name="mid"> 
					<input type="button" id="idcheckbtn" value="중복확인" 
					class="button special small"></td>
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
				<th id="name">이름*</th>
				<td id="corpCheck"><input type="text" id="mname" name="mname"></td>
			</tr>
			<tr>
				<th>전화번호*</th>
				<td><input type="text" id="mphone" name="mphone"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="memail" name="memail" /></td>
			</tr>
			<tr><td colspan="2" align="center">			
				<input type="button" onclick="inputCheck()" value="확인" 
					class="button special small" disabled="disabled" id="check">
				<input type="reset" value="취소" class="button small"></td>
			</tr>
				</tbody>
			</table>
		</form>
	</div>
	</section></section>
</body>
</html>