<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp"%>
<%
String bookno=request.getParameter("bookno");
String author=request.getParameter("author");
String bookname=request.getParameter("bookname");
try{
	String sql="insert into bookinfo0804 values(?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, bookno);
	pstmt.setString(2, author);
	pstmt.setString(3, bookname);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="select_bookinfo.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>