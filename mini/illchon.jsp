<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="innssa.vo.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="innssa.dto.GbookIllchonDTO"%>
<%
String id  = request.getParameter("id");
GbookIllchonDTO idto = new GbookIllchonDTO();
ArrayList<GbookIllchonVO> ilist = idto.GetList("I", id );
for( GbookIllchonVO ivo : ilist) {
	String iWriter_id = ivo.getGiwriter_id();
	String inick = ivo.getGinick();
	String icontents = ivo.getGicontents();
	String idate = ivo.getGidate();
%>
	
		<tr>
			<td>
				<table style="width:100%">
					<tr>
						<td rowspan="2" style="width:20%; text-align:center" >
							<a href="../mini/home.jsp?id=<%= iWriter_id %>"
							onclick="window.open(this.href, '<%= inick %>의 미니홈피', 'width=1200, height=1000'); return false;">
								<%= inick %>
							</a>
						</td>
						<td style="width:60%">
							<%= icontents %>
						</td>
						<td>
							<%= idate %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
<%
}
%>
