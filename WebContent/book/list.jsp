<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="my.book.*" %>

<jsp:useBean id="bookdao" class="my.book.BookDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bookdao" value="<%=pool%>"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�л�����Ʈ</title>
</head>
<body>

<div align="center">

<hr color="green" width="300">
<h2> �� �� �� �� �� �� </h2>
<hr color="green" width="300">

<table border="1">
  <tr>
   <th>������</th><th>������</th><th>���ǻ�</th><th>����</th><th>�԰���</th>
  </tr>
   <% 
    request.setCharacterEncoding("EUC-KR");
   
	List<BookDTO> list = bookdao.getBookList();
	for(BookDTO book : list){
	%>
	<tr bgcolor="yellow">
	   <td><%=book.getTitle()%></td><td><%=book.getWriter()%></td>
	   <td><%=book.getPublisher()%></td><td><%=book.getPrice()%></td>
	   <td><%=book.getIndate() %></td>
	</tr>
   <%
	}
    %>
</table>
</div>

</body>
</html>