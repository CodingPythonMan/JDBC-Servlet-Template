<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#checkJson").click(function(){
		var _jsonInfo = '{"name":"박지성", "age":"25", "gender":"남자", "nickname":"날센돌이"}';
		// 제이쿼리의 JSON 기능인 parse() 메소드를 이용해 JSON 자료형을 가져옵니다.
		$.ajax({
			type: "post",
			async:false,
			url:"${contextPath}/json",
			//매개변수 이름 jsonInfo로 JSON 데이터를 ajax로 전송합니다.
			data : {jsonInfo: _jsonInfo},
			success:function(data, textStatus){
			},
			error: function(data, textStatus){
				alert("에러가 발생했습니다.");
			},
			complete:function(data, textStatus){
			}
		});
	});
});
</script>
</head>
<body>
	<input type="button" value="출력" id="checkJson"/><br><br>
	<div id="output"></div>
</body>
</html>