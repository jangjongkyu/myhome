<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//��Ű ��������
	Cookie[] cks = request.getCookies();
	String name = null, value = null;
	if(cks != null){
		out.println("<b>Ŭ���̾�Ʈ�� ���� �Ѿ�� ����</b><br");
		for(int i = 0 ; i < cks.length; ++i){
			name = cks[i].getName();
			value = cks[i].getValue();
			out.println("name = " + name + ", value = " + value + "<br>");
		}
	}
%>