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
       <h2>�� �� �� ü �� ��</h2>
       <hr width="300">
       
    <%}else{
       members = memberdao.findMember(search, searchString);
     %>  
     
     <hr width="300">
       <h2>�� �� �� ��</h2>
       <form name="f" method="post">
          <input type="hidden" name="mode" value="find">
          <select name="search">
             <option value="id" selected="selected">���̵�
             <option value="name">�̸�
          </select>
          <input type="text" name="searchString">
          <input type="submit" value="�˻�">
       </form>
       <hr width="300">       
    <%}%>
    


    <table border="1">
     <tr>
       <th>��ȣ</th>
       <th>���̵�</th>
       <th>�̸�</th>
       <th>�̸���</th>
       <th>��ȭ��ȣ</th>
       <th>������</th>
       <th>����|����</th>
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
          <a href="member_modify.jsp?no=<%=member.getNo()%>">����</a>
          <a href="member_delete.jsp?no=<%=member.getNo()%>">����</a>
        </td>
       </tr>
       
    <%}
    }%>
    </table>
    </div>

<%@ include file="../bottom.jsp"%>
