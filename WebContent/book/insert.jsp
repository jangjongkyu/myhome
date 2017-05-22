<%@page import="java.util.Calendar"%>
<%@page import="javafx.scene.chart.PieChart.Data"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="my.book.*" %>

<jsp:useBean id="bookdao" class="my.book.BookDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bookdao" value="<%=pool%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 1. �Ѿ�� �����͸� �޴´�. 
     2. ��ȿ�� �˻縦 �Ѵ�.
     3. ����̹� �˻縦 �Ѵ�.
     4. DB�� ������ �ϰ�
     5. ���������� ����� �������ش�.
     6. �����ϸ� list.jsp(�л���Ϻ���)
                   �����ϸ� student.jsp
-->

	<%
		request.setCharacterEncoding("EUC-KR"); // post���ۿ����� �ѱ�ó�� ���;

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		int price = 0;
		
		try{
		   price = Integer.parseInt(request.getParameter("price"));
		}catch(Exception e){%>
		<script type="text/javascript">
		   alert("�ǸŰ��� ���ڷθ� �Է��� �ּ���.");
		</script>
		   
	   <% 
	   return;
		}
		
		
	    if(title == null || writer == null || publisher == null || title.trim().equals("") ||
	    		writer.trim().equals("") || publisher.trim().equals("")){
	    	%>
	    	<script type="text/javascript">
	    	  alert("�߸��� �Է��Դϴ�.");
	    	</script>
	    	<%
	    	response.sendRedirect("book.jsp");
	    	return ; 
	    }
	    
	    
	int res = bookdao.insertBook(title,writer,publisher,price);
	
	if(res > 0){
	%>

	<script type="text/javascript">
		alert("��ϼ���!")
		location.href = "list.jsp"
	</script>

	<%
	}else {
	%>

	<script type="text/javascript">
		alert("��Ͻ���!");
		history.back();
	</script>

	<%
	}
	%>


	//
	<a href="index.jsp">�ڷΰ���</a>

</body>
</html>