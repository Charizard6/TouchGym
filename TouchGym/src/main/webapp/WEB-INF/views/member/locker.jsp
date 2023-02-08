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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
.blackmem {
	margin-top: 20px;
	width: 100px;
	height: 70px;
	background: black;
	color: white;
	font-size: 15px;
}

.blackmem .id {
	padding-top: 10px;
	height: 20%;
}

.blackmem .name {
	height: 20%;
}

.blackmem .info {
	height: 20%;
}

ul {
	list-style: none;
}

li {
	float: left;
}
</style>
</head>
<body>
	<ul>
		<c:forEach var="locker" items="${lockersList}">
			<li>
				<div class="blackmem">
					<div class="id">${locker.lockerNum }</div>
					<div class="name"><a href="${contextPath }/member/theChosenOne.do?id=${locker.lockerMember}">${locker.lockerMember }</a></div>
					<div class="info">pw:${locker.lockerPWD }</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</body>
</html>