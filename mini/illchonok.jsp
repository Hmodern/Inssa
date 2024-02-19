<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="innssa.dto.GbookIllchonDTO"%>
<%@page import="innssa.vo.GbookIllchonVO"%>
<%@page import="innssa.dto.BoardDTO"%>
<%@page import="innssa.vo.BoardVO"%>
<%@page import="innssa.vo.UserVO"%>
<%
response.setCharacterEncoding("EUC-KR");
UserVO loginVO = (UserVO)session.getAttribute("login");
String homeID  = request.getParameter("id");
String icontents = request.getParameter("icontents");

if( loginVO == null ) {
%>
<script>
	alert("로그인 해주세요 ㅎ");
	window.close();
</script>
<%
}


GbookIllchonVO vo = new GbookIllchonVO();
GbookIllchonDTO dto = new GbookIllchonDTO();

vo.setGicontents(icontents);
vo.setGitype("I");
vo.setId(homeID);
vo.setGiwriter_id(loginVO.getId());
dto.Insert(vo);

response.sendRedirect("home.jsp?id=" + homeID);
%>