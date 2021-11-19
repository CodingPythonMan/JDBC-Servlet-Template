<%@ page language="java" contentType="text/html; charset=UTF-8"
     isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set> 태그 이용해 pageContext 내장 객체의 컨텍스트 이름을 변수 contextPath에 미리 설정합니다. --%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<body>
	<form action="result.jsp">
		아이디 : <input type="text" size=20 /><br>
		비밀번호 : <input type="password" size=20 /><br>
		<input type="submit" value="로그인" /><input type="reset" value="다시입력" />
	</form>
	<br><br>
	<a href="${contextPath }/test03/memberForm.jsp">회원가입하기</a>
</body>
</html>