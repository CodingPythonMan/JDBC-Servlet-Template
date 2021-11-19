<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%--<c:url> 태그로 이동할 페이지를 설정합니다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:url 태그 실습</title>
</head>
<body>
	<!-- 리다이렉트할 페이지를 설정합니다. -->
	<c:redirect url="/test01/member1.jsp">
		<c:param name="id" value="hong" />
		<c:param name="pwd" value="1234" />
		<c:param name="name" value="홍길동" />
		<c:param name="email" value="hong@test.com" />
	</c:redirect>
</body>
</html>