<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="innssa.vo.*" %>
<%@ page import="innssa.dto.*" %>
<%
String id = request.getParameter("id");

if ( id == null || id.equals("")) {
	out.println("001");  //���̵� �Էµ��� �ʾҽ��ϴ�.
	return;
}


UserDTO dto = new UserDTO();
if(dto.CheckID(id) == true) {
	//���̵� �ߺ���.
	out.println("003");
}else {
	//��밡���� ���̵�.
	out.println("002");
}
%>