<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 수정 화면</title>
<script>
function check(){
 	if(document.form.author.value==""){
		alert("고객성명을 입력하세요");
		document.form.author.focus();} 
		 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %> 
<%@include file="DBConn.jsp" %>
<section>
<h2 class=tit>고객 정보 수정 화면</h2>
<%


PreparedStatement pstmt=null;
ResultSet rs=null;
String custid=request.getParameter("custid");

try{String sql="select custid,author,goods,phone,email,areacode from customer1102 where custid=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,custid);
rs=pstmt.executeQuery();
if(rs.next()){
/* 	String bookno=rs.getString(1);  */
	String author=rs.getString(2);
	String goods=rs.getString(3);
	String phone=rs.getString(4);
	String email=rs.getString(5);
	String areacode=rs.getString(6);
	
/* 	
	String[] pho=request.getParameterValues("phone");
	String[] ph = pho.split("-"); */
	String phone1=phone.substring(0,3);
	String phone2=phone.substring(4,8);
	String phone3=phone.substring(9,13);
	
	String email1=email.substring(0,email.indexOf("@"));
	String email2=email.substring(email.indexOf("@")+1);
	

	
	%>	
<form name="form" method="post" action="customerUpdateprocess.jsp">
<table border=1 id="tab">
<tr>
<th>고객아이디</th>
<td><input class="text" type="text" name="custid" value="<%=custid%>"></td>
</tr>
<tr>
<th>고 객 성 명</th>
<td><input class="text" type="text" name="author" value="<%=author%>"></td>
</tr>
<!-- <script>
var goods=
var goodsSp=goods.split(',');


var phone=
var phoneSp=phone.split('-');

phoneSp[0]
phoneSp[1]
phoneSp[2]

var email=
var emailSp=email.split('@');

emailSp[0]
emailSp[1]
</script> -->

<tr>
<th>관심상품</th>
<td class="good">
<input type="checkbox" name="goods" value="의류"<%if(goods.equals("의류")){%>checked<%}%>> 의류
<input type="checkbox" name="goods" value="식료품"<%if(goods.equals("식료품")){%>checked<%}%>> 식료품
<input type="checkbox" name="goods" value="컴퓨터"<%if(goods.equals("컴퓨터")){%>checked<%}%>> 컴퓨터
<input type="checkbox" name="goods" value="공산품"<%if(goods.equals("공산품")){%>checked<%}%>> 공산품
<input type="checkbox" name="goods" value="관광"<%if(goods.equals("관광")){%>checked<%}%>> 관광
<input type="checkbox" name="goods" value="전자제품"<%if(goods.equals("전자제품")){%>checked<%}%>> 전자제품
<input type="checkbox" name="goods" value="건강제품"<%if(goods.equals("건강제품")){%>checked<%}%>> 건강제품
<input type="checkbox" name="goods" value="운동기구"<%if(goods.equals("운동기구")){%>checked<%}%>> 운동기구
</td>
</tr>
<tr>
<th>전화</th>
<td><input class="phone" type="tel" name="phone1" value=<%=phone1%>> -
<input class="phone"  type="tel" name="phone2" value=<%=phone2%>> -
<input class="phone" type="tel" name="phone3"value=<%=phone3%>></td>
</tr>
<tr>
<th>이메일</th>
<td><input class="email" type="text" name="email1" value=<%=email1%>>
@ <input class="email" type="text" name="email2"<%=email2%>></td>
</tr>
<tr>
<th>거주지</th>
<td>
<select name="areacode">
<option value="101"<%if(areacode.equals("101")){%>selected<%}%>>서울</option>
<option value="102"<%if(areacode.equals("102")){%>selected<%}%>>경기</option>
<option value="103"<%if(areacode.equals("103")){%>selected<%}%>>대전</option>
<option value="104"<%if(areacode.equals("104")){%>selected<%}%>>부산</option>
<option value="105"<%if(areacode.equals("105")){%>selected<%}%>>광주</option>
<option value="106"<%if(areacode.equals("106")){%>selected<%}%>>울산</option>
<option value="107"<%if(areacode.equals("107")){%>selected<%}%>>대구</option>
<option value="108"<%if(areacode.equals("108")){%>selected<%}%>>강원</option>
<option value="109"<%if(areacode.equals("109")){%>selected<%}%>>경상</option>
<option value="110"<%if(areacode.equals("110")){%>selected<%}%>>충청</option>
<option value="111"<%if(areacode.equals("111")){%>selected<%}%>>제주</option>
</select>
</td>
</tr>
<tr>
<th colspan="2">
<input class="btn1" type="button" value="저장" onclick="check()">
<input class="btn2" type="reset"  value="취소">
</th>
</tr>
<%
}
}catch(Exception e){
	System.out.println("조회 실패");
	e.printStackTrace();
}
%>
</table>

</form>
</section>
<%@include file="Footer.jsp" %> 

</body>
</html>