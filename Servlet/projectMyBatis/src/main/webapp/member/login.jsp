<%@page import="java.net.URLEncoder"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");	// post 요청시( 톰켓 옛날 버전), 위에 있는 pageEncoding="UTF-8"은 응답(response)
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = memberDAO.memberById(id);
	boolean success = memberDAO.login(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (success){
//	response.sendRedirect("loginOk.jsp?id="+id+"&name="
//							+URLEncoder.encode(memberDTO.getName(), "UTF-8"));
	// 쿠키
	/* Cookie cookie = new Cookie("memName", memberDTO.getName());
	cookie.setMaxAge(30*60);	// 초단위 - 30분
	response.addCookie(cookie);		//클라이언트에 저장
	
	Cookie cookie2 = new Cookie("memId", id);
	cookie.setMaxAge(30*60);
	response.addCookie(cookie2); */

	// 세션
	//HttpSession session = request.getSessiosn();
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id);
	session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
	
	session.setAttribute("memMemberDTO", memberDTO);	// 세션은 객체(DTO)를 담을 수 있다.
	
	response.sendRedirect("loginOk.jsp");

} else{
	// 페이지 이동
	response.sendRedirect("loginFail.jsp");
} %>

</body>
</html>