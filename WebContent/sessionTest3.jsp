<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
</head>
<%
	session.removeAttribute("id");
	session.removeAttribute("pwd");
	session.invalidate();
%>
<body>

<h2>�α׾ƿ� �Ǿ����ϴ�.</h2>
<a href="sessionTest1.jsp">�α���</a>

</body>
</html>