<%@page import="innssa.vo.BoardVO"%>
<%@page import="innssa.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<%
String no = request.getParameter("no");

if ( loginVO == null || no == null || no.equals("") ) {
	
	response.sendRedirect("board.jsp?kind=A&id=" + homeID);
	return;
}

BoardDTO dto = new BoardDTO();
BoardVO vo = dto.Read(no, false);

if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "board.jsp?kind=A&id=<%= homeID %>";
	</script>
	<%
	return;
}

if( !loginVO.getId().equals(vo.getId()) )
{
	response.sendRedirect("board.jsp?kind=A&id=" + homeID);
	return;	
}
%>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<style>
	#menu_board
	{
		background-color: #085820;
		color: white;
	}

	#b_update_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#b_update
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#rnqns
	{
		border-top : 1px solid #085820;
		border-bottom : 1px solid #085820;
		border-right : 1px solid #085820;
	}
	
	#rnqns2
	{
		border-top : 1px solid #085820;
		border-bottom : 1px solid #085820;
		border-left : 1px solid #085820;
	}
	
</style>
<script>
function DoUpdate() {
	
	title = $("#title").val();
	if( title == "" ) {
		
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}
	
	contents = $("#contents").val();
	if( contents == "" ) {
		
		alert("내용을 입력하세요.");
		$("#contents").focus();
		return false;
	}
	if(confirm("게시물을 수정 하시겠습니까?") == 0) {
		
		return false;
	}
	return true;
}
	
	$(document).ready(function() {
		
		$('#b_update').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$("#pic_attach").on("change", function(e) {

			var file = e.target.files[0];
			if(isImageFile(file)) {

				var reader = new FileReader();
				reader.onload = function(e) {

					$("#wimage").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(file);
			}else {

				alert("이미지 파일만 첨부 가능합니다.");
				$("#pic_attach").val("");
				$("#wimage").attr("src", "");
			}
		});
	});
	
	//업로드 파일 이미지 파일인지 확인
	function isImageFile(file) {

		//파일명에서 확장자를 가져온다.
		var ext = file.name.split(".").pop().toLowerCase();
		
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	
	function form_chk() {

		var file_val = $("#pic_attach").val();
		
		if(file_val) {

			//db에 파일 첨부 처리
			alert("이미지가 첨부되었습니다.");
		}else {

			alert("첨부된 이미지가 없습니다.");
		}
	}
</script>
<td valign="top">
	<form method="post" action="updateok.jsp?id=<%= homeID %>&no=<%= no %>" enctype="multipart/form-data" onsubmit="return DoUpdate();">
		<table width="700px">
			<tr>
				<td colspan="2">
						<table border="0" width="100%">
							<tr>
								<td width="20%" align="left">
									<h2>#<%= vo.getNick_name() %></h2>
								</td>
								<td width="60%" align="center" >
									<input id="title" name="title" type="text" value="<%= vo.getTitle() %>" style="font-size:30px; text-align:center">
								</td>
								<td align="center">
									<div id="b_update_div">
										<input type="submit" id="b_update" value="게시물 수정">
									</div>
								</td>
							</tr>
						</table>
				</td>
			</tr>
			<tr>
				<td width="350px" id="rnqns" align="center">
				구분 : &nbsp;
					<input type="radio" id="type" name="type" value="B" 
					<%= vo.getType().equals("B") ? "checked" : "" %>>방송
					<input type="radio" id="type" name="type" value="R" 
					<%= vo.getType().equals("R") ? "checked" : "" %>>맛집
					<input type="radio" id="type" name="type" value="L" 
					<%= vo.getType().equals("L") ? "checked" : "" %>>어학
					<input type="radio" id="type" name="type" value="T" 
					<%= vo.getType().equals("T") ? "checked" : "" %>>여행
				</td>
				
				<td width="350px"align="right" id="rnqns2">
					첨부파일 :
					<input type="file">
				</td>
			</tr>
			<tr>
				<td>
				<%
				if( vo.getLogname() != null && !vo.getLogname().equals("")) {
				%>
					<a href="down.jsp?no=<%= no %>"><%= vo.getLogname() %></a>
				<%
				}else {
				%>
					등록된 첨부파일이 없습니다.
				<%
				}
				%>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img  id="wimage" src="../upload/<%= vo.getPic_phyname() %>" style="width:300px; height:200px;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					사진 등록 :
					<input type="file" id="pic_attach" name="pic_attach">
				</td>
			</tr>
			<tr>
				<td>
					<%
					if( vo.getPic_logname() != null && !vo.getPic_logname().equals("")) {
					%>
						<a href="down.jsp?no=<%= no %>"><%= vo.getPic_logname() %></a>
					<%
					}else {
					%>
						등록된 첨부파일이 없습니다.
					<%
					}
					%>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" width="600px">
					<textarea id="contents" name="contents" rows="14" cols="82"><%= vo.getContents() %></textarea>
				</td>
			</tr>
		</table>
	</form>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<%@ include file="./include/tail.jsp" %>