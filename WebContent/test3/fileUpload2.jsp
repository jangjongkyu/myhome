
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
		  out.println("파일 업로드 성공!!");
 	 }catch(IOException e){
 		 out.println("파일 업로드 실패!!");
 		 e.printStackTrace();
 	 }
%>

<ul>
  <li>올린이 : <%=mr.getParameter("name") %>
  <li>파일명 : <%=mr.getFilesystemName("filename") %>
  <li>컨텐트타입 : <%=mr.getContentType("filename") %>
  <li>파일크기 :
  
  <%
     File file = mr.getFile("filename");
     if(file != null){
    	 long filesize= file.length();
 		 out.println(filesize);
     }
  %>
</ul>