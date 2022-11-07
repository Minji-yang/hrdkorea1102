<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String custid=request.getParameter("custid");
String author=request.getParameter("author");
String goods=request.getParameter("goods");	
String phone1=request.getParameter("phone1");
String phone2=request.getParameter("phone2");
String phone3=request.getParameter("phone3");
String phone=phone1+"-"+phone2+"-"+phone3;
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");
String email=email1+"@"+email2;
String areacode=request.getParameter("areacode");


PreparedStatement pstmt=null;
try{
	String sql="insert into customer1102 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,custid);
	pstmt.setString(2,author);
	pstmt.setString(3,goods);
	pstmt.setString(4,phone);
	pstmt.setString(5,email);
	pstmt.setString(6,areacode);
	pstmt.executeUpdate();
	
	%>
	<script>
	alert("등록이 완료되었습니다.")
	location.href="customerSelect.jsp"
	</script>
	<%
}catch(Exception e){
	System.out.println("등록이 완료되지 않았습니다.");
	e.printStackTrace();
}
%>

</body>
</html>