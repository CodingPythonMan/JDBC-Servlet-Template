<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, sec01.ex01.*"
    isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m1" class="sec01.ex01.MemberBean" />
<jsp:setProperty name="m1" property="*" />
<jsp:useBean id="membersList" class="java.util.ArrayList" />
<%
	MemberBean m2 = new MemberBean("son", "1234", "손흥민", "son@test.com");
	membersList.add(m1);
	membersList.add(m2);
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
			<td><b>${membersList[0].id }</b></td>
			<td><b>${membersList[0].pwd }</b></td>
			<td><b>${membersList[0].name }</b></td>
			<td><b>${membersList[0].email }</b></td>
		</tr>
		<tr>
			<td><b>${membersList[1].id }</b></td>
			<td><b>${membersList[1].pwd }</b></td>
			<td><b>${membersList[1].name }</b></td>
			<td><b>${membersList[1].email }</b></td>
		</tr>
	</table>
</body>
</html>