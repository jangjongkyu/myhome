<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");
  
  if(id.equals("admin")){
	  if(pwd.equals("1234")){
		  out.println("<font color=blue>");
		  out.println("["+id+"] ���� �α��� �ϼ̽��ϴ�.");
		  out.println("</font>");
		  out.println("<a href='sessionTest2.jsp'>��������</a>");
		  session.setAttribute("id", id);
		  session.setAttribute("pwd",pwd);
	  }else{
		  out.println("<font color=red>");
		  out.println("[��й�ȣ�� Ʋ�Ƚ��ϴ� .]");
		  out.println("</font>");
		  out.println("<a href='sessionTest1.jsp'>�ٽ��Է�</a>");
	  }
  }else{
	  out.println("<font color=red>");
	  out.println("["+id+"] �� �������� �ʽ��ϴ�.");
	  out.println("</font>");
	  out.println("<a href='sessionTest1.jsp'>�ٽ��Է�</a>");
  }
%>

</body>
</html>