<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>풀떼기</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<form>
	<label class="title">로그인</label>
	<table>
		<tr>
			<td><input type="radio" value="member"/><label>회원</label> &nbsp;&nbsp;
			<input type="radio" value="visit"/><label>비회원(주문조회)</label></td>
		</tr>
		<tr>
			<td>&nbsp;<input type="text" name="id" placeholder="풀떼기 아이디" required="required" />
			<input type="button" value="로그인"/></td>
		</tr>
		<tr>
			<td>&nbsp;<input type="password" name="password" placeholder="풀떼기 비밀번호" required="required" /></td>
		</tr>
		<tr>
			<td><input type="checkbox" value="storeid" /><label>아이디저장</label>
			<small><ins>OTP 로그인</ins></small></td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>
		<tr>
			<td><input type="button" value="회원가입" onclick="location.href='template.jsp?page=join'">
			<input type="button" value="아이디 찾기">
			<input type="button" value="비밀번호 찾기"></td>
		</tr>
	</table>
	</form>
</body>