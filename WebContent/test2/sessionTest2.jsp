<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>회원페이지</title>
</head>
<%
 	String id = (String)session.getAttribute("id");
 	String pwd = (String)session.getAttribute("pwd");
 	
 	if(id == null || pwd == null || id.trim().equals("") || pwd.trim().equals("")){ %>
 	 <script type="text/javascript">
 	    alert("로그인을 해야만 볼 수 있는 페이지 입니다.");
 	    location.href="sessionTest1.jsp";
 	 </script>
 		
   <%}%>
<body>
  <h2>회 원 인 증 페 이 지</h2>
  <h3>회원들만 볼 수 있는 페이지 입니다.</h3>
  <h3>로그인이 안되어 있으면 들어 올 수 없는 페이지 입니다.</h3>
  <h3>이번주 금요일 가서 대박들 나세요!!!</h3>
  <a href="sessionTest3.jsp">로그아웃</a>
</body>
</html>