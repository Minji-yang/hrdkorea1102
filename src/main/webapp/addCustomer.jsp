<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 등록 화면</title>
<script>
function check(){
 	if(document.form.custid.value==""){
		alert("고객아이디를 입력하세요")} 
 	else if(document.form.author.value=="")
		{alert("고객이름을 입력하세요");
		document.form.author.focus();}
	 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %> 
<section>
<h2 class=tit>고객 정보 등록 화면</h2>
<form name="form" method="post" action="process.jsp">
<table border=1 id="tab">
<tr>
<th>고객아이디</th>
<td><input class="text" type="text" name="custid"></td>
</tr>
<tr>
<th>고 객 성 명</th>
<td><input class="text" type="text" name="author"></td>
</tr>
<tr>
<th>관심상품</th>
<td class="good"><input type="checkbox" name="goods"  value="의류" > 의류
<input type="checkbox" name="goods" value="식료품"> 식료품
<input type="checkbox" name="goods" value="컴퓨터"> 컴퓨터
<input type="checkbox" name="goods" value="공산품"> 공산품
<input type="checkbox" name="goods" value="관광"> 관광
<input type="checkbox" name="goods" value="전자제품"> 전자제품
<input type="checkbox" name="goods" value="건강제품"> 건강제품
<input type="checkbox" name="goods" value="운동기구"> 운동기구
</td>
</tr>
<tr>
<th>전화</th>
<td><input class="phone" type="tel" name="phone1"> -
<input class="phone"  type="tel" name="phone2"> -
<input class="phone" type="tel" name="phone3"></td>
</tr>
<tr>
<th>이메일</th>
<td><input class="email" type="text" name="email1">
@ <input class="email" type="text" name="email2"></td>
</tr>
<tr>
<th>거주지</th>
<td>
<select name="areacode">
<option value="101">서울</option>
<option value="102">경기</option>
<option value="103">대전</option>
<option value="104">부산</option>
<option value="105">광주</option>
<option value="106">울산</option>
<option value="107">대구</option>
<option value="108">강원</option>
<option value="109">경상</option>
<option value="110">충청</option>
<option value="111">제주</option>
</select>
</td>
</tr>
<tr>
<th colspan="2">
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