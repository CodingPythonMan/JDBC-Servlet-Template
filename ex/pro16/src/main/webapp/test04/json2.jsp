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
		// 정수형 데이터를 가지는 이름이 age인 배열을 선언합니다.
		var jsonStr = '{"age": [22, 33, 44]}';
		// 제이쿼리의 JSON 기능인 parse() 메소드를 이용해 JSON 자료형을 가져옵니다.
		var jsonInfo = JSON.parse(jsonStr);
		var output = "회원 나이<br>";
		output += "=======<br>";
		// 배열이름 name으로 배열 요소에 반복변수를 이용해 차례로
		// 접근하여 값을 가져옵니다.
		for(var i in jsonInfo.age){
			output += jsonInfo.age[i] + "<br>";
		}
		// 회원이름을 출력합니다.
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