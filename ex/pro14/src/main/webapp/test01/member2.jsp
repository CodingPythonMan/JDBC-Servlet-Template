<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
%>
<%
	/*
	//MemberBean m = new MemberBean(id, pwd, name, email);
	
	m.setId(id);
	m.setPwd(pwd);
	m.setName(name);
	m.setEmail(email);
	
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.addMember(m);
	List membersList = memberDAO.listMembers();*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록창</title>
</head>
<body>
	<table>
		<tr>
			<td>아아디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
		</tr>

		<tr>
			<td><%=id %></td>
			<td><%=pwd %></td>
			<td><%=name %></td>
			<td><%=email %></td>
		</tr>
		
		<tr>
			<td>${param.id }</td>
			<td>${param.pwd }</td>
			<td>${param.name }</td>
			<td>${requestScope.address }</td>
		</tr>
		
	</table>
</body>
</html>