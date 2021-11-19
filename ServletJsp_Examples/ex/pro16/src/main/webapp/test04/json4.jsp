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
		var jsonStr = '{"members":[{"name":"박지성", "age":"25", "gender":"남자", "nickname":"날센돌이"}'
						+', {"name":"손흥민", "age":"30", "gender":"남자", "nickname":"탱크"}] }';
		// 제이쿼리의 JSON 기능인 parse() 메소드를 이용해 JSON 자료형을 가져옵니다.
		var jsonInfo = JSON.parse(jsonStr);
		var output = "회원 정보<br>";
		output += "=======<br>";
		for(var i in jsonInfo.members){
			// 각 배열 요소에 접근하여 객체의 name으로 value를 출력합니다.
			output += "이름: " + jsonInfo.members[i].name +"<br>";
			output += "나이: " + jsonInfo.members[i].age +"<br>";
			output += "성별: " + jsonInfo.members[i].gender +"<br>";
			output += "별명: " + jsonInfo.members[i].nickname +"<br><br><br>";
		}
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