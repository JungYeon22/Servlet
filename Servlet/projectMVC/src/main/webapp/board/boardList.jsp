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
				margin-top: 10px;
				}
	#pagingDiv span{text-decoration: none; padding:3px 10px; border-radius: 5px; }
	#currentPaging{background-color : #4CAF50; color:white;}	 
	#paging:hover{background-color : #ddd; text-decoration:underline;}	
	table {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin: 20px;
	}
	.subjectA:Link{color: black; text-decoration: none;}
	.subjectA:visited{color: black; text-decoration: none;}
	.subjectA:hover{color: #4CAF50; text-decoration: underline;}
	.subjectA:active{color: black; text-decoration: none;}
</style>
</head>
<body>
<div id="header" style="text-align: center;">
		<h1>
			<img alt="사과" src="/projectMVC/image/apple.png" width="50" height="50"
				onclick="location.href='/projectMVC/index.jsp'" style="cursor:pointer">
			MVC를 활용한 미니 프로젝트
		</h1>
		<jsp:include page="../main/menu.jsp"></jsp:include>
	</div>
	<input type="hidden" id="pg" value="${pg }">
	<input type="hidden" id="memId" value="${memId }">
	<table border=1 cellpadding=7 frame="hsides" rules="rows" id="boardListTable">
		<tr>
			<th width="100">글번호</th>
			<th width="300">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		
		<!-- 동적 처리 -->
	</table> 
		
		<div id="pagingDiv">
		</div>
		
<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="../js/boardList.js"></script>
<script type="text/javascript">
	function boardPaging(pg){
		location.href="/projectMVC/board/boardList.do?pg="+pg
	}
</script>
</body>
</html>