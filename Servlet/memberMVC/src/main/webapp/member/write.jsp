<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="member.dao.MemberDAO" %>
<%@ page import ="member.bean.MemberDTO" %>		
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${su == 1 }"><h1>회원가입을 축하합니다.</h1></c:if>
<c:if test="${su != 1 }"><h1>회원가입 실패..</h1></c:if>

<input type="button" value="로그인" onclick="location.href='/memberMVC/member/loginForm.do'">
</body>
</html>