<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table tr td{margin:10px; padding:10px;}
	#checkId, #checkPwd {color: red; font-size:8pt;}
</style>
</head>
<body>
<form action="login.jsp" name="loginForm" method="post">
	<table border="1" cellspacing=0>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" placeholder="아이디 입력">
				<div id=checkId></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력">
				<div id=checkPwd></div>
			</td>
		</tr>
		
		
		<tr>
			<td colspan=2 align="center">
				<input type="button" value="로그인" onclick="checkLogin();">
				<input type="button" value="회원가입" onclick="moveWriteForm(); return false;">
			</td>
		</tr>
	</table>
	
<script>
function checkLogin(){		
	document.getElementById("checkId").innerText = "";
	document.getElementById("checkPwd").innerText = "";
			if(document.loginForm.id.value == ""){
				document.getElementById("checkId").innerHTML = "ID를 입력해주세요."
			}
			else if(document.loginForm.pwd.value == ""){
				document.getElementById("checkPwd").innerHTML = "비밀번호를 확인해주세요."
			}else{
				document.loginForm.submit();
			}
	}
function moveWriteForm(){
	window.open("writeForm.jsp");
}
</script>
</form>
</body>
</html>