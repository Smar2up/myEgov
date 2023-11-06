<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>

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
 
 	$("#btn_zipcode").click(function() {
 		
 		var w = 500;
 		var h = 100;
 		var url = "post1.do";
 		/* window.open(url, 'zipcode', 'width=500, height=100'); */
 		window.open(url, 'zipcode', 'width='+w+', height='+h);
 	});
   
 	$("#btn_idCheck").click(function() {
 		
 		var userid = $.trim($("#userid").val());
 		if( userid == "" ) {
 			alert("아이디를 입력해주세요.");
 			$("#userid").focus();
 			return false;
 		}
 		// idCheck.do로 데이터 전송
 		$.ajax({
 			 type: "POST",
 			 data: "userid="+userid,	//단일 데이터 json 형식으로 전송
 			 url: "idcheck.do",
 			 dataType: "text",			//리턴 타입
 			 
 			 success: function(result){
 			  if( result == "ok") {
 			   alert("사용 가능한 아이디 입니다");
 			  } else {
 			   alert("이미 사용중인 아이디 입니다.");
 			  }
 			 },
 			 error: function() {
 			  alert("오류 발생");
 			 }
		});
 	});
 	
	$("#btn_submit").click(function() {
	   
		var userid = $("#userid").val();
		var pass = $("#pass").val();
		var name = $("#name").val();	   
		userid = $.trim(userid);
		pass = $.trim(pass);
		name = $.trim(name);
		
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
		if( name == "") {
		 alert("이름을 입력해주세요.");
		 $("#name").focus();
		 return false;
		}
		
		$("#userid").val(userid);
		$("#pass").val(pass);
		$("#name").val(name);
		
		var formData = $("#frm").serialize();
		
		$.ajax({
		 type: "POST",
		 data: formData,
		 url: "memberWriteSave.do",
		 dataType: "text",
		 
		 success: function(result){
		  if( result == "ok") {
		   alert("저장완료");
		   location="loginWrite.do";
		  } else {
		   alert("저장실패");
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
		<caption>회원가입 폼</caption>
		<tr>
			<th width="25%"><label for="userid">아이디</label></th>
			<td>
			<input type="text" name="userid" id="userid" placeholder="아이디입력">
			<button type="button" id="btn_idCheck">중복체크</button>
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
			<input type="text" name="name" id="name">
			</td>
		</tr>
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
			<input type="text" name="birth" id="birth">
			</td>
		</tr>
		<tr>
			<th><label for="phone">연락처</label></th>
			<td>
			<input type="text" name="phone" id="phone"> (예시:010-1234-5678)
			</td>
		</tr>
		<tr>
			<th><label for="address">주소</label></th>
			<td>
			<input type="text" name="zipcode" id="zipcode">
			<button type="button" id="btn_zipcode">우편번호찾기</button>
			<br>
			<input type="text" name="address" id="address">
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