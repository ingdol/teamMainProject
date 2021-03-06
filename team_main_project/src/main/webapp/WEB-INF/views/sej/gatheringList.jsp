<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
   </head>
   <body>
      <div id="mainWrap">         
      
         <!-- TOP  -->
          <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
         
         <section>
            <table id="memListTable" border="1">
				<c:when test="${empty gatSearchList}">
					<tr align="center"><td colspan="6">찾는 회원이 없습니다.</td></tr>
				</c:when>
			  <c:otherwise>
				   <c:forEach items="${gatSearchList}" var="gat">
				   	<tr> <td>${gat.gatName}</td>
							   	</tr>
				   </c:forEach>
			   </c:otherwise>				
		</table>		
         </section>
         
         <!-- BOTTOM  -->
          <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
         
      </div>
   </body>
</html>
