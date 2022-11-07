<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거주지정보목록</title>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<section>
<%@include file="DBConn.jsp"%>
<%PreparedStatement pstmt=null;
ResultSet rs=null;
int cnt=0;
try{
	String sql="select count(*) from area1102";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(Exception e){
	System.out.println("db에러");
	e.printStackTrace();
}
%>

<h2 class="tit"> 거주지 정보 목록</h2>
<p class="total1">총 <%=cnt%>개의 거주지가 있습니다.</p>
<table border=1 id="tab3">
<tr>
<th>no</th>
<th>거주지 코드</th>
<th>거주지 이름</th>
<th>구분</th>
</tr>

<%
int no=0;
try{
	String sql="select areacode,areaname from area1102";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String areacode=rs.getString(1);
		String areaname=rs.getString(2);
		no++;
		%>
<tr>
<td class="b_no"><%=no%></td>
<td><%=areacode %></td>
<td><%=areaname%></td>
<td><a class="sj" href="areaUpate.jsp?areacode=<%=areacode%>">수정</a>/
<a class="del" href="areaDeleteprocess.jsp?areacode=<%=areacode%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a>
</td>
</tr>
<%
	}
}catch(Exception e){
	System.out.println("조회 실패"); 
	e.printStackTrace();
}
%>
</table>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>