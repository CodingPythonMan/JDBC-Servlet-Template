<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="model.MemberVO, controller.MemberDAO" pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="model.MemberVO" scope="page"/>
<jsp:setProperty name="m" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>닉네임</td>
			<td>이메일</td>
			<td>가입경로</td>
			<td>전화번호</td>
			<td>휴대폰번호</td>
			<td>생년월일</td>
			<td>우편번호</td>
			<td>기본주소</td>
			<td>상세주소</td>
			<td>참고항목</td>
			<td>카카오톡메세지</td>
			<td>메일링서비스</td>
			<td>SMS수신여부</td>
			<td>정보공개</td>
		</tr>
		<c:choose>
			<c:when test="${membersList==null }">
				<tr>
					<td colspan="5">
						<b>등록된 회원이 없습니다.</b>
					</td>
				</tr>
			</c:when>
			<c:when test="${membersList != null }">
				<c:forEach var"mem" items="${membersList }">
					<tr>
						<td>${mem.id }</td>
						<td>${mem.pwd }</td>
						<td>${mem.name }</td>
						<td>${mem.nickName }</td>
						<td>${mem.email }</td>
						<td>${mem.route }</td>
						<td>${mem.homePhone }</td>
						<td>${mem.phone }</td>
						<td>${mem.birthday }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
						<td>${mem.id }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</body>
</html>