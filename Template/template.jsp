<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String pagefile = request.getParameter("page");
	if(pagefile == null){
		pagefile = "newitem";
	}
	String pagefileex=".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style type="text/css">
* {
	margin:0;
	padding: 0;
}
div#wrapper{
	margin: auto;
	width:960px;
	overflow:hidden;
	border: 1px solid gray;
}
header{
	float: left;
	width: 100%;
	height: 43px;
	border: 1px solid gray;
}
aside{
	float: left;
	width: 15%;
	text-align: center;
	border: 1px solid gray;
}
section{
	float:left;
	width: 84%;
	text-align: center;
}
footer{
	float:left;
	width: 100%;
	height: 40px;
	border:1px solid gray;
}
</style>
</head>
<body>
	<div id="wrapper">
	<header>
		<jsp:include page="top.jsp"/>
	</header>	
	<aside>
		<jsp:include page="left.jsp"/>
	</aside>
	<section>
		<jsp:include page="<%=pagefile+pagefileex%>" />
	</section>
	<footer>
		<jsp:include page="bottom.jsp"/>
	</footer>
	</div>
</body>
</html>