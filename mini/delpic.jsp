<%@page import="innssa.dto.HomePicDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String pno = request.getParameter("pno");

HomePicDTO dto = new HomePicDTO();
dto.picDelete(pno);

out.println("������ �����Ͽ����ϴ�.");
%>