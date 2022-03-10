<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Title</title>
      <script src="/js/jquery-3.6.0.min.js"></script>
      <script>
          $(document).ready(function(){
             // alert("이미 리뷰를 작성하셨습니다.");
              location.replace("/mypage/" + $('#memNick').val()); // 변경 필요
          });
      </script>
  </head>
  <body>
    <input type="hidden" id="memNick" value="${sessionScope.snick}">
  </body>
</html>
