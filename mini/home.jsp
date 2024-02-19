<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@page import="innssa.vo.GbookIllchonVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="innssa.dto.GbookIllchonDTO"%>
<%@ include file="./include/head.jsp" %>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<style>
	#menu_home
	{
		background-color: #085820;
		color: white;
	}
	
	#illchon
	{
		border: 1px solid #085820;
		width : 100%;
	}
	
	#illchon table
	{
		border-top : 1px solid #085820;
		border-bottom : 1px solid #085820;
	}
	
	#send_div
	{
		background-color: #085820;
	 	width			: 105px;
	 	hieght			: 45px;
	}
	#send
	{
		background-color: white;
		width			: 100px;
		height			: 40px;
		border			: 1px solid #085820;
	
	}
	
	#upload_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#upload
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	
</style>
<script>
	$(document).ready(function() {

		LoadIllChon();

		$('#send').hover(function() {

			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {

			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$('#upload').hover(function() {

			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {

			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
	});
	
	
	//일촌평 목록을 가져온다.
	function LoadIllChon()
	{
		
		$.ajax({
			type: "get",
			url : "illchon.jsp?id=<%= homeID %>",
			dataType : "html",
			success : function(data) {
				data = data.trim();
				//alert(data);
				$("#illchon").html(data);
			}
		});		
	}
	
	function AddIllchon() {
		
		if($("#icontents").val() == "") {
			
			alert("일촌평을 입력하세요.");
			$("#icontents").focus();
			return;
		}
		
		$.ajax({
			type: "post",
			url : "illchonok.jsp?id=<%= homeID %>",
			data:
				{
					icontents : $("#icontents").val()
				},
			dataType : "html",
			success : function(data) {
				data = data.trim();
				//alert(data);
				$("#icontents").val("");
				$("#icontents").focus();
				LoadIllChon();				
			}
		});
	}
	
	//사진 삭제
	function DeletePic(pno)
	{
		if(confirm("해당 사진을 삭제하시겠습니까?") == false)
		{
			return;	
		}	
		$.ajax({
			type : "get",
			url: "delpic.jsp?pno=" + pno + "&id=<%= homeID %>",
			dataType : "html",	
			success : function(data) 
			{
				data = data.trim();
				alert(data);
				document.location = "home.jsp?id=<%= homeID %>";
			}				
		});	
		

	}
</script>
<td style="width:70%" valign="top">	
		<table border="0" style="width:700px">
			<tr>
				<td width="700px">
					<form method="post" action="upload.jsp?id=<%= homeID %>">
						<table width="100%">
							<tr>
								<td colspan="4" align="right">
								<%
								if( loginVO != null && loginVO.getId().equals(homeID)) {
								%>
									<div id="upload_div">
										<input type="submit" id="upload" value="사진 업로드">
										<!-- <a href="upload.jsp">사진 업로드</a> -->
									</div>
								<%
								}else {
								%>
								
								<%
								}
								%>
								</td>
							</tr>
							<tr>
								<%
								ListDTO hpdto = new ListDTO();
								ArrayList<HomePicVO> hplist = hpdto.GetHomePic(homeID);
								for( HomePicVO hpvo : hplist ) {
									String plogname = hpvo.getHpic_logname();
									String pphyname = hpvo.getHpic_phyname();
								%>
								<td align="center" valign="top">
									<img src="../home_pic/<%= pphyname %>" style="width:100px; height:100px; padding:15px;" >
									<%
									if( loginVO != null && loginVO.getId().equals(homeID) ) {
									%>
									<br>
									<a href="javascript:DeletePic(<%= hpvo.getPno() %>)">삭제</a>
									<%
									}else {
									%>
									
									<%
									}
									%>
								</td>
								<%
								}
								%>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td style="height:100px">
				</td>
			</tr>
			<tr>
				<td>
					<%
					if( loginVO != null && !loginVO.getId().equals(homeID) ) {
					%>
					<form method="post" action="illchonok.jsp?id=<%= homeID %>" onsubmit="return false;">
						<table width="100%">
							<tr>
								<td width="90%">
									<input id="icontents" name="icontents" type="text" style="width:98%; height:40px;"
									placeholder="일촌평을 남겨보세요!">
								</td>
								<td>
									<div id="send_div">
										<input type="button" id="send" name="send" value="등록" onclick="AddIllchon();">
									</div>
								</td>
							</tr>
						</table>
					</form>
					<%
					}else {
					%>
					일촌평
					<%
					}
					%>
				</td>
			</tr>
			<tr>
				<td valign="bottom">
					<div style="height:330px; width:690px;overflow:auto;" align="center">
						<table style="width:100%" id="illchon" >
						<!--  일촌평 목록이 나오는 영역 -->				
						</table>
					</div>
				</td>
			</tr>
		</table>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<%@ include file="./include/tail.jsp" %>	