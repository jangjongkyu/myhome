<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>

<html>
<head>
  <title>���üũ</title>
</head>
<body>


<%
     request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="find" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="find"/>

<div align="center">
  <%
  
     if(find.getName() == null || find.getSsn1() == null || find.getSsn2()== null || find.getName().trim().equals("") || find.getSsn1().trim().equals("") || find.getSsn2().trim().equals("")){
    	 response.sendRedirect("findId.jsp");
    	 return;
     }
     
     MemberDTO member = mbdao.findMemberId(find);
     if(member != null){%>
     
    	<h3>�ش��ϴ� ����ID �� <%=member.getId()%>�Դϴ� .</h3>
    	
     <%}else{%>
         
        <h3>�ش��ϴ� ����ID�� �������� �ʽ��ϴ�.</h3>
    	
     <%}%>
     </div>

</body>
</html>