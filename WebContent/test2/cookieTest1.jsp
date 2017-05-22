<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  
	//쿠키 생성하기
	Cookie ck1 = new Cookie("id","admin");
	Cookie ck2 = new Cookie("pwd","1234");
  
	//유효시간설정
	ck1.setMaxAge(24*60*60); // 초단위로 저장이 된다.
	ck2.setMaxAge(7*24*60*60);  //일주일
	//참고 : 쿠기값은 따로 삭제를 할수 없다. 대신에 유효시간을 0 으로 하면 바로 삭제가 된다.
	
	//클라이언트로 전송
	response.addCookie(ck1);
	response.addCookie(ck2);
	
	out.println("<h2>쿠키 생성 및 전송 완료!!</h2>");
%>