<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="memberdao" class="my.member.MemberDAO"/>
<html>
<head>
  <title>멤버체크</title>
</head>
<body>

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="memberdao" value="<%=pool%>"/>

<script type="text/javascript">
   document.write(location.host+"<br>")
   document.write(location.href+"<br>")
</script>

  <%
     request.setCharacterEncoding("EUC-KR");
  
     String name = request.getParameter("name");
     String ssn1 = request.getParameter("ssn1");
     String ssn2 = request.getParameter("ssn2");
  
     if(name == null || ssn1 == null || ssn2 == null || name.trim().equals("") || ssn1.trim().equals("") || ssn2.trim().equals("")){
    	 response.sendRedirect("memberSsn.jsp");
    	 return;
     }
     
     boolean isMember = memberdao.checkMember(name,ssn1,ssn2);
     if(isMember){%>
     
    	<script type="text/javascript">
    	  alert("이미 가입이 되어있습니다.");
    	  self.close();
    	</script>  
    	
     <%}else{%>
        <form name="f" id="f" action="member.jsp" method="post">
          <input type="hidden" name="name" value="<%=name %>"/>
          <input type="hidden" name="ssn1" value="<%=ssn1 %>"/>
          <input type="hidden" name="ssn2" value="<%=ssn2 %>"/>
        </form>
        <script type="text/javascript">
    	  alert("회원가입 페이지로 이동합니다.")
    	  document.f.submit();
    	</script>  
    	
     <%}%>

</body>
</html>