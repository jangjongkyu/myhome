<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>

<!-- mbdto.setName(request.getParameter("name")); 와 같다.-->
<%
	if (mbdto.getName() == null || mbdto.getName().trim().equals("")) {
		response.sendRedirect("memberSsn.jsp");
		return;
	}

    out.println(mbdto);

	int res = mbdao.insertMember(mbdto);
	if(res > 0){%>
		<script>
		  alert("회원가입을 해주셔서 감사합니다.")
		  self.close()
		</script>
		
	<%}else{%>
		<script>
		  alert("회원가입 실패!! 다시입력해주세요..")
		  location.href="memberSsn.jsp"
		</script>
	<%}%>