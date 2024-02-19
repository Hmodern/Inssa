<%@page import="innssa.vo.ReplyVO"%>
<%@page import="innssa.dto.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="innssa.vo.UserVO"%>
<%
String no = request.getParameter("no");
String rcontents = request.getParameter("rcontents");
UserVO loginVO = (UserVO)session.getAttribute("login");

if(loginVO == null)
{
	out.println("로그인하지 않은 사용자입니다.");
	return;
}

ReplyDTO dto = new ReplyDTO();
ReplyVO vo = new ReplyVO();

vo.setNo(no);
vo.setId(loginVO.getId());
vo.setRcontents(rcontents);
dto.Insert(vo);

out.println("댓글을 등록하였습니다.");
%>
