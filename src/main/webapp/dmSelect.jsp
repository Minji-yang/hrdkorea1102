<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DM 발송 내역</title>
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
	String sql="select count(*) from dm1102";
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

<h2 class="tit"> DM 발송 내역</h2>
<p class="total2">총 <%=cnt%> 건의 발송내역이 있습니다.</p>
<table border=1 id="tab4">
<tr>
<th>no</th>
<th>DM발송번호</th>
<th>고객아이디</th>
<th>고객성명</th>
<th>발송일자</th>
<th>DM내용</th>
<th>발송부서</th>
<th>고객등급</th>
<th>캠페인구분</th>
<th>구분</th>
</tr>

<%
int no=0;
try{
	String sql="select a.custid,a.author,b.dmno,to_char(b.maildate,'YYYY-MM-DD'),b.contents,b.dept,b.grade,b.campain from customer1102 a,dm1102 b where a.custid=b.custid";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custid=rs.getString(1);
		String author=rs.getString(2);
		String dmno=rs.getString(3);
		String maildate=rs.getString(4);
		String contents=rs.getString(5);
		String dept=rs.getString(6);
		String grade=rs.getString(7);
		String campain=rs.getString(8);
		no++;
		%>
<tr>
<td class="b_no"><%=no%></td>
<td><a class="dmno" href="dmUpdate.jsp?dmno=<%=dmno%>"><%=dmno%></a></td>
<td><%=custid%></td>
<td><%=author%></td>
<td><%=maildate%></td>
<td><%=contents %></td>
<td><%=dept %></td>
<td><%=grade %></td>
<td><%=campain%></td>
<td>
<a class="del" href="dmDelete.jsp?dmno=<%=dmno%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a>
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