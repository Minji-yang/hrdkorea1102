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

<%}catch(Exception e){
	e.printStackTrace();
}
%>
	
	


</body>
</html>