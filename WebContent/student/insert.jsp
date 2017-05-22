<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); 와 같다. -->

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="stdao" value="<%=pool%>"/>
<!-- stado.setPool(new my.db.ConnectionPoolBean()); -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 1. 넘어온 데이터를 받는다. 
     2. 유효성 검사를 한다.
     3. 드라이버 검사를 한다.
     4. DB와 연결을 하고
     5. 동적쿼리를 만들어 전송해준다.
     6. 성공하면 list.jsp(학생목록보기)
                   실패하면 student.jsp
-->
	<%
		request.setCharacterEncoding("EUC-KR"); // post전송에서의 한글처리 방식;

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");

		if (id == null || name == null || cname == null || id.trim().equals("") || name.trim().equals("")
				|| cname.trim().equals("")) {
	%>
	<script type="text/javascript">
		alert("아이디, 학생명, 학급명을 모두 입력해주세요!!")
		history.back();
	</script>
	<%
		return; //현재 페이지 중지
		}
		int res = stdao.insertStudent(id,name,cname);
		if(res > 0){
	%>
	     <script type="text/javascript">
	       alert("학생 등록 성공 !!")
	     </script>
	<%
	    response.sendRedirect("list.jsp");
		}else{
	%>
	     <script type="text/javascript">
	       alert("학생 등록 실패 !!")
	       history.back();
	     </script>
	<%
		}
	%>


	//
	<a href="index.jsp">뒤로가기</a>

</body>
</html>