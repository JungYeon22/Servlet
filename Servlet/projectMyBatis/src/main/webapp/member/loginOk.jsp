<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String id = request.getParameter("id"); 
	String name = request.getParameter("name");  */
	
	
	String name = null;
	String id = null;
	
	//쿠키
	// 특정 크키만을 가져오지 못하고, 모든 쿠키를 다 가져온다.
	/* Cookie[] ar = request.getCookies();
	if(ar != null){
		for(int i=0;i < ar.length;i++){
			String cookieName = ar[i].getName(); // 쿠키명
			String cookieValue = ar[i].getValue(); // 쿠키값
			
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookieValue);
			System.out.println();
			
			if(cookieName.equals("memName")){
				name = cookieValue;
			}
			if(cookieName.equals("memId")){
				id = cookieValue;
			}
		}
	} */
	
	//세션
	MemberDTO memberDTO = (MemberDTO)session.getAttribute("memMemberDTO");
	name = memberDTO.getName();
	id = (String)session.getAttribute("memId");
%>
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

	<font color="blue"><%=name %>님 로그인 성공! (아이디 : <%=id %>) </font></h2>

	<br><br>
	<input type="button" value="회원정보수정" onclick="location.href='updateForm.jsp'">
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	
	<%-- <form action="updateForm.jsp" method="post">
		<input type="hidden" name="id" value="<%=id %>">
		<input type="submit" value="회원정보수정">
	</form> --%>
</body>
</html>