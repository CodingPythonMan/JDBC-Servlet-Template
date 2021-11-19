<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)request.getAttribute("id");
	String pwd = (String)request.getAttribute("pwd");
	String name = (String)session.getAttribute("name");
	String email = (String)application.getAttribute("email");
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
		</tr>
		<tr>
			<td><%=id %></td>
			<td><%=pwd %></td>
			<td><%=name %></td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td>${id}</td>
			<td>${pwd }</td>
			<td>${name }</td>
			<td>${email }</td>
		</tr>
	</table>
</body>
</html>