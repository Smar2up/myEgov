<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 화면</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="/myproject1/script/jquery-1.12.4.js"></script>
<script src="/myproject1/script/jquery-ui.js"></script>

<script>
 $( function() {			//jquery 시작
   $( "#birth" ).datepicker({
     changeMonth: true,
     changeYear: true
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
		<caption>회원가입 폼</caption>
		<tr>
			<th width="25%"><label for="userid">아이디</label></th>
			<td>
			<input type="text" name="userid" id="userid" value="${memberVO.userid}">
			</td>
		</tr>
		<tr>
			<th><label for="pass">암호</label></th>
			<td>
			<input type="password" name="pass" id="pass">
			</td>
		</tr>
		<tr>
			<th><label for="name">이름</label></th>
			<td>
			<input type="text" name="name" id="name" value="${memberVO.name}">
			</td>
		</tr>
		<%
		String GENDER = (String) "${memberVO.gender}";
		%>
		<tr>
			<th><label for="gender">성별</label></th>
			<td>
			<input type="radio" name="gender" id="gender" value="M">남
			<input type="radio" name="gender" id="gender" value="F">여
			</td>
		</tr>
		<tr>
			<th><label for="birth">생년월일</label></th>
			<td>
			<input type="text" name="birth" id="birth" value="${memberVO.birth }">
			</td>
		</tr>
		<tr>
			<th><label for="phone">연락처</label></th>
			<td>
			<input type="text" name="phone" id="phone" value="${memberVO.phone }">
			</td>
		</tr>
		<tr>
			<th><label for="address">주소</label></th>
			<td>
			<input type="text" name="zipcode" id="zipcode" value="${memberVO.zipcode }">
			<button type="button" id="btn_zipcode">우편번호찾기</button>
			<br>
			<input type="text" name="address" id="address" value="${memberVO.address }">
			</td>
		</tr>
	</table>
	
	<div class="div_button">
		<button type="button" id="btn_submit">저장</button>
		<button type="reset">취소</button>
	</div>
</form>
</body>
</html>