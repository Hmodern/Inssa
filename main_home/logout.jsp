<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
session.setAttribute("login",null);

response.sendRedirect("main.jsp?kind=A");
%>