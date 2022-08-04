
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<h2>학사 정보 목록</h2>
<%
int cnt=0;
try{
	String sql="select count(*)from bookinfo0804";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>권의 도서정보가 있습니다.</div>
<hr>
<table border="1" class="tab2">
<tr>
	<th class="th1">no</th>
	<th class="th1">도서코드</th>
	<th class="th1">저자</th>
	<th class="th1">도 서 명</th>
</tr>
<%
int no=0;
try{
	String sql="select * from bookinfo0804";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String bookno=rs.getString(1);
		String author=rs.getString(2);
		String bookname=rs.getString(3);
	
		no++;
	
%>
<tr>
	<td class="td2"><%=no %></td>
	<td class="td3"><%=bookno %></td>
	<td class="td2"><%=author %></td>
	<td class="td2"><%=bookname %></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="도서 정보 추가" onclick="location.href='insert_bookinfo.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>