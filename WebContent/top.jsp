<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">

<html>
<head>
  <title>Ȩ������</title>
  
  <script type="text/javascript">
     function openMember(){
    	 window.open("<%=request.getContextPath()%>/member/memberSsn.jsp","check","width=600, height=400");
     }
     
  </script>
</head>
<body>

<%
	boolean isLogin = false;
	String id = (String)session.getAttribute("mbId");
	String mbName = (String)session.getAttribute("mbName");
	if(id != null){
		isLogin = true;
	}
%>

<table border="1" align="center" width="900" height="600">
  <tr height="10%">
    <td align="center" colspan="2">
      <a href="<%=request.getContextPath()%>/index.jsp">main</a>
      |
      <% if(isLogin){ %>
       <a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a>
      <%}else{ %>
       <a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a>
      <%} %>
      |
      <a href="javascript:openMember()">ȸ������ </a>|
      <a href="<%=request.getContextPath()%>/member/memberAll.jsp">ȸ������</a>|
      <a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��</a>
      | �Խ��� | 
      <a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a>      
    </td>
  </tr>
  <tr>
  

   <td width="20%" valign="top">
    <%if(isLogin){ %>
       <b>[<%=mbName %>]��, �α�����...</b>
    <%}else{ %>
       <b>�α����� ���ּ���.</b>
    <%} %>
  </td>
   <td>