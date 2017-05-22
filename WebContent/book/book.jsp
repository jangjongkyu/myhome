<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- student.jsp -->
<html>
 <head>
   <title>도서관리 프로그램</title>
 </head>
 <body>
   
   <div align="center">
     <hr color="green" width="300">
     <h2>도 서 등 록 페 이 지</h2>
     <hr color="green" width="300">
     <form name="f" action="insert.jsp" method="post">
       <table border="1">
          <tr>
           <td>
             책제목 : <input type="text" name="title"> <br>
             지은이 : <input type="text" name="writer"><br>
             출판사 : <input type="text" name="publisher"><br>
             판매가 : <input type="number" name="price"><br>
             <input type="submit" value="등록">
             <input type="reset" value="취소">
           </td>
          </tr>
       </table>
     </form>

     <hr color="green" width="300">
     <h2>도 서 삭 제 페 이 지</h2>
     <hr color="green" width="300">
     <form name="f" action="delete.jsp" method="post">
       <table border="1">
          <tr>
           <td>
             책제목 : <input type="text" name="title"> <br>
             <input type="submit" value="삭제">
           </td>
          </tr>
       </table>
     </form>
     
     <hr color="green" width="300">
     <h2>도 서 찾 기  페 이 지</h2>
     <hr color="green" width="300">
     <form name="f" action="find.jsp" method="post">
       <table border="1">
          <tr>
           <td>
             책제목 : <input type="text" name="title"> <br>
             지은이 : <input type="text" name="writer"><br>
             출판사 : <input type="text" name="publisher"><br>
             <input type="submit" value="찾기">
 
           </td>
          </tr>
       </table>
     </form>
     
     
     <hr color="green" width="300">
     <h2>도 서 찾 기  페 이 지</h2>
     <hr color="green" width="300">
     <form name="f" action="list.jsp" method="post">
       <table border="1">
          <tr>
           <td>
             <input type="submit" value="목록보기">
 
           </td>
          </tr>
       </table>
     </form>
     
   </div>
   
 </body>
</html>