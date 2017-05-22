<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="stdao" class="my.student.StudentDAO"/>

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="stdao" value="<%=pool%>"/>
<!-- stado.setPool(new my.db.ConnectionPoolBean()); -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학생삭제</title>
</head>
<body>

   <% 
    String id = request.getParameter("id");
   
   if(id==null || id.trim().equals("")){%>
	<script type="text/javascript">
	  alert("삭제실패!");
	</script>   
   <% response.sendRedirect("student.jsp");
	   return;
   }
   
/*     String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "web01";
	String password = "web01";

	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection(url,user,password);	
 
	String sql = "delete from student where id = ?";
	PreparedStatement pstmt = connection.prepareStatement(sql);
	pstmt.setString(1, id); */
	//int res = pstmt.executeUpdate();
	int res = stdao.deleteStudent(id);
	if(res > 0){%>
	<script type="text/javascript">
	   alert("삭제완료!");
	   location.href = "list.jsp"
	</script>		
	<%}else{%>
	<script type="text/javascript">
	   alert("삭제실패");
	   history.back();
	</script>	
	<%} %>

</body>
</html>