<%@page import="innssa.dto.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String rno = request.getParameter("rno");

ReplyDTO dto = new ReplyDTO();
dto.Delete(rno);

out.println("댓글을 삭제하였습니다.");
%>