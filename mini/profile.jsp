<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<style>
	#menu_profile
	{
		background-color: #085820;
		color: white;
	}
	
	#profile_update_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	 	margin-top		: 5px;
	 	margin-right	: 5px;
	}
	
	#profile_update
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	b
	{
		border-bottom: 1px solid #085820;
	}
	
	#one_line
	{
		border: 1px solid #085820;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	
		$('#profile_update').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
	});
	
</script>
<td valign="top">
	<form method="post" action="profile_update.jsp?id=<%= homeID %>">
		<table style="width: 700px">
			<tr height="50px">
				<td align="right" colspan="5" valign="top">
				<%
				if ( loginVO != null && loginVO.getId().equals(homeID) ){
				%>
					<div id="profile_update_div">
						<input type="submit" id="profile_update" value="수정하기">
					</div>
				<%
				}else{
				%>
					
				<%
				}
				%>
				</td>
			</tr>
			<tr>
				<td rowspan="2" style="width: 20%"><img src="../profile_pic/<%= homeVO.getProfile_phy() %>"
					style="width: 200px; height: 250px"></td>
				<td id="profile_col" valign="top" width="20%">
					<b>
						이름 :
					</b>
				</td>
				<td id="profile_col" valign="top" align="left" width="20%">
					<b>
						<%= homeVO.getName() %>
					</b>
				</td>
				<td id="profile_col" valign="top" width="20%">
					<b>
						별명 :
					</b>
				</td>
				<td id="profile_col" valign="top" align="left" width="20%">
					<b>
						<%= homeVO.getNick_name() %>
					</b>
				</td>
			</tr>
			<tr>
				<td id="profile_col" valign="top">
					<b>
						성별 :
					</b>
				</td>
				<td id="profile_col" valign="top" align="left">
					<b>
						<%= homeVO.getGender() %>
					</b>
				</td>
				<td id="profile_col" valign="top">
					<b>
						MBTI :
					</b>
				</td>
				<td id="profile_col" valign="top" align="left">
					<b>
						<%= homeVO.getMbti() %>
					</b>
				</td>
			</tr>
			<tr>
				<td colspan="5" valign="top" align="left">
					<b>
						한줄소개
					</b>
				</td>
			</tr>
			<tr>
				<td id="one_line" colspan="5" valign="top" align="left" height="300px">
					<b>
						<%= homeVO.getOne_line() %>
					</b>
				</td>
			</tr>
		</table>
	</form>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<%@ include file="./include/tail.jsp" %>
