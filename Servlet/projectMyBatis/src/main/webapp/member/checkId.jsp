<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String id = request.getParameter("id");
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean exist = memberDAO.isExistId(id);
	String result = "";
	if(exist){
		result= "exist";
	}else {
		result = "non_exist";
	}
%>
<h1><%= result%></h1>

