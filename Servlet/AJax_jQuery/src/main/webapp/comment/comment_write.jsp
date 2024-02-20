<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="reuslt" value="true"/>
<c:set var="message" value="댓글이 등록 되었습니다."/>

<c:set var="num" value="${param.num }"></c:set>
<c:set var="writer" value="${param.writer }"></c:set>
<c:set var="datetime" value="${param.datetime }"></c:set>
<c:set var="content" value="${param.content }"></c:set>

<%--xml 보내기 --%>
<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result>${result }</result>
	<message>${message }</message>
	<item>
		<num>${num }</num>
		<writer>${writer }</writer>
		<content>${content }</content>
		<datetime>${datetime}</datetime>
	</item>
</comment>