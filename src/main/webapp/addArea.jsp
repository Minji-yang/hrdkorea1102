<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거주지 정보 등록 화면</title>
<script>
function check(){
 	if(document.form.areacode.value==""){
		alert("거주지코드를 입력하세요");
		document.form.areacode.focus();} 
		 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %> 
<section>
<h2 class=tit>거주지 정보 등록 화면</h2>
<form name="form" method="post" action="addAreaprocess.jsp">
<table border=1 id="tab2">
<tr>
<th>거주지 코드</th>
<td><input class="text" type="text" name="areacode"></td>
</tr>
<tr>
<th>거주지 이름</th>
<td><input class="text" type="text" name="areaname"></td>
</tr>
<tr>
<th colspan="2">
<input class="btn1" type="button" value="등록" onclick="check()">
<input class="btn2" type="reset"  value="취소">
</th>
</tr>
</table>

</form>
</section>
<%@include file="Footer.jsp" %> 

</body>
</html>