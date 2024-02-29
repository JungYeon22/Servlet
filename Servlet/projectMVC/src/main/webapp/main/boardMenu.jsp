<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#nav {
		margin: 50px 20px 0 100px;
		width: 15%;
		height: 100%;
		float: left;
	}
	#nav ul {
	  list-style: none;
	  padding: 0;
	}
	
	/* 각 항목에 스타일 적용 */
	#nav li {
	  margin-bottom: 10px;
	  padding: 8px;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	  background-color: #f9f9f9;
	}
	
	/* 호버 효과 추가 */
	#nav li:hover {
	  background-color: #e5e5e5;
	}
	hr {border-color :  green;}
</style>
	<ul id="nav" >
		<c:if test="${memMemberDTO ne null }">
			<li><a href="/projectMVC/board/boardWriteForm.do">글쓰기</a></li>
		</c:if>
		<li><a href="/projectMVC/board/boardList.do?pg=1">목록</a></li>
		
		<li><a href="/projectMVC/board/boardUpdate.do?pg=1">게시글 수정</a></li>
		
	</ul>