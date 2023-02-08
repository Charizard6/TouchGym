<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<table border="1" align="center" width="80%">
		<tr align="center" bgcolor="lightgreen">
			<td><b>아이디</b></td>
			<td><b>이름</b></td>
			<td><b>전화번호</b></td>
			<td><b>최종유효시작</b></td>
			<td><b>최종유효끝</b></td>
			<td><b>삭제</b></td>
		</tr>

		<c:forEach var="member" items="${memberList}">
			<tr align="center">
				<td><a
					href="${contextPath}/member/theChosenOne.do?id=${member.id }">${member.id}</td>
				<td>${member.mName}</td>
				<td>${member.mPhone}</td>
				<td>${member.mStartDate}</td>
				<td>${member.mLastDate}</td>
				<td><a
					href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>