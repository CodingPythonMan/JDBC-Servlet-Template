<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="js/join.js"></script>
</head>
<body>
	<p>
		<input type="text" name="zipcode" size="30">
		<input type="button" value="우편번호" onclick="zipcodesearch()">
	</p>
	<a href="javascript:filladd('15080', '서울특별시 영등포구 당산1동')">15080 서울특별시 영등포구 당산1동</a>
	<br>
	<a href="javascript:filladd('15042', '서울특별시 영등포구 당산2동')">15042 서울특별시 영등포구 당산1동</a>
	<br>
	<a href="javascript:filladd('15002', '서울특별시 영등포구 당산3동')">15002 서울특별시 영등포구 당산1동</a>
</body>
</html>