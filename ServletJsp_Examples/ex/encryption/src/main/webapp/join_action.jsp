<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, controller.*, model.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="m" class="model.MemberVO" />
<jsp:setProperty name="m" property="*" />
<%
	MemberDAO memDAO=new MemberDAO();
	memDAO.addMember(m);
	List membersList = memDAO.listMembers();
	request.setAttribute("membersList", membersList);
%>
<title>회원 목록</title>
</head>
<body>
	<table align="center" border="1">
		<tr align="center" bgcolor="lightgreen">
			<td width="11%"><b>아이디</b></td>
			<td width="11%"><b>비밀번호</b></td>
			<td width="11%"><b>이름</b></td>
		</tr>
		<c:choose>
			<c:when test="${membersList==null }">
				<tr>
					<td colspan=5>
						<b>등록된 회원이 없습니다.</b>
					</td>
				</tr>
			</c:when>
			<c:when test="${membersList!=null }">
				<c:forEach var="mem" items="${membersList }">
					<tr align="center">
						<td>${mem.id }</td>
						<td>${mem.passwd }</td>
						<td>${mem.name }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</body>
</html>