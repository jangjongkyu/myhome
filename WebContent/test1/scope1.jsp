<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope1.jsp -->

<jsp:useBean id="obj" class="my.scope.Counter" scope="application"/>
<jsp:setProperty property="count" name="obj"/>

<h2>page scope</h2>
<b>obj�� getCount() ȣ�� : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="result1.jsp">����������</a>