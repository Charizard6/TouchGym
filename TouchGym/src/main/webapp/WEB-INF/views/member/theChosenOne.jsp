<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>스프링 터치짐</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

div {
	width: 100%;
	height: 100%;
}

div.top {
	width: 100%;
	height: 10%;
	background: #000000;
	padding-top: 20px;
}

div.top ul li {
	color: white;
	float: left;
	font-size: 20px;
	margin-left: 10px;
}

div.left {
	width: 16%;
	float: left;
	box-sizing: border-box;
	background: #EAEBEF;
	border: 1px solid black;
	padding-right: 3%;
}

div.right {
	width: 84%;
	float: right;
	box-sizing: border-box;
	background: #F3F3F3;
	border: 1px solid black;
	padding-left: 20px;
}

div.right-search {
	padding-top: 20px;
	box-sizing: border-box;
	height: 5%;
}

div.right-member {
	box-sizing: border-box;
	background: white;
	height: 30%;
}

div.right-payment {
	box-sizing: border-box;
	background: white;
	height: 30%;
}
div.right-payment .paybutton {
	height:10%;
	padding-top:10px;
	padding-left:70%;
}
div.right-payment .CheckCalender {
	height:10%;
}

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

ul {
	list-style: none;
}

.left li {
	margin-bottom: 20px;
	margin-left: 10px;
	width: 80px;
}

