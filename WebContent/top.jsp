<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">

<html>
<head>
  <title>홈페이지</title>
  
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
       <a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
      <%}else{ %>
       <a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a>
      <%} %>
      |
      <a href="javascript:openMember()">회원가입 </a>|
      <a href="<%=request.getContextPath()%>/member/memberAll.jsp">회원보기</a>|
      <a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">회원찾기</a>
      | 게시판 | 
      <a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>      
    </td>
  </tr>
  <tr>
  

   <td width="20%" valign="top">
    <%if(isLogin){ %>
       <b>[<%=mbName %>]님, 로그인중...</b>
    <%}else{ %>
       <b>로그인을 해주세요.</b>
    <%} %>
  </td>
   <td>