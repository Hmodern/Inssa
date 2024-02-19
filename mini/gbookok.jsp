<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="innssa.vo.GbookIllchonVO"%>
<%@page import="innssa.dto.GbookIllchonDTO"%>
<%@page import="innssa.vo.UserVO"%>
<%
UserVO loginVO = (UserVO)session.getAttribute("login");
String homeID  = request.getParameter("id");
String gcontents = request.getParameter("gcontents");


GbookIllchonDTO dto = new GbookIllchonDTO();
GbookIllchonVO vo = new GbookIllchonVO();

vo.setId(homeID);
vo.setGiwriter_id(loginVO.getId());
vo.setGicontents(gcontents);
vo.setGitype("G");

dto.Insert(vo);

response.sendRedirect("gbook.jsp");
%>