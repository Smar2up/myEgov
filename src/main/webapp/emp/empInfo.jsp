<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"      uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YD Info</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="/myproject1/script/jquery-1.12.4.js"></script>
<script src="/myproject1/script/jquery-ui.js"></script>

<script>



$.datepicker.setDefaults({
     changeMonth: true,
     changeYear: true,
     showOn: "both",
     buttonImage: "emp/images/btn_date_resize.png",
     buttonImageOnly: true,
     dateFormat: 'yy-mm-dd'
});

 $( function() {
	$("input[name=startdate]").datepicker();
 
	$(".btn_click").on("click", function(e){
		
			var name = $("#header-name").val();
			var dname = $("#header-dname").val();
			name = $.trim(name);
			dname = $.trim(dname);
			
	 		var status = $('input[name=status]:checked').val(); 
			
			//var formData = $("#frm").serialize();
			
	 		var formData = {
	 				status: status,
					name: name,
					dname: dname,
					from: $("#from").val(),
					to: $("#to").val() };

	 		alert(JSON.stringify(formData));
			
			$.ajax({
			 type: "POST",
			 data: formData,
			 url: "empInfo.do",
			 contentType: "json/html; charset=UTF-8",
			 dataType: "json",
			 
			 success: function(){
			 	alert("조회완료");
			 },
			 error: function() {
			 	alert("오류 발생");
			 }
			});
			
	});
	
	$('input[name="empList"]').on("click", function(e){
		
		if ($('#'+this.id).is(':checked')) alert();
		
		var temp = new Array();
		
		<c:forEach var="result" items="${resultList}">
			temp.push("${result}");
		</c:forEach>
		
		//alert($.type(temp[this.value]));
     	var re = (temp[this.value]).replace("{", "");
		re = re.replace("}", "");
		//re = re.replace(/, /gi, "&") //replaceAll 기능
		
		//$.each(re.split(', '), function())
		(re.split(', ')).forEach( function(items){
			if ( ($('#'+items.split('=')[0]).length) && (items.split('=')[1] != 'null') ) {
				$('#'+items.split('=')[0]).attr("value", items.split('=')[1]);
				//alert(items.split('=')[1]);		
			}
		})
		
	
	});

	//전체 선택, 전체 해제
 	$('#checkAll').on("change", function(e){

 		const isChecked = $('#checkAll').is(':checked');
		
		//alert(isChecked);
		var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		
		for (var checkbox of checkboxes) {
			checkbox.checked = isChecked;
		}
	});
 	
 });
 
</script>
</head>

<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.container {
  width: 90%;
  max-width: 1024px;
  margin: 0 auto;

  display: grid;

  grid-template-columns: 450px 450px;
  grid-template-rows: 110px minmax(200px, auto);
  grid-gap: 20px;
  
  grid-template-areas:
  "header header"
  "body1 body2";
}

.header {
	grid-area: header;
	padding: 0px 0px 10px 0px;
}

.body1 {
	grid-area: body1;
	height: 450px;
}

.body2 {
	grid-area: body2;
}

span {
	display: inline-block;
	vertical-align: middle;
}

table {
	border-collapse: collapse;
}
.header-title {
	height: 40px;
	font-size: 14pt;
	line-height: 40px;	
}

.header1 {
	background-color: #f2f2f2;
	align-items: center;
	height: 80px;
	
	border:1px solid #cccccc;
}

.thead {
	width: 90px;
	height: 40px;
	line-height: 40px;
	text-align: right;
}

.detailHead {
	width: 75px;
	text-align: right;
	font-size: 9.5pt;
	font-weight: bold;
}

.detailInput {
	width: 130px;
	text-align: center;
}

.btn_click {
  background-color: #3e88c2;
  color: #fff;
  border: 0;
  outline: none;
  font-size: 10pt;
  padding: 4px 15px;
}

.btn_click:hover {
	background: red;
}

.btn_click:active {
	color: black;
}

button.btn_sub {
  background-color: #DCDADA;
  border: 0;
  outline: none;
  font-size: 9pt;
  padding: 4px 15px;
  margin: 1px;
  margin-left: 0%;
  margin-right: -1.2%;
}

button.btn_sub:hover {
	background: #cccccc;
}


</style>
<body>

