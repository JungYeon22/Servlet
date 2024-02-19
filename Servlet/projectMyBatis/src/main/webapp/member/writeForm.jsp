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
<form action="write.jsp" name="writeForm" method="post">
	<table border="1" cellspacing=0>
		<tr>
			<td align="center" width="70px">이름</td>
			<td>
				<input type="text" name="name" placeholder="이름 입력">
				<div id=checkName></div>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" placeholder="아이디 입력">
				<!-- <button type="button" onclick="checkId(); return false;">중복체크</button> -->
				<div id=checkId></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="pwd" name="pwd">
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
				<input type="radio" id="gender_m" name="gender" value="0" checked>
				<label for="gender_m">남자</label>
				<input type="radio" id="gender_w" name="gender" value="1">
				<label for="gender_w">여자</label>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email1" id="email1" size=10>@
				<input type="text" name="email2" id="email2" size=10>
				
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
				<select name=tel1>
					<option value="010">010</option>
					<option value="">011</option>
					<option value="">019</option>
				</select>
				-
				<input type="text" name="tel2" size=4 maxlength=4>
				-
				<input type="text" name="tel3" size=4 maxlength=4>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="zipcode" id="zipcode" readonly>
				<button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br>
				<input type="text" name="addr1" id="addr1" placeholder="주소" size=50px readonly><br>
				<input type="text" name="addr2" id="addr2" placeholder="상세주소" size=50px>
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="button" value="회원가입" onclick="checkWrite();">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
 <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(function(){
            $('#id').blur(function(){
            	var id = $('#id').val();
            	$.get('checkId.jsp'
                       ,{'id' : id} //변수 : 값
                       , function(data){
                       	var result_text = $(data).text();
                       	console.log(result_text);
                       	if(result_text == 'exist'){
                       		$('#checkId').html('<span style="color: red"; font-weight:bold;> 사용 불가능한 아이디</span>')
                       	}else{
                       		$('#checkId').html('<span style="color: blue; font-weight:bold;"> 사용 가능한 아이디</span>')
                       	}
                })  
            })
        }); 
    </script>
</body>
</html>