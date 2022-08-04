<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 대출 예약 정보 등록</title>
<script>
function ch() {
	var doc=document.form;
	doc.submit();
}
function ch2() {
	var doc=document.form;
	if(doc.indate.value!=""){
		doc.status[1].checked=true;
	}else{
		doc.status[0].checked=true;
	}
		
	}

function check() {
	var doc=document.form;
	if(doc.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.");
		doc.lentno.focus();
		return false;
	}if(doc.custname.value==""){
		alert("고객성명이 입력되지 않았습니다.");
		doc.custname.focus();
		return false;
	}if(doc.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		doc.bookno.focus();
		return false;	
	}else{
		form.action="insert_reservationProcess.jsp";
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
<%
int sq=0;
try{
	String sql="select s0.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		sq=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
String custname=request.getParameter("custname");
if(custname==null){
	custname="";}
String outdate=request.getParameter("outdate");
if(outdate==null){
	outdate="";}
String indate=request.getParameter("indate");
if(indate==null){
	indate="";}
String status=request.getParameter("status");
if(status==null){
	status="";}
String class1=request.getParameter("class1");
if(class1==null){
	class1="";}


String bookname="";
String bookno=request.getParameter("bookno");
if(bookno==null){
	bookno="";
}else{
	try{
		String sql="select bookname from bookinfo0804 where bookno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			bookname=rs.getString(1);
		}else{
			%>
			<script>
			alert("등록되어 있지 않는 도서코드입니다.");
			</script>
			<% 
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}

%>
<br>
<h2>도서 대출 예약 정보 등록 화면</h2>
<form name="form" method="post" action="insert_reservation.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">대출번호</th>
		<td>
			<input type="text" name="lentno" value="<%=sq %>" class="in1">
		</td>
	<th class="th1">고객성명</th>
		<td>
			<input type="text" name="custname" value="<%=custname %>" class="in1">
		</td>	
</tr>
<tr>
	<th class="th1">도서코드</th>
		<td>
			<input type="text" name="bookno" value="<%=bookno %>" onchange="ch()" class="in1" >
		</td>
	<th class="th1">도서이름</th>
		<td>
			<input type="text" name="bookname" value="<%=bookname %>"class="in1">
		</td>	
</tr>
<tr>
	<th class="th1">대출일자</th>
		<td>
			<input type="text" name="outdate" value="<%=outdate %>" class="in1">
		</td>
	<th class="th1">반납일자</th>
		<td>
			<input type="text" name="indate"  value="<%=indate %>" onclick="ch2()"  class="in1" >
		</td>	
</tr>
<tr>
	<th class="th1">대출상태</th>
		<td>
			<input type="radio" name="status" value="1" <%=status.equals("1")?"checked":"" %>>대출
			<input type="radio" name="status" value="2" <%=status.equals("2")?"checked":"" %>>반납
		</td>
	<th class="th1">등급</th>
		<td>
			<select name="class1" class="in1">
				<option value="S" <%=class1.equals("S")?"selected":"" %>>S</option>
				<option value="A" <%=class1.equals("A")?"selected":"" %>>A</option>
				<option value="B" <%=class1.equals("B")?"selected":"" %>>B</option>
				<option value="C" <%=class1.equals("C")?"selected":"" %>>C</option>
			</select>
		</td>	
</tr>

<tr>
	<td colspan="4" class="td1">
		<input type="button" value="저장" onclick="check()" class="bt2">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt2">
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>