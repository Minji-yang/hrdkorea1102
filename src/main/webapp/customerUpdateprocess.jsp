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
PreparedStatement pstmt=null;
String[] val=request.getParameterValues("goods");
String goods="";
if(val!=null){
	for(int i=0;i<val.length;i++){
		if(i==(val.length-1)){
		goods+=val[i];}
		else{
		goods+=val[i]+",";}
	}
}

String custid=request.getParameter("custid");
String author=request.getParameter("author");
String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
String email=request.getParameter("email1")+"@"+request.getParameter("email2");
String areacode=request.getParameter("areacode");
try{	
	String sql="update customer1102 set author=?,goods=?,phone=?,email=?,areacode=? where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,author);
	pstmt.setString(2,goods);
	pstmt.setString(3,phone);
	pstmt.setString(4,email);
	pstmt.setString(5,areacode);
	pstmt.setString(6,custid);
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