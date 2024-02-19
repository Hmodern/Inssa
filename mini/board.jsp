<%@page import="innssa.dto.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="innssa.vo.BoardVO"%>
<%@page import="innssa.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<%
String kind = request.getParameter("kind");
if (kind == null) kind = "A";
%>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<style>
	#menu_board
	{
		background-color: #085820;
		color: white;
	}
	
	#write_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	 	margin-top		: 5px;
	 	margin-right	: 5px;
	}
	
	#write
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#table_top
	{
		background-color: #085820;
		color			: white;
	}
	
	#board_table
	{
		border-collapse: collapse;
	}

	#btn_kind
	{
		background-color: #085820;
	 	width			: 135px;
	 	hieght			: 50px;
	}
	
	#btn_kind input
	{
		background-color: white;
		width			: 130px;
		height			: 50px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	

</style>
<script>
	
	var url = $(location).attr('search');

	$(document).ready(function() {
		$('#write').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		if ( url == "" ) {

			$('#kindA').css('background-color', '#085820');
			$('#kindA').css('color', 'white');
			$('#kindA').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			});
		}else {

			$('#kindA').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', 'white');
				$(this).css('color', 'black');
			});
		}
		if ( url == "?kind=B" ) {

			$('#kindB').css('background-color', '#085820');
			$('#kindB').css('color', 'white');
			$('#kindB').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			});
		}else {

			$('#kindB').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', 'white');
				$(this).css('color', 'black');
			});
		}
		if ( url == "?kind=R" ) {

			$('#kindR').css('background-color', '#085820');
			$('#kindR').css('color', 'white');
			$('#kindR').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			});
		}else {

			$('#kindR').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', 'white');
				$(this).css('color', 'black');
			});
		}
		if ( url == "?kind=L" ) {

			$('#kindL').css('background-color', '#085820');
			$('#kindL').css('color', 'white');
			$('#kindL').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			});
		}else {

			$('#kindL').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', 'white');
				$(this).css('color', 'black');
			});
		}
		if ( url == "?kind=T" ) {

			$('#kindT').css('background-color', '#085820');
			$('#kindT').css('color', 'white');
			$('#kindT').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			});
		}else {

			$('#kindT').hover(function() {
				$(this).css('background-color', '#085820');
				$(this).css('color', 'white');
			}, function() {
				$(this).css('background-color', 'white');
				$(this).css('color', 'black');
			});
		}
		
	});
	
	function goA() {

		document.location = "board.jsp?kind=A&id=<%= homeID %>";
	}
	function goB() {

		document.location = "board.jsp?kind=B&id=<%= homeID %>";
	}
	function goR() {

		document.location = "board.jsp?kind=R&id=<%= homeID %>";
	}
	function goL() {

		document.location = "board.jsp?kind=L&id=<%= homeID %>";
	}
	function goT() {

		document.location = "board.jsp?kind=T&id=<%= homeID %>";
	}
	
	
</script>
<td valign="top">
	<form method="post" action="write.jsp?id=<%= homeID %>">
		<table width="700px">
			<tr>
				<td align="left" colspan="4">
					<h2> #<%= homeVO.getNick_name() %> 님의 게시물</h2>
				</td>
				<td align="right">
				<%
				if ( loginVO != null && !loginVO.getId().equals(homeID) ) {
				%>
					&nbsp;
				<%
				} else if( loginVO == null ){
				%>
					&nbsp;
				<%
				}else {
				%>
				<div id="write_div">
					<input type="submit" id="write" value="게시물 등록">
				</div>
				<%
				}
				%>
				</td>
			</tr>
			<tr>
				<td>
					<div id="btn_kind">
						<input type="button" id="kindA" name ="kind" value="전체" onclick="goA();">
					</div>
				</td>
				<td>
					<div id="btn_kind">
						<input type="button" id="kindB" name ="kind" value="방송" onclick="goB();">
					</div>
				</td>
				<td>
					<div id="btn_kind">
						<input type="button" id="kindR" name ="kind" value="맛집" onclick="goR();">
					</div>
				</td>
				<td>
					<div id="btn_kind">
						<input type="button" id="kindL" name ="kind" value="어학" onclick="goL();">
					</div>
				</td>
				<td>
					<div id="btn_kind">
						<input type="button" id="kindT" name ="kind" value="여행" onclick="goT();">
					</div>
				</td>
			</tr>
		</table>
	</form>
	<table id="board_table" border="1" style="width:700px;" align="center">
		<tr id="table_top">
			<th align="center" width="10%" height="30px">번호</th>
			<th align="center">제목</th>
			<th align="center" width="20%">작성일</th>
			<th align="center" width="10%">조회수</th>
		</tr>
		<%
		ListDTO dto = new ListDTO();
		ArrayList<BoardVO> blist = dto.GetMyList(homeVO.getId(),kind);
		BoardDTO bdto = new BoardDTO();
		
		for (BoardVO bvo : blist ) {
			String no = bvo.getNo();
			String title = bvo.getTitle();
			String date = bvo.getWdate();
			String hit = bvo.getHit();
			bvo = bdto.Read(no, false);
			String type = bvo.getType();
			
		%>
		<tr>
			<td align="center" height="30px">
				<%= no %>
			</td>
			<td align="left">
				<a href="view.jsp?kind=<%= type %>&no=<%= no %>&id=<%= homeID %>">
				<%= title %>
				</a>
			</td>
			<td align="center">
				<%= date %>
			</td>
			<td align="center">
				<%= hit %>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<%@ include file="./include/tail.jsp" %>