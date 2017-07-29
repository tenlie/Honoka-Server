<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sug_list.jsp</title>
<link rel="stylesheet" href="css/jPages.css">
<script src="js/jPages.js"></script>
<style type="text/css">
	#legend1{
		display: none;
	}
</style>
<script type="text/javascript">
	function sugWrite(mid) {
		if (mid == '') {
			alert("회원만 글을 작성할 수 있습니다. 로그인해주세요.")
			location.href = "login.do"
		} else {
			location.href = 'sugWritePage.do?mid=' + mid
		}
	}

	function enter() {
		if ((event.which == 13) || (event.keyCode == 13)) {
			searchSugBtn();
		} else {
			return true;
		}
	}

	//페이징 플러그인
	var page = 0;
	
 	var paging = function() {		
		var p = ${page};
		console.log(p);		
		$("div.holder").jPages({
			containerID : "suggestionsList",
			perPage : 5,
			startPage : 1,
			startRange : 1,
			midRange : 3,
			endRange : 1,
			currentPage: p, 
			callback: function(pages, items){
				page = pages.current;
			}
		});
	};
	
	$(document).ready(function() {
		paging();
		checkMobile();
	});

	function searchSugBtn() {		
		$.ajax({
			url : "searchSug.do",
			type : "get",
			dataType : "json",
			data : {
				searchOption : $('#searchOption').val(),
				title : $('#search').val(),
				content : $('#search').val()
			},
			error : function() {
				console.log("에러");
			},
			success : function(response) {
				console.log(response);				
				$('#suggestionsList').empty();
				var output = "";
				$.each(response,
						function(index, item) {
							output += '<tr><td>' + item.sugnum + '</td>';
							output += '<td><a href="getSugDetail.do?sugnum='
									+ item.sugnum + '&count=' + item.count
									+ '&page=1">' + item.title + '</a>('
									+ item.replycount + ')</td>';
							output += '<td>' + item.mid + '</td>';
							output += '<td>' + item.writedate + '</td>';							
							output += '<td>' + item.count + '</td></tr>';
						})
				$('#suggestionsList').html(output);
				$('#listBtn').css('display', 'block');
				paging();
			}
		});
	};

	function checkMobile() {
		var filter = "win16|win32|win64|mac|macintel";
		if (navigator.platform) {
			if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
				$(".boarddetail").attr('style', 'display:none');
			}
		}
	}
	
	function getSugDetail(sugnum, count){
	    console.log(page);
		location.href="getSugDetail.do?sugnum="+sugnum+"&count="+count+"&page="+page;
	}
	
</script>
</head>
<body>
	<section id="main" class="container">
	<div class="row"><div class="12u">
		<section class="box">
		<h3 align="center">건의사항 게시판</h3>
		<hr/><br />
			<div class="table-wrapper">
			<table>
				<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th class="boarddetail">작성일</th>
					<th class="boarddetail">조회수</th>
				</tr>
				</thead>
				<tbody id="suggestionsList">
				<c:forEach items="${list}" var="list">
					<tr><td>${list.sugnum}</td>
						<td><a href="javascript:getSugDetail('${list.sugnum}','${list.count}')">
								${list.title}</a>(${list.replycount})</td>
						<td>${list.mid}</td>
						<td class="boarddetail">${list.writedate}</td>
						<td class="boarddetail">${list.count}</td>
						<td></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			<div align="right">
				<input type="button" onclick="sugWrite('${mid}')" value="글쓰기"
					class="special button small" />
				<input type="button" onclick="location.href='searchLostList.do?page=1'" 
				value="분실물" class="button small"/>
			</div>
			<div class="holder" align="center"></div>
			<br/>
			<select id="searchOption" style="position: relative; top: -20px; left: 22%; width: 14%; height: 23%;">
				<option value="title" selected="selected">제목</option>		
				<option value="content">내용</option>		
				<option value="titleNcontent">제목+내용</option>		
				</select>
				<input type="text" id="search" placeholder="검색어를 입력하세요" 
				style="position: relative; top: -48px; left: 38%; width: 25%; height: 50%;"
				onkeydown="enter()">
				<a href="javascript:searchSugBtn()" id="searchSugBtn" 
				style="position: relative; top: -76px; left: 65%;" class="special button small">검색</a>	
				<input type="button" value="목록" id="listBtn" onclick="location.href='searchSugList.do?page=${page}'" 
				style="position: relative; top:-107px; left: 75%; display:none;" class="button small">
			</section>
		</div>
	</div>
	</section>
</body>
</html>