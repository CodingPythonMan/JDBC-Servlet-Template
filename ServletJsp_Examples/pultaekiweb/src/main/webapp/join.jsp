<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 풀떼기</title>
<link rel="stylesheet" type="text/css" href="css/join.css">
<script type="text/javascript" src="js/check.js"></script>
</head>
<body>
	<form name="joinform" method="post"
	onsubmit="return checkForm(document.joinform)"
	action="member.jsp" encType="UTF-8">
	<label class="title">회원가입</label>
	<table>
		<tr>
			<td><label class="tableName">사이트 이용정보 입력</label></td>
		</tr>
		<tr>
			<td rowspan=2 class="tdLabel"><label for="id" class="label">아이디</label></td>
			<td><label>영문자, 숫자,_만 입력 가능. 최소 3자이상 입력하세요.</label></td>
		</tr>
		<tr>
			<td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요." required="required" autofocus="autofocus"
			maxlength="12"/></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="password" class="label">비밀번호</label></td>
			<td><input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." required="required" maxlength="50"/></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="passwordCheck" class="label">비밀번호 확인</label></td>
			<td><input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호 확인" required="required" maxlength="50"/></td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>

		<tr>
			<td><label class="tableName">개인정보 입력</label></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="name" class="label">이름</label></td>
			<td><input type="text" placeholder="이름" name="name" id="name" required="required" maxlength="10"/></td>
		</tr>
		<tr>
			<td rowspan=2 class="tdLabel"><label for="nickname" class="label">닉네임</label></td>
			<td><label>공백없이 한글, 영문만 입력 가능(한글2자, 영문4자 이상)<br />
			닉네임을 바꾸시면 앞으로 1일 이내에는 변경할 수 없습니다.
			</label></td>
		</tr>
		<tr>
			<td><input type="text" placeholder="닉네임" id="nickname" name="nickname" maxlength="40" required="required"/></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="email" class="label">E-mail</label></td>
			<td><input type="text" placeholder="이메일" name="email" id="email" required="required"/></td>
		</tr>
		<tr>
			<td class="tdLabel"><label class="label">가입경로</label></td>
			<td><input type="radio" name="route" value="배너광고"/><label>인터넷검색</label>
			<input type="radio" name="route" value="배너광고"/><label>배너광고</label>
			<input type="radio" name="route" value="관련기사를 보고"/><label>관련기사를&nbsp;보고</label>
			<input type="radio" name="route" value="미라지홈페이지 보고"/><label>미라지홈페이지&nbsp;보고</label>
			<input type="radio" name="route" value="주변사람소개"/><label>주변사람소개</label>
			<input type="radio" name="route" value="기타"/><label>기타</label></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="home" class="label">전화번호</label></td>
			<td><input type="text" placeholder="전화번호를 입력하세요." name="home" id="home" required="required"/></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="phone" class="label">휴대폰번호</label></td>
			<td><input type="text" placeholder="휴대폰 번호를 입력하세요." name="phone" id="phone" required="required"
			pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
			title="###-####-####"/></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="birthday" class="label">생년월일</label></td>
			<td><input type="date" name="birthday" id="birthday" required="required"/></td>
		</tr>
		<tr>
			<td rowspan=4 class="tdLabel"><label for="id" class="label">주소</label></td>
			<td><input type="text" name="address" id="address" placeholder="주소" required="required"/>
			<input type="submit" value="주소 검색"/></td>
		</tr>
		<tr>
			<td><input type="text" name="basic" id="basic" placeholder="기본주소" required="required"/><label for="basic">기본주소</label></td>
		</tr>
		<tr>
			<td><input type="text" name="detail" id="detail" placeholder="상세주소" required="required"/><label for="detail">상세주소</label></td>
		</tr>
		<tr>
			<td><input type="text" name="conference" id="conference" placeholder="참고항목"/><label for="conference">참고항목</label></td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>

		<tr>
			<td><label class="tableName">기타 개인설정</label></td>
		</tr>
		<tr>
			<td class="tdLabel"><label for="kakaoMessage" class="label">카카오톡 메세지</label></td>
			<td><input type="checkbox" name="kakaoMessage" value="카카오톡 메세지"/><label>카카오톡 메세지를 받겠습니다.</label>
			<label>> 수신체크를 하시면 세일 소식을 가장 먼저 만나보실 수 있습니다.</label></td>
		</tr>
		<tr>
			<td class="tdLabel"><label class="label">메일링서비스</label></td>
			<td><input type="checkbox" name="mailing" value="메일링서비스"/><label>정보 메일을 받겠습니다.</label></td>
		</tr>
		<tr>
			<td class="tdLabel"><label class="label">SMS 수신여부</label></td>
			<td><input type="checkbox" name="smsReceiving" value="SMS 수신여부"/><label>휴대폰 문자메세지를 받겠습니다.</label></td>
		</tr>
		<tr>
			<td rowspan=2 class="tdLabel"><label class="label">정보공개</label></td>
			<td><label>정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다.</label></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="infoOpen" value="정보공개"/><label>다른분들이 나의 정보를 볼 수 있도록 합니다.</label></td>
		</tr>
		<tr>
			<td rowspan=2 class="tdLabel"><label class="label">자동등록방지</label></td>
			<td><img src="images/captcha.jpg" width=120px/>
			<input type="text" name="captcha" id="captcha" required="required"/></td>
		</tr>
		<tr>
			<td><label>자동등록방지 숫자를 순서대로 입력하세요.</label></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="회원가입"/>
			<input type="reset" value="취소"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>