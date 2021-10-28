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
	<c:set var="dan" value="${param.dan }" />
	<table>
		<tr>
			<td colspan="2">
				<c:out value="${dan }" />단 출력</td>
		</tr>
		
		<c:forEach var="i" begin="1" end="9" step="1">
			<tr align="center">
				<td>
					<c:out value="${dan }" /> *
					<c:out value="${i }" />
				</td>
			</tr>
				<td>
					<c:out value="${i*dan }" />
				</td>
		</c:forEach>
	</table>
</body>
</html>