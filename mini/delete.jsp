<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/head.jsp" %>
<%
String kind = request.getParameter("kind");
if ( kind == null ) kind = "B";
String no = request.getParameter("no");
String id = request.getParameter("id");

BoardDTO dto = new BoardDTO();
BoardVO vo = dto.Read(no, false);

if ( vo == null ) {
	
	response.sendRedirect("board.jsp?id=" + id + "&kind=A");
	return;
}

//진짜 소유자인지 검사한다.
if ( !loginVO.getId().equals(id) ) {
	
	response.sendRedirect("board.jsp?id=" + id + "&kind=A");
}

dto.Delete(no);
response.sendRedirect("board.jsp?id=" + id + "&kind=" + kind);
%>

<%@ include file="./include/tail.jsp" %>	
