<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
<script>
var list = [];

<c:forEach var="member" items="${membersList}">
	list.push("${member.id}");
</c:forEach>
alert(list);
</script>
<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>이름</b></td>
      <td><b>전화번호</b></td>
      <td><b>최종유효시작</b></td>
      <td><b>최종유효끝</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="member" items="${membersList}" >     
   <tr align="center">
      <td>${member.id}</td>
      <td>${member.mName}</td>
      <td>${member.mPhone}</td>
      <td>${member.mStartDate}</td>
      <td>${member.mLastDate}</td>
      <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/member/searchMember.do"><h1 style="text-align:center">검색창</h1></a>
</body>
</html>