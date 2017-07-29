<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	<c:if test="${param.login=='wrong'}">
	alert('아이디나 비밀번호가 틀렸습니다.')
	</c:if>
	

	$(document).on('click', '#cookie', function(){
		if($(this).is(':checked')){
			alert("자동 로그인 사용시 다음 접속부터는 로그인을 하실 필요가 없습니다."
					+"\n\n단, 개인정보가 유출될 수 있으니 주의하시기 바랍니다.")
		}
	})
</script>
<body>
<!-- Main -->
<section id="main" class="container 75%">
	<!-- <header>
		<h3>Login</h3>
	</header> -->
	<div class="box">
	<h3 align="center">로그인</h3>
	<hr/>
		<form method="post" action="member_login.do">
			<div class="row uniform 50%">
				<div class="6u 12u(3)">
					<input type="text" name="mid" id="mid" placeholder="ID" style="ime-mode:inactive;"/>
				</div>
				<div class="6u 12u(3)">
					<input type="password" name="mpassword" id="mpassword" placeholder="Password" />
				</div>
			</div>
			<div class="row uniform">
				<div class="12u">
					<input type="checkbox" id="cookie" name="cookie">
					<label for="cookie">자동 로그인</label>
					<ul class="actions align-center">
						<li><input type="submit" value="Login" class="button special"/></li>
						<li><input type="button" value="SignUp" onclick="location.href='memberRegisterPage.do'"/></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</section>
</body>
</html>