<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="my.student.*" %>


<jsp:useBean id="stdao" class="my.student.StudentDAO"/>

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="stdao" value="<%=pool%>"/>
<!-- stado.setPool(new my.db.ConnectionPoolBean()); -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학생리스트</title>
</head>
<body>

<div align="center">

<hr color="green" width="300">
<h2> 학 생 목 록 보 기 </h2>
<hr color="green" width="300">

<table border="1">
   <% 
    request.setCharacterEncoding("EUC-KR");
    String name = request.getParameter("name");
   
    if(name == null || name.trim().equals("")){
    	name = "";
    }
	
	List<StudentDTO> list = stdao.getStudentList();
	for(StudentDTO student : list){
	%>
	<tr bgcolor="yellow">
	   <td><%=student.getId()%></td><td><%=student.getName()%></td><td><%=student.getCname()%></td>
	</tr>
   <%
	}
    %>
</table>
</div>

</body>
</html>