<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");		
	String route = request.getParameter("route");
	String home = request.getParameter("home");
	String phone = request.getParameter("phone");
	String birthday = request.getParameter("birthday");
%>

	<h1>아이디 : <%=id %></h1>
	<h1>비밀번호 : <%=password %></h1>
	<h1>이름 : <%=name %></h1>
	<h1>닉네임 : <%=nickname %></h1>
	<h1>이메일 : <%=email %></h1>
	<h1>가입경로 : <%=route %></h1>
	<h1>이름 : <%=name %></h1>
	<h1>이름 : <%=name %></h1>
	<h1>이름 : <%=name %></h1>
	<h1>이름 : <%=name %></h1>
	<h1>이름 : <%=name %></h1>
	
	<h3>입력하신 정보가 맞으십니까?</h3>
	<input type="button" value="확인"/>
</body>
</html>