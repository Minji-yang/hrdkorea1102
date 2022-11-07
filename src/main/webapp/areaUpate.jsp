<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거주지 정보 등록 화면</title>
<script>
function check(){
 	if(document.form.areaname.value==""){
		alert("거주지이름을 입력하세요");
		document.form.areaname.focus();} 
		 else{document.form.submit();} }
</script>

</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<%@include file="DBConn.jsp"%>
<section>
<h2 class=tit>거주지 정보 등록 화면</h2>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String areacode=request.getParameter("areacode");

try{String sql="select areacode,areaname from area1102 where areacode=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,areacode);
rs=pstmt.executeQuery();
if(rs.next()){
/* 	String bookno=rs.getString(1);  */
	String areaname=rs.getString(2);

	%>	
<form name="form" method="post" action="areaUpdateprocess.jsp">
<table border=1 id="tab2">
<tr>
<th>거주지 코드</th>
<td><input class="text" type="text" name="areacode" value="<%=areacode%>"></td>
</tr>
<tr>
<th>거주지 이름</th>
<td><input class="text" type="text" name="areaname" value="<%=areaname%>"></td>
</tr>
<tr>
<th colspan="2">
<input class="btn1" type="button" value="등록" onclick="check()">
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