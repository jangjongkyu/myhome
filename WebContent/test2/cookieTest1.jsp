<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  
	//��Ű �����ϱ�
	Cookie ck1 = new Cookie("id","admin");
	Cookie ck2 = new Cookie("pwd","1234");
  
	//��ȿ�ð�����
	ck1.setMaxAge(24*60*60); // �ʴ����� ������ �ȴ�.
	ck2.setMaxAge(7*24*60*60);  //������
	//���� : ��Ⱚ�� ���� ������ �Ҽ� ����. ��ſ� ��ȿ�ð��� 0 ���� �ϸ� �ٷ� ������ �ȴ�.
	
	//Ŭ���̾�Ʈ�� ����
	response.addCookie(ck1);
	response.addCookie(ck2);
	
	out.println("<h2>��Ű ���� �� ���� �Ϸ�!!</h2>");
%>