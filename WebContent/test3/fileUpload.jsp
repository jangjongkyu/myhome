<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->


  <div align="center">
   <hr color="green" width="300">
   <h2>�� �� �� �� �� �� �� Ʈ</h2>
   <hr color ="green" width="300">
   <form name="f" action="fileUpload2.jsp" method="post" enctype="multipart/form-data">
    <table border="1" width="400">
       <tr>
         <th>�ø���</th>
         <td><input type="text" name="name"></td>
       </tr>
       
        <tr>
          <th>���ϸ�</th>
          <td><input type="file" name="filename"></td>
        </tr>
        
        <tr>
          <td colspan="2">
          <input type="submit" value="���Ͼ��ε�">
          <input type="reset" value="���">
        </tr>
        
    </table>
   </form>
  
  </div>
