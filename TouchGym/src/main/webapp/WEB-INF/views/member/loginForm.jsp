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
<title>로그인창</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: black;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 800px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
	position: relative;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
	display: inline;
}

#modal .title h2 {
	display: inline;
}

/*#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}*/
#modal .content {
	height: 80%;
	margin-top: 20px;
	text-shadow: 1px 1px 2px gray;
	background: white;
}
</style>
</head>

<body>
	<table border="1" width="50%" align="center">
		<tr align="center">
			<td>회원번호</td>
		</tr>
		<tr align="center">
			<td><input type="text" size="20" id="searchbox" style="width:300px; height:50px; text-align:center; font-size:40px;">
			</td>
		<tr align="center">
			<td colspan="2"><input type="button" value="출석" id="sub" onClick="getValue()" style="width:300px; height:50px; text-align:center; font-size:30px;"></td>
		</tr>
	</table>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2></h2>
			</div>
			<!-- <div class="close-area">X</div> -->
			<div class="content"></div>
		</div>
	</div>
	<script>
	function getValue(){
		var id=$('#searchbox').val();
		var loc = "${contextPath}/member/login.do?id="+id;
		console.log(id);
		$('#modal').css('display','flex');
		$('.content').load(loc);
	}
   </script>
</body>
</html>