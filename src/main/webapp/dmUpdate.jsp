<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DM 발송내역 수정 화면</title>

</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %> 
<%@include file="DBConn.jsp" %>
<section>
<h2 class=tit>DM 발송내역 수정 화면</h2>
<%


PreparedStatement pstmt=null;
ResultSet rs=null;
String dmno=request.getParameter("dmno");

try{String sql="select a.custid,a.author,b.dmno,to_char(b.maildate,'YYYY-MM-DD'),b.contents,b.dept,b.grade,b.campain from customer1102 a,dm1102 b where dmno=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,dmno);
rs=pstmt.executeQuery();
if(rs.next()){
	String custid=rs.getString(1);
	String author=rs.getString(2);
	/* String dmno=rs.getString(3); */
	String maildate=rs.getString(4);
	String contents=rs.getString(5);
	String dept=rs.getString(6);
	String grade=rs.getString(7);
	String campain=rs.getString(8);
	
	%>	
<form name="form" method="post" action="dmUpdateprocess.jsp">
<table border=1 id="tab">
<tr>
<th>DM 발송번호</th>
<td colspan="3"><input class="text" type="text" name="dmno" value=<%=dmno%>></td>
</tr>
<tr>
<th>고객아이디</th>
<td><input class="text" type="text" name="custid"  value=<%=custid%>></td>
<th>고객명</th>
<td><input class="text" type="text" name="author"  value=<%=author%>></td>
</tr>
<tr>
<th>발송일자</th>
<td><input class="text" type="text" name="maildate"  value=<%=maildate%>></td>
<th>DM 내용</th>
<td><input class="text" type="text" name="contents"  value=<%=contents%>></td>
</tr>
<tr>
<th>발송부서</th>
<td><input class="text" type="text" name="dept"  value=<%=dept%>></td>
<th>고객등급</th>
<td>
<select name="grade">
<option value="1"<%if(grade.equals("1")){%>selected<%}%>>1</option>
<option value="2"<%if(grade.equals("2")){%>selected<%}%>>2</option>
<option value="3"<%if(grade.equals("3")){%>selected<%}%>>3</option>
<option value="4"<%if(grade.equals("4")){%>selected<%}%>>4</option>
<option value="5"<%if(grade.equals("5")){%>selected<%}%>>5</option>
<option value="V"<%if(grade.equals("V")){%>selected<%}%>>V</option>
<option value="W"<%if(grade.equals("W")){%>selected<%}%>>W</option>
</select>
</td>
</tr>
<tr>
<th>캠페인 구분</th>
<td colspan="3"><input class="text" type="text" name="campain"  value=<%=campain%>></td>
</tr>
<tr>
<th colspan="4">
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