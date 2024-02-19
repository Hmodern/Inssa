<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="innssa.dto.*"%>
<%@page import="innssa.vo.*"%>
<%@ include file="./include/head.jsp" %>
<style>
#menu_board
{
	background-color: #085820;
	color: white;
}
</style>
<%

String uploadPath = "D:\\EZEN\\project\\innssa04\\src\\main\\webapp\\upload";

int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy()); 

String no = multi.getParameter("no");
String title = multi.getParameter("title");
String type = multi.getParameter("type");
String contents = multi.getParameter("contents");
String logname = (String)multi.getFilesystemName("attach");
String pic_logname = (String)multi.getFilesystemName("pic_attach");
String phyname = "";
String pic_phyname = "";

if( title == null || contents == null ) {
	out.println("제목 또는 내용을 입력해주세요.");
	return;
}

if ( logname != null) {
	
	phyname = UUID.randomUUID().toString();
	
	String orgName = uploadPath + "\\" + logname;
	String newName = uploadPath + "\\" + phyname;
	
	File srcFile = new File(orgName);
	File targetFile = new File(newName);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgName + "<br>");
	out.println("바뀐 파일명 : " + newName + "<br>");
}

if ( pic_logname != null) {
	
	pic_phyname = UUID.randomUUID().toString();
	
	String pic_orgName = uploadPath + "\\" + pic_logname;
	String pic_newName = uploadPath + "\\" + pic_phyname;
	
	File srcFile = new File(pic_orgName);
	File targetFile = new File(pic_newName);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + pic_orgName + "<br>");
	out.println("바뀐 파일명 : " + pic_newName + "<br>");
}

BoardVO vo = new BoardVO();
vo.setNo(no);
vo.setId(loginVO.getId());
vo.setTitle(title);
vo.setType(type);
vo.setContents(contents);

if( logname != null ) {
	
	vo.setLogname(logname);
	vo.setPhyname(phyname);
}

if( pic_logname != null ) {
	
	vo.setPic_logname(pic_logname);
	vo.setPic_phyname(pic_phyname);
}

BoardDTO dto = new BoardDTO();
dto.Update(vo);

response.sendRedirect("view.jsp?id="+ homeID + "&no=" + no );
%>
<%@ include file="./include/tail.jsp" %>