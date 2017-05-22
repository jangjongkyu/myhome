<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- result1.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="application"/>
<b>page : obj의 getCount() : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test1.html">처음으로</a>