<form id="frm" name="frm">

	<div class="container">
	
		<div class="header">
			<div class="header-title">
				<span style="width: 613px; text-align: left;">사원정보관리</span>
				<span class="headerButtons" style="width: 300px; text-align: right;">
					<button class="btn_click" id="btn_search">조회</button>
					<button class="btn_click" id="btn_input">입력</button>
					<button class="btn_click" id="btn_del">삭제</button>
					<button class="btn_click" id="btn_save">저장</button>
				</span>
			</div>
			
			<div class="header1">
				<div>
					<span class="thead">재직상태</span>
					<span>
						<input type="radio" name="status" id="all" value="">전체
						<input type="radio" name="status" id="work" value="work">재직
						<input type="radio" name="status" id="leave" value="leave">휴직
						<input type="radio" name="status" id="quit" value="quit">퇴직
					</span>
				</div>
				<div class="empSearch">
					<span style="width: 210px; text-align: right;">성명
						<input type="text" name="name" id="header-name" size="12">
					</span>
					<span style="width: 185px;  text-align: right;">부서
						<input type="text" name="dname" id="header-dname" size="12">
					</span>
					<span style="width: 360px; text-align: right; ">입사일자
						<input type="text" name="startdate" id="from" size="12">
						~
						<input type="text" name="startdate" id="to" size="12">
					</span>
				</div>
			</div>
				
		</div>
		
		<div class="body1" >사원목록<br>
			<div style="overflow-x:hidden; height:350px; border:1px solid #cccccc; text-align: center;">
				
				<table border="1px" bordercolor="#DCDADA">
					<tr>
						<th width="40px" height="30px"><input type="checkbox" id="checkAll"></th>
						<th width="200px">부서</th>
						<th width="120px">성명</th>
						<th width="90px">사원번호</th>
						<th width="90px">직급</th>
						<th width="70px">상태</th>
					</tr>
	
					<c:set var="idx" value="0" />
					
					<c:forEach var="result" items="${resultList }">
						<tr>
							<th ><input type="checkbox" name="empList" value="${idx}" id="${idx}"></th>
							<td>${result.dname } </td>
							<td>${result.name }</td>
							<td>${result.empno } </td>
							<td>${result.position } </td>
							<td>${result.status } </td>
						</tr>
						<c:set var="idx" value="${idx+1 }" />
					
					</c:forEach>
				</table>
				
			</div>
		</div>
		
		<div class="body2">기본정보<br>
			<div style="height: 145px;">
				<div style="border:1px solid #cccccc; background-color: #F3F2F2; height: 135px;">
					<div class="detail1">
						<span class="detailHead"> 성명</span>
						<span class="detailInput"><input type="text" name="name" id="name" size="14"></span>
						<span class="detailHead"> 사원번호</span>
						<span class="detailInput"><input type="text" name="empno" id="empno" size="14"></span>
					</div>
					<div class="detail2">
						<span class="detailHead"> 부서</span>
						<span class="detailInput"><input type="text" name="dname" id="dname" size="14"></span>
						<span class="detailHead"> 직급</span>
						<span class="detailInput">
							<select name="position" id="position" style="width: 125px; height: 21px;">
								<option value="사장">사장</option>
								<option value="이사">이사</option>
								<option value="부장">부장</option>
								<option value="차장">차장</option>
								<option value="과장">과장</option>
								<option value="대리">대리</option>
								<option value="사원" selected>사원</option>
							</select>
						</span>
					</div>
					<div class="detail3">
						<span class="detailHead"> 입사일자</span>
						<span class="detailInput"><input type="text" name="startdate" id="startdate" size="10"></span>
						<span class="detailHead"> 성별</span>
						<span class="detailInput" style="font-size: 9pt; display: inline-table; vertical-align: middle;">
							<span style="display: inline-block; width: 13%; text-align: right;"><input type="radio" name="gender" id="male" value="M"></span>
							<span style="display: inline-block; width: 37%; text-align: center;">Male</span>
							<span style="display: inline-block; width: 12%; text-align: right;"><input type="radio" name="gender" id="female" value="F"></span>
							<span style="display: inline-block; width: 38%; text-align: center;">Female</span>
						</span>
					</div>
					<div class="detail4" style="display: inline-block;">
						<span style="display: inline-block; width: 220px;">
							<span style="display: inline-table; width: 205px;">
								<span class="detailHead" >연락처</span>
								<span class="detailInput" ><input type="text" name="phone" id="phone" size="14"></span>
							</span>
							<span style="display: inline-table;">
								<span class="detailHead">이메일</span>
								<span class="detailInput"><input type="text" name="email" id="email" size="14"></span>
							</span>
						</span>
						<span style="display: inline-block; width: 215px; viertical-align: top;">
							<span style="display: inline-table;">
							 	<span class="detailHead">특이사항</span>
								<span><textarea type="content" name="specialnote" id="specialnote" style="width: 120px; height: 40px;"></textarea></span>
							</span>
						</span>
					</div>
				</div>
			</div>
			
			<div class="body3" > 상세정보<br>
				<div style="width: 450px; height: 183px; border: 1px solid #cccccc;">
					<div class="bodyTab" style="width: 260px;">
						<button class="btn_sub">발령사항</button>
						<button class="btn_sub">학력사항</button>
						<button class="btn_sub">경력사항</button>
					</div>
					<table border="1px" bordercolor="#DCDADA" width="450px" >
						<tr>
							<th style="width: 10%; font-size: 9.3pt;">No</th>
							<th style="width: 15%; font-size: 9.3pt;">발령일자</th>
							<th style="width: 15%; font-size: 9.3pt;">발령구분</th>
							<th style="width: 45%; font-size: 9.3pt;">발령내용</th>
							<th style="width: 15%; font-size: 9.3pt;">시행일</th>
						</tr>
					</table>			
				</div>
			</div>
		</div>
		
	</div>
</form>
</body>
</html>