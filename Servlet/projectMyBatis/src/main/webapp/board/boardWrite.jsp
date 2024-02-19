<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	// 세션
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");	//세션에 email 넣기
	
	Map<String, String> map = new HashMap<>();
	map.put("id", id);
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("content", content);
	
	/* BoardDTO boardDTO = new BoardDTO();
	
	boardDTO.setName(name);
	boardDTO.setId(id);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	 */
	 
	BoardDAO boardDAO = BoardDAO.getInstance();
	int su = boardDAO.insertBoard(map);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	window.onload= function(){
		alert("작성하신 글을 등록하였습니다.");
		location.href = "boardList.jsp?pg=1";
	}
</script>

</body>
</html>