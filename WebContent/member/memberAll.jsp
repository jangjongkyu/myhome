<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*" %>
 <%@ page import="my.member.*" %>


<!-- <link rel="stylesheet" type="text/css" href="../style.css"> -->

<jsp:useBean id="memberdao" class="my.member.MemberDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="memberdao" value="<%=pool%>"/>

<%@ include file="../top.jsp" %>

  <div align="center">
 <%
    request.setCharacterEncoding("EUC-KR");
    List<MemberDTO> members = null;
 
    String mode = request.getParameter("mode");
    
    if(mode == null){
    	mode = "all";
    }
    
    String search = request.getParameter("search");
    String searchString = request.getParameter("searchString");
    
    if(mode == "all"){
       members = memberdao.getMemberList(); %>
       
       <hr width="300">
       <h2>학 생 전 체 목 록</h2>
       <hr width="300">
       
    <%}else{
       members = memberdao.findMember(search, searchString);
     %>  
     
     <hr width="300">
       <h2>학 생 검 색</h2>
       <form name="f" method="post">
          <input type="hidden" name="mode" value="find">
          <select name="search">
             <option value="id" selected="selected">아이디
             <option value="name">이름
          </select>
          <input type="text" name="searchString">
          <input type="submit" value="검색">
       </form>
       <hr width="300">       
    <%}%>
    


    <table border="1">
     <tr>
       <th>번호</th>
       <th>아이디</th>
       <th>이름</th>
       <th>이메일</th>
       <th>전화번호</th>
       <th>가입일</th>
       <th>수정|삭제</th>
     </tr>
    
    <% 
    if(members == null || members.size() == 0){%>
        	
    <% }else{
    	
    for(MemberDTO member : members){ %>
       <tr>
        <td><%=member.getNo() %></td>
        <td><%=member.getId() %></td>
        <td><%=member.getName() %></td>
        <td><%=member.getEmail() %></td>
        <td><%=member.getAllHp() %></td>
        <td><%=member.getJoindate() %></td>
        <td>
          <a href="member_modify.jsp?no=<%=member.getNo()%>">수정</a>
          <a href="member_delete.jsp?no=<%=member.getNo()%>">삭제</a>
        </td>
       </tr>
       
    <%}
    }%>
    </table>
    </div>

<%@ include file="../bottom.jsp"%>
