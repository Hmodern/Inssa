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
	out.println("�α������� ���� ������Դϴ�.");
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

		alert("�ȷο�Ǿ����ϴ�!")
		return;
	}
</script>
<%
response.sendRedirect("home.jsp?id=" + id);
%>
