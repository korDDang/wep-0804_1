<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 정보 등록</title>
<script>
function check() {
	var doc=document.form;
	if(doc.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		doc.bookno.focus();
		return false;
	}if(doc.author.value==""){
		alert("작가가 입력되지 않았습니다.");
		doc.author.focus();
		return false;
	}if(doc.bookname.value==""){
		alert("도서이름이 입력되지 않았습니다.");
		doc.bookname.focus();
		return false;	
	}else{
		doc.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<br>
<h2>도서 정보 등록 화면</h2>
<form name="form" method="post" action="insert_bookinfoProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">도서코드</th>
		<td>
			<input type="text" name="bookno" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">저자</th>
		<td>
			<input type="text" name="author" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">도서이름</th>
		<td>
			<input type="text" name="bookname" class="in1">
		</td>
</tr>

<tr>
	<td colspan="2" class="td1">
		<input type="button" value="등록" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>