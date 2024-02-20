<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- DB연동은 하지않고, 만약에 아이디 'hong', 비밀번호 '111'로그인 성공으로 가정 --%>
<c:set var="result" value="true" />
<c:set var="message" value="홍길동님 로그인" />

<c:if test="${param.user_id != 'hong'}">
	<c:set var="result" value="false"/>
	<c:set var="message" value="가입되지 않은 아이디 입니다."/>
</c:if>

<c:if test="${param.user_password != '111'}">
	<c:set var="result" value="false"/>
	<c:set var="message" value="잘못된 비밀번호 입니다."/>
</c:if>

<%-- xml 보내기 --%>
<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result> ${result } </result>
	<message> ${message } </message>
</login>
