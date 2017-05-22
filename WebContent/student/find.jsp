<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
    <%@ page import="java.util.*" %>
    <%@ page import="my.student.*" %>
    <jsp:useBean id="stdao" class="my.student.StudentDAO"/>
    
    <jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="stdao" value="<%=pool%>"/>
<!-- stado.setPool(new my.db.ConnectionPoolBean()); -->
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")){
			response.sendRedirect("student.jsp");
			return;
		}
%>
<html>
<head>
	<title>�л�ã��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2><%=name%> �� �� ã ��</h2>
		<a href="student.jsp">����������</a>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>���̵�</th>
				<th>�л���</th>
				<th>�б޸�</th> 
			</tr>
<%

    List<StudentDTO> list = stdao.findStudent(name);
    int count = 0;
    
    if(list == null || list.isEmpty()){
    	%>
        
        <tr>
			<td colspan="3"><%=name%>�̶� �л��� �����ϴ�.</td>
		</tr>
     	
    	<% 
    }else{
    
for(StudentDTO student :list){
%>
		<tr>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<td><%=student.getCname()%></td>
		</tr>			
		
<%
count++;
}		
%>
		<tr>
			<td colspan="3"><%=name%>�л��� �� <%=count%>�� �ֽ��ϴ�.</td>
		</tr>
<%	
    }
%>					

			
			
			
			
			





			