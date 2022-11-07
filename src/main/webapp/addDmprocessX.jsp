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
String dmno=request.getParameter("dmno");
String custid=request.getParameter("custid");

String author=request.getParameter("author");

String maildate=request.getParameter("maildate");	
String contents=request.getParameter("contents");
String dept=request.getParameter("dept");
String grade=request.getParameter("grade");
String campain=request.getParameter("campain");


PreparedStatement pstmt=null;
try{
	String sql="insert all into dm1102 values(?,?,?,?,?,?,?) into customer1102 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,dmno);
	pstmt.setString(2,custid);
	
	pstmt.setString(3,maildate);
	pstmt.setString(4,contents);
	pstmt.setString(5,dept);
	pstmt.setString(6,grade);
	pstmt.setString(7,campain);
	pstmt.setString(8,custid);
	pstmt.setString(9,author);
	
	pstmt.executeUpdate();
	
	%>
	<script>
	alert("등록이 완료되었습니다.")
	location.href="dmSelect.jsp"
	</script>
	<%
}catch(Exception e){
	System.out.println("등록이 완료되지 않았습니다.");
	e.printStackTrace();
}
%>

</body>
</html>