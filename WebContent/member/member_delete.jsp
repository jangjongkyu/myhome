<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


        <script>
           alert("������ !!")
        </script>
<jsp:useBean id="memberdao" class="my.member.MemberDAO" />
<jsp:useBean id="delete" class="my.member.MemberDTO" />
<!-- <jsp:setProperty property="no" name="delete" /> -->

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="memberdao" value="<%=pool%>"/>

<%
    String no = request.getParameter("no");
    delete.setNo(Integer.parseInt(no));
	boolean ok = memberdao.deleteMember(delete);

	if (ok) {%>
        <script>
           alert("��������!")
        </script>
	<%} else {%>
        <script>
           alert("��������!")
        </script>
	<%}
	
	//response.sendRedirect("memberAll.jsp");
%>