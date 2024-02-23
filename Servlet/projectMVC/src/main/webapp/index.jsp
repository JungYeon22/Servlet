<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
}
html {
	overflow-y: scroll;
}

#wrap{
	width: 1100px; 
	margin: 0 auto;
}

#header {
	height: 10%;
	text-align: center;
}

#container {
	margin: auto;
	width: 1100px;
	height: 500px;
}

#container:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

#nav {
	margin-left: 10px;
	width: 25%;
	height: 100%;
	float: left;
}

#section {
	width: 70%;
	height: 100%;
	float: left;
}

#footer {
	width: 1100px;
	height: 10%;
}
#bgImage {
	opacity: 0.7;
	width:50%;
	hegiht:50%;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1>
			<img alt="사과" src="/projectMVC/image/apple.png" width="50" height="50"
				onclick="location.reload()" style="cursor:pointer">
			MVC를 활용한 미니 프로젝트
		</h1>
		<jsp:include page="./main/menu.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="nav"><jsp:include page="./main/nav.jsp"/>
		</div>
		<div id="session">
			<h3>
				저희 홈페이지를 방문해 주셔서 감사합니다.<br>
				Have a nice day!<br><br>
				<img id="bgImage" alt="사진" src="/projectMVC/image/bg.jpg">
			</h3>
		</div>
	<hr>
	</div>
	<div id="footer"> 비트캠프
	</div>
</div>

</body>
</html>
















