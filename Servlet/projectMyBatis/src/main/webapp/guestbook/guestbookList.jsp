<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="java.util.List"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 
	int pg = Integer.parseInt(request.getParameter("pg"));

	//페이징 처리
	int endNum = pg * 3;
	int startNum = endNum - 2;
	
	GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
	List<GuestbookDTO> list = guestbookDAO.getGuestbookList(startNum, endNum);
	
	int totalA = guestbookDAO.getTotalA();		//총 글수
	int totalP = (totalA + 2) / 3;			//총 페이지수
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
	#currentPaging{background : gray; color:white; }	 
	#paging:hover{background-color : #ddd; text-decoration:underline;}	
</style>
</head>
<body>

<%for(int i=0;i < list.size();i++){ %>
	<table border="1" cellpadding="10" >
		<tr>
			<th>작성자</th>
			<td><%= list.get(i).getName() %></td>
			<th>작성일</th>
			<td><%=new SimpleDateFormat("yyyy.MM.dd").format(list.get(i).getLogtime())  %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3"><%= list.get(i).getEmail() %></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan="3"><%= list.get(i).getHomepage() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%= list.get(i).getSubject() %></td>
		</tr>
		<tr>
			<td colspan="4" height="100px"><%= list.get(i).getSubject() %></td>
		</tr>
	</table>
	<hr>
<%} %>
		<div id="pagingDiv">
		<%for(int i=1;i <= totalP;i++){ %>
			<%if(pg==i){ //span태그 사용%>
				<a id="currentPaging" href="guestbookList.jsp?pg=<%=i %>"><%=i %></a>
			<%} else { %>
				<a id="paging" href="guestbookList.jsp?pg=<%=i %>"><%=i %></a>
			<%} %>
		<%} %>
		</div>
	
</body>
</html>