.left li a {
	font-size: 20px;
	text-decoration:underline;
	color:#503C52;
	font-weight:bold;
}
.left li a:hover{ color: pink;}
</style>
</head>
<body>
	<div class="top">
		<ul>
			<li>헬스장 회원관리 웹프로그램</li>
			<li><a
				href="${contextPath }/member/theChosenOne.do?id=main">터치짐</a></li>
			<li>을 스프링으로 구현해보았습니다.</li>
		</ul>
	</div>
	<div class="left">
		<ul>
			<li><a id="submit3"><i style="color: orange;">New</i><br>신규
					회원 등록
					</a></li>
			<li><a id="submit2">실시간<br>방문 현황
					</a></li>
			<li><a id="gotoLock">사물함<br>현황
					</a></li>
		</ul>
	</div>
	<c:forEach var="member" items="${membersList}">
		<c:set var="id" value="${member.id }" scope="page" />
		<c:set var="mName" value="${member.mName }" scope="page" />
		<c:set var="mPhone" value="${member.mPhone }" scope="page" />
		<c:set var="mStartDate" value="${member.mStartDate }" scope="page" />
		<c:set var="mLastDate" value="${member.mLastDate }" scope="page" />
	</c:forEach>
	<div class="right">
		<div class="rigth-all">
			<div class="right-search">
				회원번호 : <input type="text" id="searchbox" value="${id }">
				<button id="submit1" onClick="getValue()">검색</button>
				<br> <br>
			</div>
			<div class="right-member">
				<form method="post" name="mod_form"
					action="${contextPath}/member/modMember.do">
					<table align="center">
						<h2 class="text_center" style="text-align: left;">
							최종 유효 기간 <input type="date" name="mStartDate"
								value="${mStartDate}"> ~ <input type="date"
								name="mLastDate" value="${mLastDate}">
							</h1>

							<input type="hidden" name="id" value="${id }">
							<tr>
								<td width="200"><p align="right">이름</td>
								<td width="400"><input type="text" name="mName"
									value="${mName}"></td>
							</tr>
							<tr>
								<td width="200"><p align="right">휴대전화</td>
								<td width="400"><p>
										<input type="text" name="mPhone" value="${mPhone}"></td>
							</tr>
							<tr>
								<td width="200"><p align="right">다른정보1</td>
								<td width="400"><p>
										<input type="text" name="" value=""></td>
								<td width="200"><p align="right">다른정보2</td>
								<td width="400"><p>
										<input type="text" name="" value=""></td>
								<td width="200"><p align="right">다른정보3</td>
								<td width="400"><p>
										<input type="text" name="" value=""></td>
							</tr>
							<tr>
								<td width="200"><p align="right">다른정보4</td>
								<td width="400"><p>
										<input type="text" name="" value=""></td>
								<td width="200"><p align="right">다른정보5</td>
								<td width="400"><p>
										<input type="text" name="" value=""></td>
								<td width="200"><p align="right">다른정보6</td>
								<td width="400"><p>
										<input type="text" name="" value=""></td>
							</tr>
							<tr>
								<td width="200"><p>&nbsp;</p></td>
								<td width="400"><input type="submit" value="수정하기"></td>
							</tr>
					</table>
				</form>
			</div>
			<hr>
			<div class="right-payment">
				<!-- 결제 버튼 만들기 + 결제 시 기간 쿼리 생각하기기기 ++ 락커버튼 만들기 +++ 올해 출석일 및 달력 -->

				<div class="paybutton">
					<button id="paybutton" onClick="getPayModal()">결제버튼</button>
					<button id="lockerbutton" onClick="getlockerModal()">사물함지정</button>
				</div>
				<div class="CheckCalender">달력자리입니다.</div>
				<div class="paymentTable">
					<table border="1 solid #707070" align="center" width="80%">
						<tr align="center" bgcolor="#707070">
							<td>수강종목</td>
							<td>결제일</td>
							<td>결제금액</td>
							<td>취소(삭제)</td>
						</tr>
						<c:forEach var="payment" items="${paymentList}">
							<tr align="center">
								<td>${payment.pInfo}</td>
								<td>${payment.pPaydate}</td>
								<td>${payment.pPrice}</td>
								<td><a
									href="${contextPath}/member/removePayment.do?pindex=${payment.pindex }&id=${id}">삭제하기</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- modal창창창 -->
	<div id="modal" class="modal-overlay">
		<div id="modal-window"class="modal-window">
			<div class="title">
				<h2>모달</h2>
			</div>
			<!-- <div class="close-area">X</div> -->
			<div class="content"></div>
		</div>
	</div>
	<!-- modal창창창 -->
	<script>
		//출석조회
		const modal = document.getElementById("modal");
		const modalwindow = document.getElementById("modal-window");
		const submit22 = document.getElementById("submit2");
		const title = modal.querySelector(".title h2")
		submit22.addEventListener("click", e =>{
			$('#modal').css('display','flex');
			$('.content').load("${contextPath}/member/loginToday.do");
			title.innerText = "금일 방문 현황";
		})
		/*const closeBtn = modal.querySelector(".close-area")
			closeBtn.addEventListener("click", e => {
    		modal.style.display = "none"
		})*/
		modal.addEventListener("click", e => {
    	const evTarget = e.target
    		if(evTarget.classList.contains("modal-overlay")) {
       	modal.style.display = "none"
       		$('#modal').css('height','800px');
       		$('#modal-window').css('height','500px');
       		$('#modal-window').css('width','800px');
    		}
		})
		//출석조회
		//검색
		
		function getValue(){
			var id=$('#searchbox').val();
			var loc = "${contextPath}/member/listChosenMembers.do?id="+id;
			console.log(id);
			title.innerText="검색결과";
			$('#modal').css('display','flex');
			$('.content').load(loc);
		}
		const submit33 = document.getElementById("submit3");
		submit33.addEventListener("click", e =>{
			$('#modal').css('display','flex');
			$('.content').load("${contextPath}/member/memberpom.do");
			title.innerText = "신규 회원 등록";
		})
		const Locker = document.getElementById("gotoLock");
		Locker.addEventListener("click", e =>{
			$('#modal').css('display','flex');
			$('#modal').css('height','1000px');
			$('#modal-window').css('height','700px');
			$('#modal-window').css('width','1300px');
			$('.content').load("${contextPath}/member/locker.do");
			title.innerText = "사물함 현황";
		})
		const getid = document.getElementById('searchbox').value;
		function getPayModal(){
			var loc = "${contextPath}/member/paymentPage.do?id="+getid;
			title.innerText="결제 창";
			$('#modal').css('display','flex');
			$('.content').load(loc);
		}
		function getlockerModal(){
			title.innterText="사물함";
			var loc = "${contextPath}/member/lockerPage.do?id="+getid;
			title.innerText="사물함";
			$('#modal').css('display','flex');
			$('#modal').css('height','1000px');
			$('#modal-window').css('height','700px');
			$('#modal-window').css('width','1300px');
			$('.content').load(loc);
		}
	</script>
</body>
</html>