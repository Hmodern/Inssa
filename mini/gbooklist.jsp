<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@page import="innssa.vo.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="innssa.dto.GbookIllchonDTO"%>
<%
String id  = request.getParameter("id");
GbookIllchonDTO gdto = new GbookIllchonDTO();
ArrayList<GbookIllchonVO> glist = gdto.GetList("G", id);
for ( GbookIllchonVO gvo : glist ) {
	
	String gwriter_id = gvo.getGiwriter_id();
	String gnick = gvo.getGinick();
	String gcontents = gvo.getGicontents();
	String gdate = gvo.getGidate();
	
%>
<tr>
	<td>
		<table style="width:100%; height:50px;">
			<tr>
				<td align="center" style="width:20%">
					<a href="../mini/home.jsp?id=<%= gwriter_id %>"
					onclick="window.open(this.href, '<%= gnick %>의 미니홈피', 'width=1200, height=1000'); return false;">
						<%= gnick %>
					</a>
				</td>
				<td rowspan="2" valign="middle" style="width:60%">
					<%= gcontents %>
				</td>
				<td>
					<%= gdate %>
				</td>
			</tr>
		</table>
	</td>
</tr>
<%
}
%>