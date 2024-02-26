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
	body form table{
	  display: flex;
	  align-items: center;
	  justify-content: flex-start;
	  margin: 50px 0 0 50px;
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
		<hr>
	</div>
	<jsp:include page="../main/boardMenu.jsp"></jsp:include>
	
	<form id="boardReplyForm">
		pseq:<input type="text" name="pseq" id="pseq" value="${pseq }">
		pg:<input type="text" name="pg" id="pg" value="${pg }">
		
		<h3>답글쓰기</h3>
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
					<input type="button" value="글쓰기" id="boardReplyBtn">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
	<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script>
       $('#boardReplyBtn').click(function(){
    	   $('#checkSubject').empty();
    	   $('#checkContent').empty();
    	   if($('#subject').val()==''){
    		   $('#checkSubject').html('제목을 입력해주세요');
    	   }else if($('#content').val()==''){
    		   $('#checkContent').html('내용을 입력해주세요');
    	   }else {
    		   $.ajax({
    			   type: 'post'
    			   , url: '/projectMVC/board/boardReply.do'	// pseq, pg, subject, content
    			   , data: $('#boardReplyForm').serialize()
    			   , dataType: 'text'
    			   , success: function(data){
    				   data = data.trim();
    				   console.log(data);
    				   if(data != "ok"){
    					   alert('게시글 등록에 실패하였습니다.')
    				   }else{
    					   alert('게시글이 등록되었습니다.')
    					   location.href='/projectMVC/board/boardList.do?pg='+$('#pg').val();
    				   }
    			   }
    			   , error: function(e){
    				   console.log(e)
    			   }
    		   })
    	   }
       })
    </script>
</body>
</html>