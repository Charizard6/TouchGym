<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색창</title>
</head>
<body>
    <form method="post" action="${contextPath}/member/listChosenMembers.do">
        회원번호 : <input type="text" name="searchbox"><br><br>
        <input type="submit" value="조회하기">
    </form>
    <br><br>
    <form method="post" action="${contextPath}/member/loginToday.do">
        오늘 방문 회원 : <input type="submit" value="조회하기">
    </form>
</body>
</html>
