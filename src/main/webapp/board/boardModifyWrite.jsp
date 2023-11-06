<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>

<script src="/myproject1/script/jquery-1.12.4.js"></script>
<script src="/myproject1/script/jquery-ui.js"></script>

</head>

<style>
body {
	font-size:9pt;
}
button {
	font-size:9pt;
}
table {
	width: 600px;
	border-collapse: collapse;
}
th, td {
	border:1px solid #cccccc;
	padding:3px;
}
.input1 {
	width:98%
}
.textarea {
	width:98%;
	height:70px;
}
</style>

<script>
/*		// default값 입력시키기
$(function() {
	
		$("#title").val("제목입력");
});
*/
function fn_submit() {
		
		// trim() -> 앞뒤 공백 제거, java, jsp
		// document.frm.title.value == ""
		//$("#title").val() == ""			id=""
		
		if( $.trim( $("#title").val() ) == "" ) {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		$("#title").val( $.trim($("#title").val()) );
		
		if( $.trim( $("#pass").val() ) == "" ) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		$("#pass").val($.trim($("#pass").val()));
		
		var formData = $("#frm").serialize();
		// ajax : 비동기 전송방식
		$.ajax({
			/* 전송 전 세팅 */
			type: "POST",
			data: formData,
			url: "boardModifySave.do",
			dataType: "text",		//리턴 타입
			
			/* 전송 후 세팅 */
			success: function(result){
				//alert(data);
				if(result == "1"){
					alert("저장완료");
					location = "boardList.do";
				} else if (result == "-1") {
					alert("암호를 확인하세요");
				} else {
					alert("저장 실패\n관리자에게 문의하세요");
				}
				
			},
			error: function(e) {	// 장애발생
				alert("오류발생");
				console.log(e.responseText);
			}
		});
	}
</script>

<body>
<form id="frm">

<input type="hidden" name="unq" value="${boardVO.unq }">

<table>
	<caption>게시판 수정 화면</caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80"><input type="text" name="title" id="title" class="input1"
																	value="${boardVO.title }"></td>
			
		
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th><label for="name">글쓴이</label></th>
		<td><input type="text" name="name" id="name" value="${boardVO.name }"></td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><textarea name="content" id="content" class="textarea">${boardVO.content }</textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit" onclick="fn_submit();return false">저장</button>
		<button type="reset">취소</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>