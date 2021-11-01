<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록창</title>
<link rel="stylesheet" type="text/css" href="../css/listArticles.css">
</head>
<body>
	<table>
		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:choose>
			<c:when test="${empty articlesList }">
				<tr height="10">
					<td colspan="4">
						<p>
							<b><span>등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty articlesList }">
				<%-- articlesList로 포워딩된 글 목록을 <forEach>태그를 이용해 표시합니다. --%>
				<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
					<tr>
						<%--<forEach> 태그의 varStatus의 count 속성을 이용해 글 번호를 1부터 자동으로 표시합니다. --%>
						<td width="5%">${articleNum.count }</td>
						<td width="10%">${article.id }</td>
						<td class="main" width="35%">
							<span></span>
							<c:choose>
								<c:when test="${article.level > 1 }">
									<c:forEach begin="1" end="${article.level }" step="1">
										<span></span>
									</c:forEach>
									<span>[답변]</span>
									<a class="cls1" href="${contextPath }/board/viewArticle.do?articleNO=${article.articleNO}"> ${article>title} </a>
								</c:when>
								
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</body>
</html>