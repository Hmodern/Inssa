<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<%
String kind = request.getParameter("kind");

if ( kind == null ) kind = "B";
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
	}
	
	#btn_write
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

	
	function DoWrite() {
		
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
		if(confirm("게시물을 등록 하시겠습니까?") == 0) {
			
			return false;
		}
		return true;
	}

	$(document).ready(function() {
		$("#title").focus();
		$('#btn_write').hover(function() {
	
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
	<form method="post" action="writeok.jsp?id=<%= homeID %>" enctype="multipart/form-data" onsubmit="return DoWrite();">
	<table width="700px">
		<tr>
			<td colspan="2">
			
				<table border="0" width="100%">
					<tr>
						<td width="20%" align="left">
							<h2>
								#<%= homeVO.getNick_name() %>
							</h2>
						</td>
						<td width="60%" align="center" >
							<input type="text" id="title" name="title" style="font-size:30px; text-align:center">
						</td>
						<td align="center">
							<div id="write_div">
								<input type="submit" id="btn_write" value="게시물 등록" >
							</div>
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr>
			<td width="500px" id="rnqns" align="center">
			구분 : &nbsp;
				<input type="radio" id="type" name="type" value="B" 
				<%= kind.equals("B") ? "checked" : "" %>>방송
				<input type="radio" id="type" name="type" value="R" 
				<%= kind.equals("R") ? "checked" : "" %>>맛집
				<input type="radio" id="type" name="type" value="L" 
				<%= kind.equals("L") ? "checked" : "" %>>어학
				<input type="radio" id="type" name="type" value="T" 
				<%= kind.equals("T") ? "checked" : "" %>>여행
			</td>
			<td width="400px" align="right" id="rnqns2">
				첨부파일 :
				<input type="file" id="attach" name="attach">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<img id="wimage" style="width:300px; height:200px;">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="2">
				사진 등록 :
				<input type="file" id="pic_attach" name="pic_attach">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<textarea id="contents" name="contents"  rows="20" cols="80"></textarea>
			</td>
		</tr>
	</table>
	</form>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->	
<%@ include file="./include/tail.jsp" %>