<%@page import="innssa.vo.UserVO"%>
<%@page import="innssa.dto.LikeyDTO"%>
<%@page import="innssa.vo.LikeyVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String no = request.getParameter("no");
String id = request.getParameter("id");
String kind = request.getParameter("kind");

UserVO loginVO = (UserVO)session.getAttribute("login");

if(loginVO == null)
{
	out.println("�α������� ���� ������Դϴ�.");
	return;
}

LikeyDTO dto = new LikeyDTO();
LikeyVO vo = new LikeyVO();

vo.setId(id);
vo.setNo(no);
vo.setLiker_id(loginVO.getId());
dto.Blikey(vo,true);

out.println("���ƿ�~");
response.sendRedirect("view.jsp?id=" + id + "&no=" + no + "&kind=" + kind);
%>
