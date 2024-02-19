<%@page import="java.util.ArrayList"%>
<%@page import="innssa.vo.ReplyVO"%>
<%@page import="innssa.dto.ReplyDTO"%>
<%@page import="innssa.dto.BoardDTO"%>
<%@page import="innssa.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<%
String kind = request.getParameter("kind");
String no = request.getParameter("no");
if( kind == null ) kind = "B";

if( no == null ) {
	
	response.sendRedirect("board.jsp?id=" + homeID);
	return;
}

BoardDTO dto = new BoardDTO();
BoardVO vo = dto.Read(no, true);
if (vo == null) {
	
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("게시물 번호를 조회 할 수 없습니다.");
		document.location = "board.jsp?id=<%= homeID %>";
	</script>
	
	
	<%
}

%>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->	
<style>
	#menu_board
	{
		background-color: #085820;
		color: white;
	}
	
	#btn_update_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#btn_update
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#btn_delete_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#btn_delete
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#btn_likey_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#btn_likey
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#r_write_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#r_write
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#reply_table_top
	{
		border-top: 1px solid #085820;
		border-bottom: 1px solid #085820;
	}
	
	#reply_table
	{
		border-bottom: 1px solid #085820;
	}
</style>
<script>
	
	
	function DoDelete()
	{
		if( confirm("해당 게시물을 삭제 하시겠습니까?") == 0)
		{
			return;	
		}
	}
	
	$(document).ready(function() {
		
		$('#btn_update').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$('#btn_delete').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$('#r_write').hover(function() {
			
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$('#btn_likey').hover(function() {
			
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
	});

	
	
	//댓글 등록
	function AddReply()
	{
		if( $("#rcontents").val() == "" )
		{
			alert("댓글을 입력하세요.");
			$("#rcontents").focus();
			return;
		}
		
		$.ajax({
			type : "post",
			url: "addreply.jsp?id=<%= homeID %>",
			data :
			{
				no : "<%= no %>",
				rcontents : $("#rcontents").val()
			},		
			dataType : "html",	
			success : function(data) 
			{
				data = data.trim();
				alert(data);
				document.location = "view.jsp?no=<%= no %>&id=<%= homeID %>";
			}				
		});		
	}
	
	
	//댓글삭제
	function DeleteReply(rno)
	{
		if(confirm("해당 댓글을 삭제하시겠습니까?") == false)
		{
			return;	
		}	
		$.ajax({
			type : "get",
			url: "delreply.jsp?rno=" + rno+ "&id=<%= homeID %>",
			dataType : "html",	
			success : function(data) 
			{
				data = data.trim();
				alert(data);
				document.location = "view.jsp?no=<%= no %>&id=<%= homeID %>";
			}				
		});	
		

	}
</script>
<td valign="top">
	<table width="700px">
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td width="20%" align="left">
							<h2>#<%= vo.getNick_name() %></h2>
						</td>
						<td width="60%" align="center" >
							<h1><%= vo.getTitle() %></h1>
						</td>
						<%
						if( loginVO != null && loginVO.getId().equals(homeID) ) {
						%>
						<td align="center">
							<form method="post" action="update.jsp?id=<%= homeID %>&no=<%= no %>" >
								<div id="btn_update_div">
									<input type="submit" id="btn_update" value="수정" >
								</div>
							</form>
							<br>
							<form method="post" action="delete.jsp?id=<%= homeID %>&no=<%= no %>&kind=<%= kind %>">
								<div id="btn_delete_div">
									<input type="submit" id="btn_delete" value="삭제" onclick="return DoDelete();">
								</div>
							</form>
						</td>
						<%
						}
						%>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="100%" align="right">
				첨부파일 : <a href="down.jsp"><%= vo.getLogname() %></a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table width="90%">
					<tr>
						<td align="center">
							<img src="../upload/<%= vo.getPic_phyname() %>" style="width:300px; height:200px">
						</td>
					</tr>
					<tr>
						<td align="right" height="50px">
						   
						</td>
					</tr>
					<tr>
						<td align="left" width="500px">
							<%= vo.getContents() %>
						</td>
						<%
						if( loginVO != null && !loginVO.getId().equals(homeID) ) {
						%>
						<td width="100px" align="right">
							<form method="post" action="blikey.jsp?id=<%= homeID %>&no=<%= no %>&kind=<%= vo.getType() %>">
							<%
						  	if ( blvo == null ) {
						  	%>
								<input type="image" src="./image/heart.jpg" id="b_heart">
							<%
						  	} else {
							%>
								<input type="image" src="./image/heartcheck.png" id="b_heart">
							<%
						  	}
							%>
							</form>
						</td>
						<td>
							<%= vo.getLikey() %>
						</td>
						<%
						}else {
						%>
						<td>
							좋아요 수 :<%= vo.getLikey() %>
						</td>
						<%
						}
						%>
						
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td>
				<table id="reply_table_top" width="100%">
					<tr>
					<%
					if ( loginVO != null && !loginVO.getId().equals(homeID)) {
					%>
						<td width="10%">#<%= loginVO.getNick_name() %> </td>
						<td>
							<input type="text" id="rcontents" name="rcontents" size="60" placeholder="댓글을 작성해주세요.">
						</td>
						<td width="10%" align="center">
							<div id="r_write_div">
								<input type="button" id="r_write" value="댓글 등록" onclick="AddReply();">
							</div>
						</td>
					<%
					}else if( loginVO == null ) {
					%>
						<td>
							로그인이 필요합니다.
						</td>
						<td>
						</td>
					<%
					}else {
					%>
						<th>
							댓글
						</th>
						<td>
						</td>
					<%
					}
					%>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<div style="height:200px; width:690px;overflow:auto;" align="center">
					<table id="reply_table" width="100%">
						<%
						ReplyDTO rdto = new ReplyDTO();
						ArrayList<ReplyVO> rlist = rdto.GetList(no);
						
						for( ReplyVO rvo : rlist ) {
							%>
										<tr>
											<td width="10%"><%= rvo.getNick() %></td>
											<td>
												<%= rvo.getRcontents() %>
											</td>
											<td align="right">
												<a href="javascript:DeleteReply(<%= rvo.getRno() %>)">삭제</a>
											</td>
											<td width="15%" align="right"><%= rvo.getRdate() %></td>
										</tr>
							<%
						}
						%>
					</table>
				</div>
			</td>
		</tr>	
	</table>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->	
<%@ include file="./include/tail.jsp" %>