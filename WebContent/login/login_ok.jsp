<%@page import="my.login.LoginOKBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="my.member.MemberDTO"%>

<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>

<jsp:useBean id="loginOK" class="my.login.LoginOKBean"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="loginOK" value="<%=pool %>"/>

<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="loginOK"/>

<jsp:useBean id="login" class="my.login.LoginBean" scope="session"/>
<jsp:setProperty property="pool" name="login" value="<%=pool %>"/>
    
    
 <%
   if(loginOK.getId()==null || loginOK.getId().trim().equals("")){
	   response.sendRedirect("login.jsp");
	   return;
   }
 
   int res = loginOK.checkLogin();
   String msg = null , url = "login.jsp";
   switch(res){
   case LoginOKBean.OK:
	   login.setId(loginOK.getId());
	   boolean isLogin = login.isMemberSetting();
	 
	   Cookie ck = new Cookie("saveId",login.getId());
	   String saveId = request.getParameter("saveId");
	   if(saveId != null){
		   ck.setMaxAge(12*60*60);
	   }else{
		   ck.setMaxAge(0);
	   }
		   response.addCookie(ck);
	   
  	   session.setAttribute("mbId", loginOK.getId());
	   session.setAttribute("mbName", login.getName());
	   
   		msg = "["+login.getName()+"] 님이 로그인 하셨습니다.";
  		url = request.getContextPath()+"/index.jsp";
   		break;
   case LoginOKBean.NOT_ID:
		msg = "["+loginOK.getId()+"] 는 없는 아이디입니다..";
		break;
   case LoginOKBean.NOT_PWD:
	   msg = "비밀번호가 틀렸습니다. 다시 확인해 보세요!!";
	   break;
   case LoginOKBean.ERROR:
	   msg = "DB서버 오류 발생!! 관리자에게 문의하세요 \n 010-7302-1682";
	   break;
   }
 %>   
 
 <script type="text/javascript">
   alert("<%=msg %>");
   location.href="<%=url %>" 
</script>
