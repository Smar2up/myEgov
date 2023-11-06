<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호입력화면</title>
<script src="/myproject1/script/jquery-1.12.4.js"></script>
<script src="/myproject1/script/jquery-ui.js"></script>
</head>

<script>
$(function(){
	
	$("#delBtn").click(function(){
		
		var pass = $("#pass").val();
		pass = $.trim(pass);
		if( pass == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		var sendData = "unq=${unq}&pass="+pass;
		
		// ajax : 비동기 전송방식
		$.ajax({
			/* 전송 전 세팅 */
			type: "POST",
			data: sendData,			// json설정
			url: "boardDelete.do",
			dataType: "text",		//리턴 타입
			
			/* 전송 후 세팅 */
			success: function(result){
				//alert(data);
				if(result == "1"){
					alert("삭제완료");
					location = "boardList.do";
				} else if (result == "-1") {
					alert("암호가 일치하지 않습니다");
				} else {
					alert("저장 실패\n관리자에게 문의하세요");
				}
				
			},
			error: function(e) {	// 장애발생
				alert("오류발생");
				console.log(e.responseText);
			}
		}); //ajax
		
	});
	
});
</script>

<body>

<table>
	<tr>
		<th>암호입력</th>
		<td><input type="password" id="pass"></td>
		<td><button type="button" id="delBtn">삭제하기</button></td>
	</tr>
</table>

</body>
</html>