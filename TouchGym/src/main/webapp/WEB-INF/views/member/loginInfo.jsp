<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Refresh" content="5;url=loginForm.do">
<title>Insert title here</title>
<style>
.blackmem {
	margin-top:20px;
	width: 600px;
	height: 330px;
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
	text-align:center;
}
</style>
</head>
<body>
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