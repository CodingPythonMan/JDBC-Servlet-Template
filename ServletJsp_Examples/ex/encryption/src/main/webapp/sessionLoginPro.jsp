<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.MemberDAO, model.MemberVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDAO logon = MemberDAO.getInstance();
	MemberVO mvo = new MemberVO();
	
	mvo.setId(id);
	mvo.setPasswd(passwd);
	
	int check = logon.loginMember(mvo);
	
	if(check == 1){
		session.setAttribute("id", id);
		response.sendRedirect("sessionLogin.jsp");
	}else if(check == 0){
%>
<script>
	alert("아이디가 맞지 않습니다..");
	history.go(-1);	
</script>
<%
}
%>