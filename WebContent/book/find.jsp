<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
    <%@ page import="java.util.*" %>
    <%@ page import="my.book.*" %>
    
<jsp:useBean id="bookdao" class="my.book.BookDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bookdao" value="<%=pool%>"/>
    
<%
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		
		if(title == null || title.trim().equals("")){
			title = "";
		}
		if(writer == null || writer.trim().equals("")){
			writer = "";
		}
		if(publisher == null || publisher.trim().equals("")){
			publisher = "";
		}
%>

<html>
<head>
	<title>도서찾기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2> 도 서 찾 기</h2>
		<a href="student.jsp">관리페이지</a>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>도서명</th>
				<th>지은이</th>
				<th>출판사</th> 
				<th>가격</th>
				<th>입고일</th>
			</tr>
<%
		
		List<BookDTO>books = bookdao.findBook(title, writer, publisher);
		if (books == null || books.isEmpty()){%>
		<tr>
			<td colspan="5"> 해당되는 도서가 없습니다.</td>
		</tr>
<%	} else {
		for(BookDTO book : books){
				%>
		<tr>
			<td><%=book.getTitle()%></td>
			<td><%=book.getWriter()%></td>
			<td><%=book.getPublisher()%></td>
			<td><%=book.getPrice() %></td>
			<td><%=book.getIndate() %></td>
		</tr>			
   <%	}%>

		<tr>
			<td colspan="5">해당되는 도서는 <%=books.size()%>권 있습니다.</td>
		</tr>
		
<%	}%>					


			
			
			
			
			





			