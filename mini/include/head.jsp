<%@page import="java.util.ArrayList"%>
<%@page import="innssa.vo.*" %>
<%@page import="innssa.dto.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
UserVO loginVO = (UserVO)session.getAttribute("login");
String homeID  = request.getParameter("id");


if(homeID == null)
{
	%>
	<script>
		alert("미니홈피 소유주를 알수 없습니다.");
		window.close();
	</script>
	<%
	return;
}
UserDTO homeDTO = new UserDTO();
UserVO homeVO   = homeDTO.GetUser(homeID);
if(homeVO == null)
{
	%>
	<script>
		alert("미니홈피 소유주를 알수 없습니다.");
		window.close();
	</script>
	<%
	return;
}

FollowerDTO fdto = new FollowerDTO();
FollowerVO fvo = null;
if( loginVO != null)
{
	fvo = fdto.FRead(homeID, loginVO.getId());
}

LikeyDTO ldto = new LikeyDTO();
LikeyVO plvo = null;
if ( loginVO != null )
{
	plvo = ldto.PLRead(homeID, loginVO.getId());
}
LikeyVO blvo = null;
if ( loginVO != null )
{
	blvo = ldto.BLRead(homeID, loginVO.getId());
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title><%= homeVO.getNick_name() %>의 미니홈피</title>
		<script src="../jquery-3.7.1.js"></script>
	</head>
	<body style="background-color: #C0D693;">
	<style>
		#back
		{
			width			: 1020px;
			height			: 820px;
			background-color: #085820;
			position        : absolute;
			
		}
		
		#total_table
		{
			position		: relative;
		    background-color: #FFFFFF;
		    margin-left		: 10px;
		    margin-top		: 10px;
		    border			: 1px solid #085820; 
		}
		
		
		
		#menu_home, #menu_profile, #menu_Gbook, #menu_board
		{
			background-color: white;
			width			: 100px;
			height			: 40px;
			border			: 1px solid #085820;
		}
		
		#menu_div
		{
		 	background-color: #085820;
		 	width			: 105px;
		 	hieght			: 45px;
		}
		
		#profile_table
		{
			border			: 1px solid #085820;
			border-collapse	: collapse;
		}
		
		#pic
		{
			border: 1px solid #085820;
		}
		
	</style>
		<script>
		function menuHome() {

			document.location = "home.jsp?id=<%= homeID %>";
		}
		function menuProfile() {

			document.location = "profile.jsp?id=<%= homeID %>";
		}
		function menuGBook() {

			document.location = "gbook.jsp?id=<%= homeID %>";
		}
		function menuBoard() {

			document.location = "board.jsp?kind=A&id=<%= homeID %>";
		}
		
		/* function getUrl() {

			var url = $(location).attr('pathname');
			alert(url);
		} */
		
		$(document).ready(function() {
			var url = $(location).attr('pathname');
			if(url == "/innssa04/mini/home.jsp"
			|| url == "/innssa04/mini/upload.jsp") {
				$('#menu_home').hover(function() {
						$(this).css('background-color', '#085820');
					}, function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					});
				}else {

					$('#menu_home').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', 'white');
						$(this).css('color', 'black');
					});
			}
			if(url == "/innssa04/mini/profile.jsp" 
			|| url == "/innssa04/mini/profile_update.jsp"
			|| url == "/innssa04/mini/profile_updateok.jsp") {
				$('#menu_profile').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					});
				}else {

					$('#menu_profile').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', 'white');
						$(this).css('color', 'black');
					});
			}
			if(url == "/innssa04/mini/gbook.jsp") {
				$('#menu_Gbook').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					});
				}else {

					$('#menu_Gbook').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', 'white');
						$(this).css('color', 'black');
					});
			}
			if(url == "/innssa04/mini/board.jsp"
			|| url == "/innssa04/mini/write.jsp"
			|| url == "/innssa04/mini/writeok.jsp"
			|| url == "/innssa04/mini/update.jsp"
			|| url == "/innssa04/mini/updateok.jsp"
			|| url == "/innssa04/mini/view.jsp") {
				$('#menu_board').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					});
				}else {

					$('#menu_board').hover(function() {
						$(this).css('background-color', '#085820');
						$(this).css('color', 'white');
					}, function() {
						$(this).css('background-color', 'white');
						$(this).css('color', 'black');
					});
			}
		});
		
		
		</script>
		<div id="back">
			<table border="1" style="width:1000px; height:800px;" id="total_table">
				<tr>
					<td height="100px" width="150px">
					</td>
					<td colspan="2" width="850px">
						<table style="width:100%; text-align:left;">
							<tr>
								<td>
									<h1 id="url"><%= homeVO.getNick_name() %>'s mini hompage</h1>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="width:20%" valign="top">
						
							<table border="1" id="profile_table" align="center">
								<tr>
									<td colspan="2" align="center">
										<img  id="profile" name="profile" src="../profile_pic/<%= homeVO.getProfile_phy() %>" style="width:150px; height:150px;">
									</td>
								</tr>
								<tr>
									<td colspan="2" id="nick_name" style="width:100%; text-align:center;">
									<%= homeVO.getNick_name() %>
									</td>
								</tr>
								<tr>
								<%
								if( loginVO != null && !loginVO.getId().equals(homeID) ){
								%>
									<td align="center" width="50%">
										<form method="post" action="follower.jsp?id=<%= homeID %>&follower_id=<%= loginVO.getId() %>">
										<%
										if ( fvo == null ) {
										%>
											<input type="image" src="./image/friend_plus.jpg" id="friend"
											 style="width:25px; height:25px;">
									  	<%
										}else {
									  	%>
									  		<input type="image" src="./image/follow.png" id="friend"
											 style="width:25px; height:25px;">
									  	<%
										}
									  	%>
								  		</form>
								  	</td>
								  	<td align="center">
									  	<form method="post" action="plikey.jsp?id=<%= homeID %>">
									  	<%
									  	if ( plvo == null ) {
									  	%>
											<input type="image" src="./image/heart.jpg" id="heart"
											 style="width:25px; height:25px;" >
										<%
									  	} else {
										%>
											<input type="image" src="./image/heartcheck.png" id="heart"
											 style="width:25px; height:25px;" >
										<%
									  	}
										%>
										</form>
									</td>
								<%
								}else if( loginVO == null ) {
								%>
									<td align="center" width="100%">
										로그인 해주세요.
									</td>
								<%
								}else {
								%>
									<td>
										팔로워 : <%= homeVO.getFollower() %>
									</td>
									<td>
										좋아요 : <%= homeVO.getLikey() %>
									</td>
								<%
								}
								%>
								</tr>
								<tr>
									<td colspan="2" style="width:100%; height:170px;" valign="top"><%= homeVO.getOne_line() %></td>
								</tr>
								<tr>
									<td colspan="2">
										<select id="f_wave" name="f_wave" style="width:100%">
											<option value="my">--------
											<option value="freind1">freind1
											<option value="freind2">freind2
											<option value="freind3">freind3
											<option value="freind4">freind4
										</select>
									</td>
								</tr>
							</table>
						
					</td>