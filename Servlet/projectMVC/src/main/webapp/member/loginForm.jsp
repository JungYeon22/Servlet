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
	body form{
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin: 0;
	}
</style>
</head>
<body>
	<div id="header" style="text-align: center;">
		<h1>
			<img alt="사과" src="/projectMVC/image/apple.png" width="50" height="50"
				onclick="location.href='/projectMVC/index.jsp'" style="cursor:pointer">
			MVC를 활용한 미니 프로젝트
		</h1>
		<jsp:include page="../main/menu.jsp"></jsp:include>
	</div>
<form name="loginForm" >
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
	<div id="loginResult"></div>
</form>	
<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
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
				$.ajax({
					type: 'post'
					, url: '/projectMVC/member/login.do'
					/* , data: 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val() */
					// , data: $('#loginForm').seriliztion??
					, data: {'id': $('#id').val(), 'pwd': $('#pwd').val()}// json 객체로 
					, dataType: 'text'
					, success: function(data){
						data = data.trim();
						console.log(data)
						if(data == 'ok'){
							location.href = '/projectMVC/index.jsp' 
						}else if(data == 'fail'){
							$('#loginResult').text('아이디 또는 비밀번호가 틀렸습니다.');
						}
					}
					, error: function(e){
						console.log(e);
					}
					
				})
			} 
	}
function moveWriteForm(){
	window.open("writeForm.jsp");
}
</script>

</body>
</html>