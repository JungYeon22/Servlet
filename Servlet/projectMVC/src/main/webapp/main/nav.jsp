<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 기본 스타일 */
.button {
  display: inline-block;
  padding: 10px;
  font-size: 16px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

/* 일반 상태 스타일 */
.button {
  background-color: #3498db;
  color: #fff;
  border: 2px solid #3498db;
}

/* 호버 상태 스타일 */
.button:hover {
  background-color: #2980b9;
}

</style>
</head>
<body>
	<c:if test="${sessionScope.memMemberDTO ne null}">
		<h3>${memName }님 로그인</h3>
		<input type="button" id="logoutBtn" class="button" value="로그아웃" >
		<input type="button" id="updateBtn" class="button" value="회원정보수정" >
	</c:if>
	<c:if test="${sessionScope.memMemberDTO == null}">
		<input type="button" class="button" value="로그인" onclick="location.href='/projectMVC/member/loginForm.do'"><br><br>
		<input type="button" class="button" value="회원가입" onclick="location.href='/projectMVC/member/writeForm.do'"><br><br>
	</c:if>
	
	
	<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script>
        //로그아웃
        $('#logoutBtn').click(function(){
        	$.ajax({
        		type: 'post'
        		, url: '/projectMVC/member/logout.do'
        		, dataType: 'text'
        		, success: function(data){
        			console.log(data)
        			alert('로그아웃');
        			location.href='/projectMVC/index.jsp';
        		}
        		, error: function(e){
        			console.log(e);
        		}
        	})
        });
        
        $('#updateBtn').click(function(){
        	location.href='/projectMVC/member/updateForm.do'
        })
    </script>
	
	
	

</body>
</html>