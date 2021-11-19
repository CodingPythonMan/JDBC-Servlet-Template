<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="member_action.jsp">
		<h1>회원 가입창</h1>
		<table>
			<tr>
				<td>
					<p>아이디</p>
				</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>
				<p>비밀번호</p>
				</td>
				<td>
					<input type="password" name="pwd">
				</td>
			</tr>
			<tr>
				<td>
				<p>이름</p>
				</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>
				<p>이메일</p>
				</td>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<td>
				<p>&nbsp;</p>
				</td>
				<td>
					<input type="submit" name="가입하기">
					<input type="reset" name="다시입력">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>