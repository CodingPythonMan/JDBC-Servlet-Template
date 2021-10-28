<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<table>
		<tr>
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
		</tr>
	<c:choose>
		<%-- <c:when test="${name==null}"> --%>
		<c:when test='${empty param.id }'>
			<tr>
				<td colspan=5>이름을 입력하세요!!</td>
			</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<!-- name이 정상적이면 회원정보를 출력합니다. -->
			<td><c:out value="${param.id}" /></td>
			<td><c:out value="${param.pwd}" /></td>
			<td><c:out value="${param.name}" /></td>
			<td><c:out value="${param.email}" /></td>
		</tr>
		</c:otherwise>
	</c:choose>
	</table>
</body>
</html>