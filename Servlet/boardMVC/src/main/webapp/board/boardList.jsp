<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#pagingDiv {	
				text-align:center;
				width: 870px;
				margin-top: 10px;
				}
	#pagingDiv a{text-decoration: none; padding:3px 10px; border-radius: 5px; }
	#currentPaging{background-color : #4CAF50; color:white;}	 
	#paging:hover{background-color : #ddd; text-decoration:underline;}	
</style>

</head>
<body>
	<table border=1 cellpadding=7 frame="hsides" rules="rows">
		<tr>
			<th width="100">글번호</th>
			<th width="300">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		
<c:if test="${requestScope.list != null }">
	<c:forEach var="boardDTO" items="${list }">
		<tr>
			<td align="center">${boardDTO.seq}</td>
			<td>
				<c:forEach var="i" begin="0" end="${boardDTO.lev }" step="1">
					&emsp;
				</c:forEach>
				<c:if test="${boardDTO.pseq ne 0 }">
					<img src="../image/reply.gif" alt="reply">
				</c:if>
				${boardDTO.subject }
			</td>
			<td align="center">${boardDTO.name }</td>
			<td align="center">
			<fmt:formatDate value="${boardDTO.logtime }" pattern="yyyy-MM-dd" type="date"/>
			</td>
			<td align="center">${boardDTO.hit }</td>
		</tr>
	</c:forEach>
</c:if>	
	</table> 
	
		<div id="pagingDiv">
		<c:forEach var="i" begin="1" end="${totalP }" step="1">
			<c:if test="${pg eq i }">
				<a id="currentPaging" href="/boardMVC/board/boardList.do?pg=${i }">${i }</a>
			</c:if>
			<c:if test="${pg ne i }">
				<a id="paging" href="/boardMVC/board/boardList.do?pg=${i }">${i }</a>
			</c:if>
		</c:forEach>
		
		</div>
	
</body>
</html>