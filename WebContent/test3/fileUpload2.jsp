
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.IOException"%>
<%@ page import="com.oreilly.servlet.*"%>
<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/test3");
	int len = 100*1024*1024;
 	 try{
		  mr = new MultipartRequest(request,upPath,len,"EUC-KR");
		  out.println("���� ���ε� ����!!");
 	 }catch(IOException e){
 		 out.println("���� ���ε� ����!!");
 		 e.printStackTrace();
 	 }
%>

<ul>
  <li>�ø��� : <%=mr.getParameter("name") %>
  <li>���ϸ� : <%=mr.getFilesystemName("filename") %>
  <li>����ƮŸ�� : <%=mr.getContentType("filename") %>
  <li>����ũ�� :
  
  <%
     File file = mr.getFile("filename");
     if(file != null){
    	 long filesize= file.length();
 		 out.println(filesize);
     }
  %>
</ul>