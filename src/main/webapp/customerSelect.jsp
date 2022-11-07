<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보목록</title>
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
	String sql="select count(*) from customer1102";
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

<h2 class="tit"> 고객 정보 목록</h2>
<p class="total">총 <%=cnt%> 명의 고객이 있습니다.</p>
<table border=1 id	="tab1">
<tr>
<th>no</th>
<th>고객아이디</th>
<th>고객성명</th>
<th>관심상품</th>
<th>전화</th>
<th>이메일</th>
<th>거주지코드</th>
<th>거주지</th>
<th>구분</th>
</tr>

<%
int no=0;
try{
	String sql="select a.custid,a.author,a.goods,a.phone,a.email,a.areacode,b.areaname from customer1102 a,area1102 b where a.areacode=b.areacode";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custid=rs.getString(1);
		String author=rs.getString(2);
		String goods=rs.getString(3);
		String phone=rs.getString(4);
		String email=rs.getString(5);
		String areacode=rs.getString(6);
		String areaname=rs.getString(7);
		no++;
		%>
<tr>
<td class="b_no"><%=no%></td>
<td><a class="custid" href="update.jsp?custid=<%=custid%>"><%=custid%></a></td>
<td><%=author%></td>
<td><%=goods %></td>
<td><%=phone %></td>
<td><%=email %></td>
<td><%=areacode %></td>
<td><%=areaname%></td>
<td>
<a class="del" href="customerDelete.jsp?custid=<%=custid%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a>
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