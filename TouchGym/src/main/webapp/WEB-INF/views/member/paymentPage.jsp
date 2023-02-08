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
<title>결제창입니다.</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.main {
	padding-left: 60px;
	padding-top: 20px;
}
</style>
</head>
<body>
	<%
	String id = request.getParameter("id");
	%>
	<c:forEach var="member" items="${memberList}">
		<c:set var="id" value="${member.id }" scope="page" />
		<c:set var="mName" value="${member.mName }" scope="page" />
		<c:set var="mPhone" value="${member.mPhone }" scope="page" />
		<c:set var="mStartDate" value="${member.mStartDate }" scope="page" />
		<c:set var="mLastDate" value="${member.mLastDate }" scope="page" />
	</c:forEach>
	<div class="main">
		<form method="post" action="${contextPath}/member/paymentPage2.do">
			<select name="pInfo" id="pInfo" onchange="Cvalue()">
				<option value="">헬스,GX 선택</option>
				<option value="헬스 1개월 10000원">헬스 1개월 10000원</option>
				<option value="헬스 6개월 50000원">헬스 6개월 50000원</option>
				<option value="헬스 12개월 100000원">헬스 12개월 100000원</option>
				<option value="GX 1개월 10000원">GX 1개월 10000원</option>
				<option value="GX 6개월 50000원">GX 6개월 50000원</option>
				<option value="GX 12개월 100000원">GX 12개월 100000원</option>
			</select> &nbsp;&nbsp;&nbsp; <input type="number" name="pPrice" id="pPrice">원&nbsp;&nbsp;&nbsp;
			<input type="hidden" value="<%=id%>" name="pID"><br> <br>
			<input type="hidden" value="<%=id%>" name="id"> <input
				type="date" value="${mStartDate }" name="mStartDate" id="mStartDate">~
			<input type="date" value="${mLastDate }" name="mLastDate"
				id="mLastDate"> <input type="submit" value="결제완료">
		</form>
	</div>
	<script>
		function AddDays(date, days) {
			// date는 문자열로 받는다 ex, '2020-10-15'
			var result = new Date(date);
			result.setDate(result.getDate() + days);
			let finale = result.getFullYear()+'-'+
				((result.getMonth()+1)<10?"0"+(result.getMonth()+1):(result.getMonth()+1))
				+'-'+((result.getDate())<10?"0"+(result.getDate()):(result.getDate()));
			return finale;
		}
		function Cvalue() {
			var value_str = document.getElementById('pInfo').value;
			var value_startdate = document.getElementById('mStartDate');
			var value_lastdate = document.getElementById('mLastDate');
			console.log(value_startdate.value);
			console.log(typeof(value_startdate.value));
			var num_val = document.getElementById('pPrice');
			if (value_str === "헬스 1개월 10000원" || value_str === "GX 1개월 10000원") {
				num_val.value = 10000;
				value_startdate.value = AddDays(value_lastdate.value, 1);
				value_lastdate.value = AddDays(value_lastdate.value, 30);
			} else if (value_str === "헬스 6개월 50000원"
					|| value_str === "GX 6개월 50000원") {
				num_val.value = 50000;
				value_startdate.value = AddDays(value_lastdate.value, 1);
				value_lastdate.value = AddDays(value_lastdate.value, 180);
			} else if (value_str === "헬스 12개월 100000원"
					|| value_str === "GX 12개월 100000원") {
				num_val.value = 100000;
				value_startdate.value = AddDays(value_lastdate.value, 1);
				value_lastdate.value = AddDays(value_lastdate.value, 360);
			}
		}
	</script>
</body>
</html>