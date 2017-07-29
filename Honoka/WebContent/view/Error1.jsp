<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-wide.css" />
<style type="text/css">
@FONT-FACE{
	font-family: '나눔고딕';
	src: url("fonts/NANUMBARUNGOTHIC.TTF");
}
body{
	font-family: 나눔고딕;
	font-size: 12px;
}
</style>
</head>
<body align="center">
	<section id="main" class="container"> <section class="box">
	<img src="images/warning.png" alt="이미지를 불러올 수 없습니다." width="100px" />
	<p />
	<h3>페이지를 표시할 수 없습니다.</h3>
	<p />
	<div class="table-wrapper">
		<table>
			<tr>
				<td width="200px"><h4>${pageContext.exception.message}</h4></td>
			</tr>
		</table>
	</div>
	<p />
	<a href="index.do" class="button special">메인으로 돌아가기</a> </section></section>
</body>
</html>