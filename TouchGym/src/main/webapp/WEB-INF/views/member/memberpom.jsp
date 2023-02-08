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
<meta charset="UTF-8">
<title>회원 가입창</title>
<style>
.text_center {
	text-align: center;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>
</head>
<body>
	회원번호는 숫자만 입력가능합니다.<br>
	꼭! 중복검사 하시고 회원가입해주세요.
	<form method="post" action="${contextPath}/member/addMember.do"
		name="form1">
		<h1 class="text_center">회원 가입창</h1>
		<table align="center">
			<tr>
				<td width="200"><p align="right">회원번호</td>
				<td width="400"><input type="number" name="id" id="id"></td>
				<td align="left"><input type="button" name="checkId" value="중복검사"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이름</td>
				<td width="400"><input type="text" name="mName"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">전화번호</td>
				<td width="400"><p>
						<input type="text" name="mPhone"></td>
			</tr>
			<tr>
				<td width="200"><p>&nbsp;</p></td>
				<td width="400"><input type="submit" id="btnSub"
					disabled="disabled" value="가입하기"><input type="reset"
					value="다시입력"></td>
			</tr>
		</table>
	</form>
	<script>
		var list = [];
		
		<c:forEach var="member" items="${membersList}">
			list.push("${member.id}");
		</c:forEach>
		
		
		const putId = document.getElementById("id");
		const btnCheck = document.form1.checkId;
		
		btnCheck.addEventListener("click", e => {
			console.log(list);
			console.log(putId.value);
			var putput = putId.value;
			if(list.includes(putput)){
				document.getElementById("btnSub").disabled=true;
				btnCheck.disabled=false;
				alert("이미 존재하는 회원번호입니다");
			}
			else if(putput===""){
				document.getElementById("btnSub").disabled=true;
				btnCheck.disabled=false;
				alert("회원번호를 입력해주세요");
			}
			else{
				document.getElementById("btnSub").disabled=false;
				btnCheck.disabled=true;
			}
		})
	</script>
</body>