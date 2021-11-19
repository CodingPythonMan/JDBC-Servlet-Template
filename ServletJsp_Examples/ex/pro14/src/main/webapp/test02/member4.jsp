<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("address", "수원시 팔달구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table>
		<tr>
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>주소</b></td>
		</tr>
		<tr>
			<td>${id}</td>
			<td>${pwd }</td>
			<td>${name }</td>
			<td>${email }</td>
			<td>${address }</td>
		</tr>
	</table>
</body>
</html>