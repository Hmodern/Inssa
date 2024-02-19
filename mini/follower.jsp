<%@page import="innssa.vo.FollowerVO"%>
<%@page import="innssa.dto.FollowerDTO"%>
<%@page import="innssa.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String id = request.getParameter("id");
String follower_id = request.getParameter("follower_id");
if(follower_id == null)
{
	out.println("로그인하지 않은 사용자입니다.");
	return;
}

FollowerDTO dto = new FollowerDTO();
FollowerVO vo = new FollowerVO();

vo.setId(id);
vo.setFollower_id(follower_id);
dto.Follower(vo);

%>
<script>
	window.onload function() {

		alert("팔로우되었습니다!")
		return;
	}
</script>
<%
response.sendRedirect("home.jsp?id=" + id);
%>
