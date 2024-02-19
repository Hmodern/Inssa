<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<style>
	#menu_Gbook
	{
		background-color: #085820;
		color: white;
	}
	
	#gbook_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	 	margin-top		: 5px;
	 	margin-right	: 5px;
	}
	
	#gbook
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#gbook_contents
	{
		margin-top	: 5px;
		margin-right: 5px;
	}
	
	#gbooklist table
	{
		border-top: 1px solid #085820;
	}
	
</style>
<script>
	window.onload = function() {

		LoadGbook();
	}

	$(document).ready(function() {
		
		$('#gbook').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
	});
	
	//방명록 목록을 가졍
	function LoadGbook() {

		$.ajax({
			type: "get",
			url : "gbooklist.jsp?id=<%= homeID %>",
			dataType : "html",
			success : function(data) {
				data = data.trim();
				//alert(data);
				$("#gbooklist").html(data);
			}
		});
	}
	
	function AddGbook() {
		
		if($("#gcontents").val() == "") {
			
			alert("방명록을 입력하세요.");
			$("#gcontents").focus();
			return;
		}
		
		$.ajax({
			type: "post",
			url : "gbookok.jsp?id=<%= homeID %>",
			data:
				{
					gcontents : $("#gcontents").val()
				},
			dataType : "html",
			success : function(data) {
				data = data.trim();
				//alert(data);
				$("#gcontents").val("");
				$("#gcontents").focus();
				LoadGbook();				
			}
		});
	}
</script>
<td valign="top">
	<form method="post" action="gbookok.jsp?id=<%= homeID %>">
		<table style="width:700px">
			<tr height="25px">
				<td>
					&nbsp;
				</td>
			</tr>
			<%
			if( loginVO != null && !loginVO.getId().equals(homeID) ) {
			%>
			<tr>
				<td align="center" style="width:20%">
				<b><%= loginVO.getNick_name() %></b>
				</td>
				<td  valign="top" style="width:70%">
					<textarea id="gcontents" name="gcontents" rows="5" cols="75" placeholder="방명록을 남겨보세요!"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					
				</td>
				<td colspan="2" align="right">
					<div id="gbook_div">
						<input type="button" id="gbook" name="gbook" value="방명록 등록" onclick="AddGbook();">
					</div>
				</td>
			</tr>
			<tr height="25px">
				<td>
					&nbsp;
				</td>
			</tr>
			<%
			}else {
				%>
				<tr>
					<td>
						방명록
					</td>
				</tr>
				<%
			}
			%>
		</table>
		<table>
			<tr>
				<td>
					<div style="height:490px; width:690px; overflow:auto; align:center">
						<table style="width:100%" id="gbooklist">
							<!-- 방명록 목록이 나오는 영역 -->
						</table>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<%@ include file="./include/tail.jsp" %>