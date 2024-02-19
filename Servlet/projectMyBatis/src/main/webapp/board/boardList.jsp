<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//데이터
	int pg = Integer.parseInt(request.getParameter("pg"));

	//페이징 처리
	int endNum = pg * 5;
	int startNum = endNum - 4;

	//DB에서 select로 가져오기
	BoardDAO boardDAO = BoardDAO.getInstance();
	Map<String, Integer> map =new HashMap<>();
	map.put("startNum", startNum);
	map.put("endNum", endNum);
	
	List<BoardDTO> list = boardDAO.boardList(map);

	int totalA = boardDAO.getTotalA();		//총 글수
	int totalP = (totalA + 4) / 5;			//총 페이지수

	
%>    
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
	#currentPaging{background : #4CAF50; color:white;}	 
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
<%if(list!=null){ %>
	<%for(BoardDTO boardDTO : list){ %>
		<tr>
			<td align="center"><%=boardDTO.getSeq() %></td>
			<td>
				<%for(int i=0;i < boardDTO.getLev();i++){ %>
					&emsp;
				<%} %>
				<%if(boardDTO.getPseq() != 0){ %>
					<img src="../image/reply.gif" alt="reply">
				<%} %>
				<%=boardDTO.getSubject() %>
			</td>
			<td align="center"><%=boardDTO.getName() %></td>
			<td align="center"><%=new SimpleDateFormat("yyyy.MM.dd.").format(boardDTO.getLogtime()) %></td>
			<td align="center"><%=boardDTO.getHit() %></td>
		</tr>
	<%} %> 
<%} %> 
	</table> 
	
		<div id="pagingDiv">
		<%for(int i=1;i <= totalP;i++){ %>
			<%if(pg==i){ //span태그 사용%>
				<a id="currentPaging" href="boardList.jsp?pg=<%=i %>"><%=i %></a>
			<%} else { %>
				<a id="paging" href="boardList.jsp?pg=<%=i %>"><%=i %></a>
			<%} %>
		<%} %>
		</div>
	
</body>
</html>