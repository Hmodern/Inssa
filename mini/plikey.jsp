<%@page import="innssa.vo.UserVO"%>
<%@page import="innssa.dto.LikeyDTO"%>
<%@page import="innssa.vo.LikeyVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String id = request.getParameter("id");

UserVO loginVO = (UserVO)session.getAttribute("login");

if(loginVO == null)
{
	out.println("�α������� ���� ������Դϴ�.");
	return;
}

LikeyDTO dto = new LikeyDTO();
LikeyVO vo = new LikeyVO();

vo.setId(id);
vo.setLiker_id(loginVO.getId());
dto.Plikey(vo);

out.println("���ƿ�~");
response.sendRedirect("home.jsp?id=" + id);
%>
