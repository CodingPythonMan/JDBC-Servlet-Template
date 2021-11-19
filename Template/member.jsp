<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="join.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="join.MemberBean" scope="page"/>
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
		<tr>
			<td>
				<jsp:getProperty name="m" property="id" />
			</td>
			<td>
				<jsp:getProperty name="m" property="pwd" />
			</td>
			<td>
				<jsp:getProperty name="m" property="name" />
			</td>
			<td>
				<jsp:getProperty name="m" property="nickName" />
			</td>
			<td>
				<jsp:getProperty name="m" property="email" />
			</td>
			<td>
				<jsp:getProperty name="m" property="route" />
			</td>
			<td>
				<jsp:getProperty name="m" property="homePhone" />
			</td>
			<td>
				<jsp:getProperty name="m" property="phone" />
			</td>
			<td>
				<jsp:getProperty name="m" property="birthday" />
			</td>
			<td>
				<jsp:getProperty name="m" property="postNum" />
			</td>
			<td>
				<jsp:getProperty name="m" property="basic" />
			</td>
			<td>
				<jsp:getProperty name="m" property="detail" />
			</td>
			<td>
				<jsp:getProperty name="m" property="conference" />
			</td>
			<td>
				<jsp:getProperty name="m" property="kakaoMessage" />
			</td>
			<td>
				<jsp:getProperty name="m" property="mailing" />
			</td>
			<td>
				<jsp:getProperty name="m" property="smsReceiving" />
			</td>
			<td>
				<jsp:getProperty name="m" property="infoOpen" />
			</td>
			<td>
				<jsp:getProperty name="m" property="captcha" />
			</td>
		</tr>
	</table>
</body>
</html>