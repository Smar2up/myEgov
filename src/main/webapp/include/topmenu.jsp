<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String USERID = (String) session.getAttribute("SessionUserID");
%>

<table>
	<tr>
		<th width="25%">홈</th>
		<th width="25%"><a href="/myproject1/boardList.do">게시판</a></th>
		
	<%
	if( USERID == null ) {
	%>
		<th width="25%"><a href="/myproject1/memberWrite.do">회원가입</a></th>
		<th width="25%"><a href="/myproject1/loginWrite.do">로그인</a></th>
	<%
	} else {
	%>
		<th width="25%"><a href="/myproject1/memberModifyWrite.do">회원정보</a></th>
		<th width="25%"><a href="/myproject1/logout.do">로그아웃</a></th>
	<%
	}
	%>
	
	</tr>
</table>

</body>
</html>