<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<script src="/myproject1/script/jquery-1.12.4.js"></script>

<script>
$(function() {
	
	$("#btn_submit").click(function() {
		
		var userid = $.trim($("#userid").val());
		var pass = $.trim($("#pass").val());
		
		if( userid == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if( pass == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			 type: "POST",
			 data: "userid="+userid+"&pass="+pass,	//json
			 url: "loginWriteSub.do",
			 dataType: "text",
			 
			 success: function(result){
			  if( result == "ok") {
			  		alert(userid+"님 로그인 되셨습니다.");
			  		location="boardList.do"
			  } else {
			  		alert("아이디와 패스워드가 일치하지 않습니다.");
			  }
			 },
			 error: function() {
			  alert("오류 발생");
			 }
		});
	});
	
});

</script>


</head>

<style>
body {
	font-size: 9pt;
	font-color: #333333;
	font-family:맑은 고딕;
}
a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px;
	line-hieght: 2.3;
}
caption {
	font-size: 15pt;
	font-weight: bold;
	padding-bottom: 5px;
}

.div_button {
	width: 600px;
	text-align: center;
	margin-top: 5px;
	
}
</style>

<body>

<%@ include file="../include/topmenu.jsp" %>

<form id="frm" name="frm">
	<table>
		<caption>로그인</caption>
		<tr>
			<th width="25%"><label for="userid">아이디</label></th>
			<td>
			<input type="text" name="userid" id="userid" placeholder="아이디입력">
			</td>
		</tr>
		<tr>
			<th><label for="pass">암호</label></th>
			<td>
			<input type="password" name="pass" id="pass">
			</td>
		</tr>
	</table>
	
	<div class="div_button">
		<button type="button" id="btn_submit">로그인</button>
		<button type="reset">취소</button>
	</div>
</form>



</body>
</html>