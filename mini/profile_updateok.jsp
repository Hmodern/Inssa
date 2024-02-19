<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="innssa.dto.*"%>
<%@page import="innssa.vo.*"%>
<%@ include file="./include/head.jsp" %>
<%
String uploadPath = "D:\\EZEN\\project\\innssa04\\src\\main\\webapp\\profile_pic";

int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy()); 

String id = multi.getParameter("id");
String name = multi.getParameter("name");
String nick_name = multi.getParameter("nick_name");
String gender = multi.getParameter("gender");
String mbti = multi.getParameter("mbti");
String one_line = multi.getParameter("one_line");
String profile_picLog = multi.getFilesystemName("profile_pic");
String profile_picPhy = "";

if( name == null || nick_name == null ) {
	out.println("이름 또는 별명을 입력해주세요.");
	return;
}

if ( profile_picLog != null) {
	
	profile_picPhy = UUID.randomUUID().toString();
	
	String orgName = uploadPath + "\\" + profile_picLog;
	String newName = uploadPath + "\\" + profile_picPhy;
	
	File srcFile = new File(orgName);
	File targetFile = new File(newName);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgName + "<br>");
	out.println("바뀐 파일명 : " + newName + "<br>");
}


UserDTO dto = new UserDTO();
UserVO vo = new UserVO();
vo.setId(id);
vo.setName(name);
vo.setNick_name(nick_name);
vo.setGender(gender);
vo.setMbti(mbti);
vo.setOne_line(one_line);
vo.setProfile_pic(profile_picLog);
vo.setProfile_phy(profile_picPhy);

dto.Update(vo);

response.sendRedirect("profile.jsp?id="+ id);
%>
<style>
	#menu_profile
	{
		background-color: #085820;
		color: white;
	}
</style>
<%@ include file="./include/tail.jsp" %>