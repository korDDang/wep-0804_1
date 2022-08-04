
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 예약정보 조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<h2>도서 예약정보 조회</h2>
<%
int cnt=0;
try{
	String sql="select count(*)from reservation0804";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>권의 도서 예약 정보가 있습니다.</div>
<hr>
<table border="1" class="tab2">
<tr>
	<th>no</th>
	<th>대출번<br>호</th>
	<th>고객성명</th>
	<th>도서코드</th>
	<th>도서명</th>
	<th>대출일자</th>
	<th>반납일자</th>
	<th>대출상태</th>
	<th>등급</th>
</tr>
<%
int no=0;
try{
	String sql="select r.lentno,r.custname,r.bookno,b.bookname,to_char(outdate,'YYYY-MM-DD'),to_char(indate,'YYYY-MM-DD'),r.status,r.class1 from reservation0804 r,bookinfo0804 b where r.bookno=b.bookno";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String lentno=rs.getString(1);
		String custname=rs.getString(2);
		String bookno=rs.getString(3);
		String bookname=rs.getString(4);
		String outdate=rs.getString(5);
		String indate=rs.getString(6);
		String status=rs.getString(7);
		String c1=rs.getString(8);
	
		no++;
	
%>
<tr>
	<td class="td2"><%=no %></td>
	<td class="td3"><%=lentno %></td>
	<td class="td2"><%=custname %></td>
	<td class="td2"><%=bookno %></td>
	<td class="td2"><%=bookname %></td>
	<td class="td2"><%=outdate %></td>
	<td class="td2"><%=indate %></td>
	<td class="td2"><%=status %></td>
	<td class="td2"><%=c1 %></td>
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