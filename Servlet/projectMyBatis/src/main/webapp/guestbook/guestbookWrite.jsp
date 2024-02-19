<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String homepage = request.getParameter("homepage");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// 데이터 담기

	GuestbookDTO guestbookDTO = new GuestbookDTO();
	guestbookDTO.setSubject(subject);
	guestbookDTO.setContent(content);
	guestbookDTO.setHomepage(homepage);
	guestbookDTO.setName(name);
	guestbookDTO.setEmail(email);
	
	// 데이터 넣기
	GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
	int su = guestbookDAO.insertGuestbook(guestbookDTO);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su==1) {%>
<h1>방명록 등록이 완료되었습니다.</h1>
<button type="button" onclick="location.href='guestbookList.jsp?pg=1'">글목록</button>
<%} %>
</body>
</html>