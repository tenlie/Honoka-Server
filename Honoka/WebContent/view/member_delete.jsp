<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmCheck(mid){
		var x = document.getElementById("confirm").checked;
		console.log(x);		
		if (x == false) {
			alert("안내사항 동의를 체크해주세요.");
			return;
		}
		alert("회원탈퇴 완료되었습니다.");
		location.href="member_delete.do?mid="+mid;
	}
</script>
</head>
<body>
<section id="main" class="container 75%">
	<div class="row">
		<div class="12u">

			<!-- Table -->
				<section class="box">
					<h3 align="center">회원탈퇴 안내</h3>
					<hr/>
					<h4>${mid }님, 회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h4>
					<br/>
					<h5><img src="images/checked.png" width="20px"> 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h5>
					<h5>: 회원정보, 마이버스 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
						삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</h5>
					<h5><img src="images/checked.png" width="20px"> 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h5>
					<h5>: 분실물 게시판, 건의사항 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. 
						삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다. 
						탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</h5>
					<br/>
					<div align="left">
							<input type="checkbox" id="confirm" name="confirm" >
							<label for="confirm"><h4><b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b></h4></label>
					</div>
					<br/>
					<div align="center">
					<input type="button" onclick="confirmCheck('${mid}')" value="확인" 
						class="button special small">	
					</div>	
				</section>
		</div>
	</div>	
</section>					
</body>
</html>