<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="boardWrite.jsp" method="post" name="boardWriteFrom">
		<table border=1 cellspacing=0>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" id="subject" size=40>
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
					<input type="button" value="글쓰기" onclick="checkBoarderWrite();">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function checkBoarderWrite(){
			document.boardWriteFrom.subject.innerText = "";
			document.boardWriteFrom.content.innerText = "";
			if(document.boardWriteFrom.subject.value == ""){
				document.getElementById("checkSubject").innerHTML = "제목을 입력해주세요."
			}
			else if(document.boardWriteFrom.content.value == ""){
				document.getElementById("checkContent").innerHTML = "내용를 입력해주세요."
			}else {
				document.boardWriteFrom.submit();
			}
		}
	</script>

</body>
</html>