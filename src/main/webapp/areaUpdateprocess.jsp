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
	String areacode=request.getParameter("areacode");
	String areaname=request.getParameter("areaname");
	try{
		String sql="update area1102 set areaname=? where areacode=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,areaname);
		pstmt.setString(2,areacode);
		pstmt.executeUpdate();
		%>
		<script>
		alert("수정이 완료되었습니다.");
		location.href="areaSelect.jsp";
		</script>
	<%
	} catch(Exception e){
		System.out.println("저장 실패");	
		e.printStackTrace();
	}%>
 
	
	</body>
</html>