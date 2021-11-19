<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form method="post" action="join_action.jsp">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="passwd"><br>
		이름: <input type="text" name="name"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>