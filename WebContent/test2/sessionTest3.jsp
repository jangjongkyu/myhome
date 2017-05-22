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

<h2>로그아웃 되었습니다.</h2>
<a href="sessionTest1.jsp">로그인</a>

</body>
</html>