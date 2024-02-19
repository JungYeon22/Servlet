<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="member.dao.MemberDAO" %>
<%@ page import ="member.bean.MemberDTO" %>		
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <jsp:useBean id="memberDTO" class="member.bean.MemberDTO"
	scope="request"/>
<jsp:setProperty name="memberDTO" property="name" value="${param.name}"/>
<jsp:setProperty name="memberDTO" property="id" value="${param.id}"/>
<jsp:setProperty name="memberDTO" property="pwd" value="${param.pwd}"/>
<jsp:setProperty name="memberDTO" property="gender" value="${param.gender}"/>
<jsp:setProperty name="memberDTO" property="email1" value="${param.email1}"/>
<jsp:setProperty name="memberDTO" property="email2" value="${param.email2}"/>
<jsp:setProperty name="memberDTO" property="tel1" value="${param.tel1}"/>
<jsp:setProperty name="memberDTO" property="tel2" value="${param.tel2}"/>
<jsp:setProperty name="memberDTO" property="tel3" value="${param.tel3}"/>
<jsp:setProperty name="memberDTO" property="zipcode" value="${param.zipcode}"/>
<jsp:setProperty name="memberDTO" property="addr1" value="${param.addr1}"/>
<jsp:setProperty name="memberDTO" property="addr2" value="${param.addr2}"/>

<jsp:forward page="/pinput"/>

 --%>
<%
	//데이터
	request.setCharacterEncoding("UTF-8");	// post 요청시( 톰켓 옛날 버전), 위에 있는 pageEncoding="UTF-8"은 응답(response)
	// request로 넘어오는 한글을 UTF-8로 설정하겠다.
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	MemberDTO memberDTO = new MemberDTO();
	
	memberDTO.setName(name);
	memberDTO.setId(id);
	memberDTO.setPwd(pwd);
	memberDTO.setGender(gender);
	memberDTO.setEmail1(email1);
	memberDTO.setEmail2(email2);
	memberDTO.setTel1(tel1);
	memberDTO.setTel2(tel2);
	memberDTO.setTel3(tel3);
	memberDTO.setZipcode(zipcode);
	memberDTO.setAddr1(addr1);
	memberDTO.setAddr2(addr2);
	
	// DB insert
	MemberDAO memberDAO = MemberDAO.getInstance();
	int su = memberDAO.write(memberDTO);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<%if(su == 1){ %>
	회원가입을 축하합니다.
<%} else{%>
	회원가입이 안되었습니다.<br>
	다시 작성해주세요.
<%} %>


</body>
</html>