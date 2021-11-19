 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%--HashMap으로 저장해서 넘어온 값들은 이름이 길어 사용하기 불편하므로 <c:set>태그를 이용해 각 값들을 짧은 변수 이름으로 저장합니다. --%>
<c:set var="articlesList" value="${articlesMap.articlesList }" />
<c:set var="totalArticles" value="${articlesMap.totalArticles }" />
<c:set var="section" value="${articlesMap.section }" />
<c:set var="pageNum" value="${articlesMap.pageNum }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록창</title>
<style>
.cls1{
	text-decoration: none;
}

.cls2{
	text-align: center;
	font-size: 30px;
}
.no-uline{
	text-decoration: none;
}
.sel-page{
	text-decoration: none; 
	color:red;
}
.txt_center{
	text-align: center;
	font-size: 25px;
}
</style>
</head>
<body>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor="lightgreen">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:choose>
			<c:when test="${empty articlesList }">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty articlesList }">
				<%-- articlesList로 포워딩된 글 목록을 <forEach>태그를 이용해 표시합니다. --%>
				<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
					<tr align="center">
						<%--<forEach> 태그의 varStatus의 count 속성을 이용해 글 번호를 1부터 자동으로 표시합니다. --%>
						<td width="5%">${articleNum.count }</td>
						<td width="10%">${article.id }</td>
						<td align="left" width="35%">
							<span style="padding-right:30px;"></span>
							<c:choose>
								<%-- level값이 1보다 큰 경우는 자식 글이므로 level값만큼 부모 글 밑에 공백으로 들여쓰기하여 자식글임을 표시합니다. --%>
								<c:when test="${article.level > 1 }">
									<%--부모 글 기준으로 왼쪽 여백을 level값만큼 채워 답글을 부모글에 대해 들여쓰기합니다. --%>
									<c:forEach begin="1" end="${article.level }" step="1">
										<span style="padding-left:20px"></span>
									</c:forEach>
									<span style="font-size:12px;">[답변]</span>
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
	<div class="txt_center">
		<c:if test="${totalArticles != null }">
			<c:choose>
				<c:when test="${totalArticles > 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page==1 }">
							<a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}">&nbsp;
							pre</a>
						</c:if>
							<a class="no-uline" href="${contextPath }/board/listarticles.do?section=${section}&pageNum=${page}">
							${(section-1)*10+page}</a>
						<c:if test="${page == 10}">
							<a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp;
							next</a>
						</c:if>
					</c:forEach>
				</c:when>
				<%--전체 글 수가 100개 일 때는 첫번째 섹션의 10개 페이지만 표시하면 됩니다. --%>
				<c:when test="${totalArticles == 100 }" >
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline" href="#">${page }</a>
					</c:forEach>
				</c:when>
				<%--전체 글수가 100개보다 적을 때 페이징을 표시합니다. --%>
				<c:when test="${totalArticles < 100 }">
					<c:forEach var="page" begin="1" end="${totalArticles/10 + 1}" step="1">
						<c:choose>
							<c:when test="${page == pageNum }">
								<a class="sel-page" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}" >${page }
								</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page }
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
	</div>
	
	<!-- 글쓰기를 클릭하면 글쓰기 창인 articleForm.jsp가 나타납니다! -->
	<a class ="cls1" href="${contextPath }/board/articleForm.do">
		<p class="cls2">글쓰기</p>
	</a>
</body>
</html>