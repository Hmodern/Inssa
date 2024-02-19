<%@page import="innssa.vo.UserVO"%>
<%@page import="innssa.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id = request.getParameter("id");
String pw = request.getParameter("pw");

if( id == null || pw == null ) {
	response.sendRedirect("login.jsp");
	return;
}

UserDTO dto = new UserDTO();
UserVO vo = dto.Login(id, pw);

if( vo == null ) {
	
	%>
		<script>
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			document.location = "login.jsp";
		</script>
	<%
}else {
	
	session.setAttribute("login", vo);
	response.sendRedirect("main.jsp?kind=A");
}

%>