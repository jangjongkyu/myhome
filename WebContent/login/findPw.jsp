<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">

 <div align="center">
  <hr color="green" width="300">
  <h2>회 원 비 밀 번 호 찾 기</h2>
  <hr color="green" width="300">
  <form name="f" action="find_pw_result.jsp" method="post">
    <table width="500" class="outline">
    
      <tr>
        <th>이름</th>
        <td><input type="text" name="name" class="box"></td>
      </tr>
      
      <tr>
        <th>주민번호</th>
        <td><input type="text" name="ssn1" class="box">
        <input type="password" name="ssn2" class="box"></td>
      </tr>
      
       <tr>
        <th>아이디</th>
        <td><input type="text" name="id" class="box"></td>
      </tr>
        
      
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="조회">
          <input type="reset" value="취소">
      </tr>
      
    </table>
  </form>
</div>