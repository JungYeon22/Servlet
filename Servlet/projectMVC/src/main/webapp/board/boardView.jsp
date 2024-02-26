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
	table {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin-top: 30px;
	}
	.subjectA:Link{color: black; text-decoration: none;}
	.subjectA:visited{color: black; text-decoration: none;}
	.subjectA:hover{color: #4CAF50; text-decoration: underline;}
	.subjectA:active{color: black; text-decoration: none;}
	#boardViewSpan{align : center;
					margin-top: 10px;}
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
<form id="boardViewForm">
<div id="section">
	pg:<input type="text" id="pg" name="pg" value="${pg }" readonly>
	seq:<input type="text" id="seq" name="seq" value="${seq }" readonly>
	memId:<input type="text" id="memId" value="${memId }" readonly>
	<table border=1 cellpadding=7 frame="hsides" rules="rows" id="boardViewTable">
		<tr>
			<td colspan=3 height=50><h3><span id="subjectSpan"></span></h3> </td>
		</tr>
		<tr>
			<td align="center" width="200">글번호 : <span id="seqSpan"></span></td>
			<td align="center" width="200">작성자 : <span id="idSpan"></span></td>
			<td align="center" width="200">조회수 : <span id="hitSpan"></span></td>
		</tr>
		<tr>
			<td colspan=3 height=300 valign="top"><span id="contentSpan"></span></td>
		</tr>
		
	</table> 
	<br>
	<div align="center">
		<input type="button" value="목록" onclick="location.href='/projectMVC/board/boardList.do?pg=${pg}'">
		<span id="boardViewSpan">
			<input type="button" value="글수정" id="boardUpdateFormBtn">
			<input type="button" value="글삭제" id="boardDeleteBtn">
		</span>
		<input type="button" value="답글" id="boardReplyFormBtn">
	</div>
</div>
</form>
		
<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="../js/boardView.js"></script>

</body>
</html>