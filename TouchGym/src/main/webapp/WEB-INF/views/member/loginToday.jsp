<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
.blackmem {
	margin-top:20px;
	width: 100px;
	height: 130px;
	background: black;
	color: white;
	font-size:15px;
}
.blackmem .id{
	padding-top:10px;
	height:20%;
}
.blackmem .name{
	height:20%;
}
.blackmem .info{
	height:20%;
}
ul {
	
	list-style: none;
}
li {
	float:left;
}
</style>
</head>
<body>
	출석을 한 회원이며, 1시간 후 자동으로 사라집니다.
	<ul>
		<c:forEach var="member" items="${membersList}">
			<li>
				<div class="blackmem">
					<div class="id">${member.id }</div>
					<div class="name">${member.mName }</div>
					<div class="info">${member.mStartDate }<br>~<br>${m.LastDate }
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</body>
</html>