<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table tr td{padding: 5px 5px;}
	input {margin:5px;}
	#checkName, #checkId, #checkPwd, #checkRepwd{color: red; font-size: 8pt;}
</style>
</head>
<body>
<form action="/memberMVC/member/update.do" name="updateForm" method="post">
	<table border="1" cellspacing=0>
		<tr>
			<td align="center" width="70px">이름</td>
			<td>
				<input type="text" name="name" id="name" placeholder="이름 입력" value="${requestScope.memberDTO.getName()}">
				<div id=checkName></div>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" placeholder="아이디 입력" value="${memberDTO.id }" readonly>
				<div id=checkId></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="pwd" value="${memberDTO.pwd }"name="pwd">
				<div id=checkPwd></div>
			</td>
		</tr>
		<tr>
			<th>재확인</th>
			<td>
				<input type="password" name="repwd">
				<div id=checkRepwd></div>
			</td>
		</tr>
		
		<tr>
			<td align="center">성별</td>
			<td>
				<input type="radio" id="0" name="gender" value="0">
				<label for="0">남자</label>
				<input type="radio" id="1" name="gender" value="1">
				<label for="1">여자</label>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email1" id="email1" value="${memberDTO.getEmail1() }" size=10>@
				<input type="text" name="email2" id="email2" value="${memberDTO.getEmail2() }" size=10>
				
				<select id="emails" onchange="changeEmail2()">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>
				<select name="tel1" id="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select>
				-
				<input type="text" name="tel2" value="${memberDTO.getTel2() }" size=4 maxlength=4>
				-
				<input type="text" name="tel3" value="${memberDTO.getTel3() }" size=4 maxlength=4>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="zipcode" value="${memberDTO.zipcode }" id="zipcode" readonly>
				<button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br>
				<input type="text" name="addr1" id="addr1" value="${memberDTO.addr1 }" size=50px readonly><br>
				<input type="text" name="addr2" id="addr2" value="${memberDTO.addr2 }" size=50px>
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="button" value="회원정보수정" onclick="checkUpdate();">
				<input type="reset" value="다시작성" onclick="location.reload()">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
window.onload=function(){
	document.getElementById("${memberDTO.gender }").checked = true;
	document.getElementById("tel1").value = "${memberDTO.tel1 }" 
}
		
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member.js"></script>
<script>
function checkUpdate(){
	document.getElementById("checkName").innerText = "";
	document.getElementById("checkId").innerText = "";
	document.getElementById("checkPwd").innerText = "";
	document.getElementById("checkRepwd").innerText = "";
	if(document.updateForm.name.value == ""){
		document.getElementById("checkName").innerHTML = "이름을 입력해주세요."
	}
	else if(document.updateForm.id.value == ""){
		document.getElementById("checkId").innerHTML = "아이디를 입력해주세요."
	}
	else if(document.updateForm.pwd.value == ""){
		document.getElementById("checkPwd").innerHTML = "비밀번호를 입력해주세요."
	}
	else if(document.updateForm.pwd.value != document.updateForm.repwd.value){
		document.getElementById("checkRepwd").innerHTML = "비밀번호를 확인해주세요."
	}else{
		document.updateForm.submit();
	}
}

		
</script>


</body>
</html>