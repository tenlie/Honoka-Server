<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jPages.js"></script>
<script type="text/javascript">
function deleteCheck(sugnum){
	var c=confirm("글번호 ["+sugnum+"]을 삭제하시겠습니까?")
	if(c){
		location.href="sugDelete.do?sugnum="+sugnum;
	}
}

/* 리플 달기 */
function replyBtn(mid){
	var page = ${page};
	if($("#replyContent").val()==""){
		alert("내용을 입력해주세요")
		return;
	}
	if(confirm("댓글을 등록하시겠습니까?")){
		location.href="sugReplyWrite.do?mid="+mid+"&gulnum="+$("#sugnum").text()+"&content="
		+$("#replyContent").val()+"&sugnum="+$("#sugnum").text()+"&count="+$("#count").text()+"&page="+page;
	}
}
/*리플 수정 시 선택*/
function replyDetail(replynum) {
	$.ajax({
		url: 'sugReply.do',
		dataType : 'json',
		data : {
			replynum : replynum
		},
		success : function(data){
			$("#replyContent").val(data.content)
			$("#replyBtn").attr({value : "수정", onclick : "replyUpdate("+data.replynum+")"})
		}
	});
}

/*리플수정*/
function replyUpdate(replynum){
	var page = ${page};
	location.href="sugReplyUpdate.do?replynum="+replynum+"&content="+
	$("#replyContent").val()+"&sugnum="+$("#sugnum").text()+"&count="+$("#count").text()+"&page="+page;
}
/* 리플 삭제 */
function replyDelete(replynum){
	var page = ${page};
	var c=confirm("댓글을 삭제하시겠습니까?")
	if(c){
		location.href="sugReplyDelete.do?replynum="+replynum
				+"&sugnum="+$("#sugnum").text()+"&count="+$("#count").text()+"&page="+page;
	}
}

function sugUpdatePage(sugnum){
	var page = ${page};
	location.href='sugUpdatePage.do?sugnum='+sugnum+'&page='+page;
}

</script>
<style type="text/css">
input[type="text"] {
	width: 80%;
	display: inline-block;
}
</style>
</head>
<body>
<section id="main" class="container 75%">
	<section class="box">
	<div class="table-wrapper">
	<table>
		<tbody>	
			<tr><th width="100px">글번호</th><td id="sugnum">${sug.sugnum}</td>
				<th width="100px">작성일</th><td>${sug.writedate}</td>
			</tr>
			<tr><th width="100px">작성자</th><td>${sug.mid}</td>
				<th width="100px">조회수</th><td id="count">${sug.count}</td>
			</tr>
			<tr><th width="100px">제목</th><td colspan="3">${sug.title}</td>
			</tr>
			<tr><th width="100px">내용</th>
				<td colspan="3" height="200px">${sug.content}</td>
			</tr>
			<tr><td colspan="4" align="center">
				<input type="button" class="button small" value="목록" 
				onclick="location.href='searchSugList.do?page=${page}'"/>
				<c:if test="${sug.mid==mid}">
					<input type="button" class="special button small" value="수정"
					onclick="sugUpdatePage('${sug.sugnum}')"/>
					<input type="button" class="button small" value="삭제" 
					onclick="deleteCheck('${sug.sugnum}')"/>
				</c:if>	
				<c:if test="${mid=='admin'&&sug.mid!='admin'}">
					<input type="button" class="button small" value="삭제" 
					onclick="deleteCheck('${sug.sugnum}')"/>
				</c:if>		
			</td></tr>
		</tbody>
	</table>
	</div>
	<div class="row">
		<div class="4u 12u(1)">
		<h4>댓글</h4>
		<c:if test="${empty mid}">
		<input type="text" id="replyContent" disabled="disabled" value="로그인 한 회원만 댓글을 달 수 있습니다">
		<input type="button" onclick="replyBtn('${mid}')" class="button alt small" value="등록"
		id="replyBtn" disabled="disabled"/>
		</c:if>
		<c:if test="${not empty mid}">
		<input type="text" id="replyContent">
		<input type="button" onclick="replyBtn('${mid}')" class="button alt small" value="등록"
		id="replyBtn"/>
		</c:if>
		<br/><br/>
		<ul class="alt" id="replyList">
			<c:forEach items="${list}" var="list">
			<li>${list.writedate}　|　${list.mid}　:　${list.content}　
				<c:if test="${mid==list.mid}">
					<a href="javascript:replyDetail('${list.replynum}')">수정</a> 
					<a href="javascript:replyDelete('${list.replynum}')">삭제</a>
				</c:if>
			</li>
			</c:forEach>
		</ul>
	</div></div>
</section></section>
</body>
</html>