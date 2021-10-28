<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.MemberVO, controller.MemberDAO"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="model.MemberVO" />
<jsp:setProperty name="m" property="*" />
<%
	MemberDAO memDAO=new MemberDAO();
	memDAO.addMember(m);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="sessionLogin.jsp" />
</body>
</html>