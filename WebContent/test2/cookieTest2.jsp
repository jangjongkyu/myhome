<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//쿠키 가져오기
	Cookie[] cks = request.getCookies();
	String name = null, value = null;
	if(cks != null){
		out.println("<b>클라이언트로 부터 넘어온 쿠기들</b><br");
		for(int i = 0 ; i < cks.length; ++i){
			name = cks[i].getName();
			value = cks[i].getValue();
			out.println("name = " + name + ", value = " + value + "<br>");
		}
	}
%>