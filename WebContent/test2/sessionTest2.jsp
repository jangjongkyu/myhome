<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>ȸ��������</title>
</head>
<%
 	String id = (String)session.getAttribute("id");
 	String pwd = (String)session.getAttribute("pwd");
 	
 	if(id == null || pwd == null || id.trim().equals("") || pwd.trim().equals("")){ %>
 	 <script type="text/javascript">
 	    alert("�α����� �ؾ߸� �� �� �ִ� ������ �Դϴ�.");
 	    location.href="sessionTest1.jsp";
 	 </script>
 		
   <%}%>
<body>
  <h2>ȸ �� �� �� �� �� ��</h2>
  <h3>ȸ���鸸 �� �� �ִ� ������ �Դϴ�.</h3>
  <h3>�α����� �ȵǾ� ������ ��� �� �� ���� ������ �Դϴ�.</h3>
  <h3>�̹��� �ݿ��� ���� ��ڵ� ������!!!</h3>
  <a href="sessionTest3.jsp">�α׾ƿ�</a>
</body>
</html>