<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bookdao" class="my.book.BookDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bookdao" value="<%=pool%>"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�л�����</title>
</head>


<body>

   <% 
    request.setCharacterEncoding("EUC-KR");
   
    String title = request.getParameter("title");
   
   if(title==null || title.trim().equals("")){%>
	<script type="text/javascript">
	  alert("��������!");
	</script>   
   <% response.sendRedirect("book.jsp");
	   return;
   }
   

	int res = bookdao.deleteBook(title);
	if(res > 0){%>
	
	<script type="text/javascript">
	   alert("�����Ϸ�!");
	   location.href = "list.jsp"
	</script>		
	
	<%}else{%>
	
	<script type="text/javascript">
	   alert("��������");
	   history.back();
	</script>
	
	<%}
    %>

</body>
</html>