<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dm 정보 등록 화면</title>
<script>
function check(){
 	if(document.form.dmno.value==""){
		alert("DM발송번호를 입력하세요")} 
 	else if(document.form.custid.value=="")
		{alert("고객ID를 입력하세요");
		document.form.custid.focus();}
	 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %> 
<section>
<h2 class=tit>DM 정보 등록 화면</h2>
<form name="form" method="post" action="addDmprocess.jsp">
<table border=1 id="tab">
<tr>
<th>DM 발송번호</th>
<td colspan="3"><input class="text" type="text" name="dmno"></td>
</tr>
<tr>
<th>고객아이디</th>
<td><input class="text" type="text" name="custid"></td>
<th>고객명</th>
<td><input class="text" type="text" name="author"></td>
</tr>
<tr>
<th>발송일자</th>
<td><input class="text" type="text" name="maildate"></td>
<th>DM 내용</th>
<td><input class="text" type="text" name="contents"></td>
</tr>
<tr>
<th>발송부서</th>
<td><input class="text" type="text" name="dept"></td>
<th>고객등급</th>
<td>
<select name="grade" class="select">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="V">V</option>
<option value="W">W</option>
</select>
</td>
</tr>
<tr>
<th>캠페인 구분</th>
<td colspan="3"><input class="text" type="text" name="campain"></td>
</tr>
<tr>
<th colspan="4">
<input class="btn1" type="button" value="저장" onclick="check()">
<input class="btn2" type="reset"  value="취소">
</th>
</tr>
</table>
</form>
</section>
<%@include file="Footer.jsp" %> 

</body>
</html>