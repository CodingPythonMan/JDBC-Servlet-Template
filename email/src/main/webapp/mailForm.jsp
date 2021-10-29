<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="sendmail" method="post">
			<table>
				<tr>
					<th colspan="2">JSP 메일 보내기</th>
				</tr>
				<tr>
					<td>보내는 메일</td>
					<td><input type="email" name="fromEmail" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="fromName" /></td>
				</tr>
				<tr>
					<td>받는 메일</td>
					<td><input type="email" name="toEmail"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="toName" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" style="width: 170px; height: 200px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input type="submit" value="메일전송" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>