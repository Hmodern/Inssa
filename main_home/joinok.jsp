<%@page import="innssa.vo.UserVO"%>
<%@page import="innssa.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id 	   		= request.getParameter("id");
String pw 	  		= request.getParameter("pw");
String name    		= request.getParameter("name");
String nick_name    = request.getParameter("nick_name");
String mbti  		= request.getParameter("mbti");
String gender  		= request.getParameter("gender");

if ( id == null || pw == null || name == null || mbti == null ) {
	
	response.sendRedirect("join.jsp");
	return;
}

UserDTO dto = new UserDTO();
UserVO vo = new UserVO();
vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setNick_name(nick_name);
vo.setMbti(mbti);
vo.setGender(gender);
vo.setOne_line("한줄소개");

dto.Join(vo);
%>