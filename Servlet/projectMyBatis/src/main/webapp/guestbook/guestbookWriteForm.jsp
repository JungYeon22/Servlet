<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name= (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table tr th{padding : 10px;}
	table tr td{padding : 5px;}
	#checkSubject, #checkContent {color : red; font-size: 8pt;}
</style>

</head>
<body>
<form action="guestbookWrite.jsp" method="post" name="guestbookWriteForm">
		<table border=1 cellspacing=0>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="name" id="name" size=20 placeholder="작성자 입력" value="<%= name%>">
				</td>
				
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" id="email" size=20 placeholder="이메일 입력" value="<%= email%>">
				</td>
				
			</tr>
			<tr>
				<th>홈페이지</th>
				<td>
					<input type="text" name="homepage" id="homepage" size=40 placeholder="http://">
				</td>
				
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" id="subject" size=40 placeholder="제목 입력">
					<div id="checkSubject"></div>
				</td>
				
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" id="content" cols="40" rows="8"></textarea>
					<div id="checkContent"></div>
				</td>
				
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글쓰기" onclick="checkGuestbookWrite();">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="location.href='guestbookList.jsp'">
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function checkGuestbookWrite(){
			document.guestbookWriteForm.subject.innerText = "";
			document.guestbookWriteForm.content.innerText = "";
			if(document.guestbookWriteForm.subject.value == ""){
				document.getElementById("checkSubject").innerHTML = "제목을 입력해주세요."
			}
			else if(document.guestbookWriteForm.content.value == ""){
				document.getElementById("checkContent").innerHTML = "내용를 입력해주세요."
			}else {
				document.guestbookWriteForm.submit();
			}
		}
	</script>



</body>
</html>