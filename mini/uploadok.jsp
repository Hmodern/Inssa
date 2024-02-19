<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="innssa.dto.*"%>
<%@page import="innssa.vo.*"%>
<style>
#menu_home
{
	background-color: #085820;
	color: white;
}
</style>
<%

String uploadPath = "D:\\EZEN\\project\\innssa04\\src\\main\\webapp\\home_pic";

int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy()); 

String id = multi.getParameter("id");
String pic_logname = multi.getFilesystemName("homepic");
String pic_phyname = "";
out.println(pic_logname);




if ( pic_logname != null) {
	
	pic_phyname = UUID.randomUUID().toString();
	
	String orgName = uploadPath + "\\" + pic_logname;
	String newName = uploadPath + "\\" + pic_phyname;
	
	File srcFile = new File(orgName);
	File targetFile = new File(newName);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgName + "<br>");
	out.println("바뀐 파일명 : " + newName + "<br>");
}



HomePicVO vo = new HomePicVO();
vo.setId(id);
vo.setHpic_logname(pic_logname);
vo.setHpic_phyname(pic_phyname);



HomePicDTO dto = new HomePicDTO();
dto.picInsert(vo);

response.sendRedirect("home.jsp?id="+ id);
%>