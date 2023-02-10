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
	height: 30%;
}

.blackmem .name {
	height: 30%;
}

.blackmem .info {
	height: 30%;
}

ul {
	list-style: none;
}

li {
	float: left;
}
#input{
	background-color:white;
}
</style>
</head>
<body>
<%
String id = request.getParameter("id");
%>
	<ul>
		<c:forEach var="locker" items="${lockersList}">
			<li>
				<form action="${contextPath }/member/sendLocker.do">
					<div class="blackmem">
					<input type="hidden" name="lockerMember" value="<%=id%>">
					<input type="hidden" name="lockerNum" value="${locker.lockerNum }">
						<div class="id">${locker.lockerNum } <input type="submit" value="선택" id="input"></div>
						<div class="name">
							<a href="${contextPath }/member/theChosenOne.do?id=${locker.lockerMember}">${locker.lockerMember }</a>
						</div>
						<div class="info">
							<input type="text" value="${locker.lockerPWD }" size="8" name="lockerPWD">
						</div>
					</div>
				</form>
			</li>
		</c:forEach>
	</ul>
</body>
</html>