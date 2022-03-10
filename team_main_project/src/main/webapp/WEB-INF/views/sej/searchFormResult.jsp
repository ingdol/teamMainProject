<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="<c:url value='/css/sej/searchForm.css'/>" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div id="searchItem">
			<div id="itemSTop">
				<div id="searchName">소모임 검색결과</div>
			</div>
			 <div id="searchMenu">
				<ul id="searchMenuList">
					<c:choose>
						<c:when test="${empty gatSearchList}">
							<div id="searchCtg">찾는 내용이 없습니다.</div>
						</c:when>
				   <c:otherwise>
				   <c:forEach items="${gatSearchList}" var="gat"><li>	
							<a href="<c:url value='/sun/detailgat/${gat.gatNo}'/>"><img src="<c:url value='/images/${gat.gatPhoto}'/>" id="searchImg">	
							<br id="searchBr"><p id="searchCtg">소모임</p>
							<br id="searchBr"><p id="searchName">${gat.gatName}</p>
							<br id="searchBr"><div id="searchArea">${gat.gatArea}</div> </a></li>
					</c:forEach>
				   </c:otherwise>				
				</c:choose>
				</ul>
			</div>	
		</div>
		
		<div id="searchItem">
		</div>
		<div id="searchItem">
			<div id="itemSTop">
				<div id="searchName">클래스 검색결과</div>
			</div>
			 <div id="searchMenu">
				<ul id="searchMenuList">
					<c:choose>
						<c:when test="${empty classSearchList}">
							<div id="searchNone">찾는 내용이 없습니다.</div>
						</c:when>
				   <c:otherwise>
				   <c:forEach items="${classSearchList}" var="classVo"><li>	
							<a href="<c:url value='/sun/detailclass/${classVo.classNo}'/>"><img src="<c:url value='/images/${classVo.classPhoto}'/>" id="searchImg">	
							<br id="searchBr"><p id="searchCtg">클래스</p>
							<br id="searchBr"><p id="searchName">${classVo.classTitle}</p>
							<br id="searchBr"><div id="searchArea">${classVo.classArea}</div> </a></li>
					</c:forEach>
				   </c:otherwise>				
				</c:choose>
				</ul>
			</div>	
		</div>
	</body>
</html>