<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="innssa.vo.*" %>
<%@ page import="innssa.dto.*" %>
<%
String id = request.getParameter("id");

if ( id == null || id.equals("")) {
	out.println("001");  //아이디가 입력되지 않았습니다.
	return;
}


UserDTO dto = new UserDTO();
if(dto.CheckID(id) == true) {
	//아이디가 중복됨.
	out.println("003");
}else {
	//사용가능한 아이디.
	out.println("002");
}
%>