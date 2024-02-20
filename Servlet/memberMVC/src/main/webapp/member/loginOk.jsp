<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
	<img src="../image/apple.png" alt="apple" width="30" height="30" 
								onclick="location.href='../index.jsp'" style="cursor:pointer">

	<font color="blue">${memName }님 로그인 성공! (아이디 : ${memId } ) </font></h2>
	<%-- ${sessionScope.memName } --%>
	<br><br>
	<input type="button" value="회원정보수정" onclick="location.href='/memberMVC/member/updateForm.do'">
	<input type="button" value="로그아웃" onclick="location.href='/memberMVC/member/logout.do'">
	
</body>
</html>