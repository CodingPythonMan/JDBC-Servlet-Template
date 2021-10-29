<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#checkJson").click(function(){
		var jsonStr = '{"name":"박지성", "age":25, "gender":"남자", "nickname":"날센돌이"}';
		// 제이쿼리의 JSON 기능인 parse() 메소드를 이용해 JSON 자료형을 가져옵니다.
		var jsonObj = JSON.parse(jsonStr);
		var output = "회원 정보<br>";
		output += "=======<br>";
		// 문자열에서 JSON 객체의 속성을 가져옵니다.
		output += "이름: " + jsonObj.name + "<br>";
		output += "나이: " + jsonObj.age + "<br>";
		output += "성별: " + jsonObj.gender + "<br>";
		output += "별명: " + jsonObj.nickname + "<br>";
		// 회원정보를 출력합니다.
		$("#output").html(output);
	});
});
</script>
</head>
<body>
	<input type="button" value="출력" id="checkJson"/><br><br>
	<div id="output"></div>
</body>
</html>