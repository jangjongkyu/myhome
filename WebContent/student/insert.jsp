<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); �� ����. -->

<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="stdao" value="<%=pool%>"/>
<!-- stado.setPool(new my.db.ConnectionPoolBean()); -->

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

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");

		if (id == null || name == null || cname == null || id.trim().equals("") || name.trim().equals("")
				|| cname.trim().equals("")) {
	%>
	<script type="text/javascript">
		alert("���̵�, �л���, �б޸��� ��� �Է����ּ���!!")
		history.back();
	</script>
	<%
		return; //���� ������ ����
		}
		int res = stdao.insertStudent(id,name,cname);
		if(res > 0){
	%>
	     <script type="text/javascript">
	       alert("�л� ��� ���� !!")
	     </script>
	<%
	    response.sendRedirect("list.jsp");
		}else{
	%>
	     <script type="text/javascript">
	       alert("�л� ��� ���� !!")
	       history.back();
	     </script>
	<%
		}
	%>


	//
	<a href="index.jsp">�ڷΰ���</a>

</body>
</html>