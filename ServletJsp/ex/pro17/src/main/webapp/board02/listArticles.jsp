<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<b><span class="span1">등록된 글이 없습니다.</span></b>
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
							<span class="span2"></span>
							<c:choose>
								<%-- level값이 1보다 큰 경우는 자식 글이므로 level값만큼 부모 글 밑에 공백으로 들여쓰기하여 자식글임을 표시합니다. --%>
								<c:when test="${article.level > 1 }">
									<%--부모 글 기준으로 왼쪽 여백을 level값만큼 채워 답글을 부모글에 대해 들여쓰기합니다. --%>
									<c:forEach begin="1" end="${article.level }" step="1">
										<span class="span3"></span>
									</c:forEach>
									<span class="span4">[답변]</span>
									<%-- 공백 다음에 자식 글을 표시합니다. --%>
									<a class="cls1" href="${contextPath }/board/viewArticle.do?articleNO=${article.articleNO}"> ${article.title} </a>
								</c:when>
								<c:otherwise>
									<a class="cls1" href="${contextPath }/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td width="10%">
							<fmt:formatDate value="${article.writeDate }" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<!-- 글쓰기를 클릭하면 글쓰기 창인 articleForm.jsp가 나타납니다! -->
	<a class ="cls1" href="${contextPath }/board/articleForm.do">
		<p class="cls2">글쓰기</p>
	</a>
</body>
</html>