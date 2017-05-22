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

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		int price = 0;
		
		try{
		   price = Integer.parseInt(request.getParameter("price"));
		}catch(Exception e){%>
		<script type="text/javascript">
		   alert("판매가는 숫자로만 입력해 주세요.");
		</script>
		   
	   <% 
	   return;
		}
		
		
	    if(title == null || writer == null || publisher == null || title.trim().equals("") ||
	    		writer.trim().equals("") || publisher.trim().equals("")){
	    	%>
	    	<script type="text/javascript">
	    	  alert("잘못된 입력입니다.");
	    	</script>
	    	<%
	    	response.sendRedirect("book.jsp");
	    	return ; 
	    }
	    
	    
	int res = bookdao.insertBook(title,writer,publisher,price);
	
	if(res > 0){
	%>

	<script type="text/javascript">
		alert("등록성공!")
		location.href = "list.jsp"
	</script>

	<%
	}else {
	%>

	<script type="text/javascript">
		alert("등록실패!");
		history.back();
	</script>

	<%
	}
	%>


	//
	<a href="index.jsp">뒤로가기</a>

</body>
</html>