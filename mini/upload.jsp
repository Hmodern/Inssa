<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->	
<style>
	#pic
	{
		border: 1px solid ##085820;
	}
	
	#save
	{
		background-color: white;
		width			: 85px;
		height			: 30px;
		border			: 1px solid #085820;
		margin-right	: 5px;
	}
	
	#save_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#menu_home
	{
		background-color: #085820;
		color: white;
	}
</style>
<script>
	function goHome() {

		document.location = "home.jsp";
	}
	
	$(document).ready(function() {

		$('#save').hover(function() {

			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {

			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$("#homepic").on("change", function(e) {

			var file = e.target.files[0];
			if(isImageFile(file)) {

				var reader = new FileReader();
				reader.onload = function(e) {

					$("#uimage").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(file);
			}else {

				alert("이미지 파일만 첨부 가능합니다.");
				$("#homepic").val("");
				$("#uimage").attr("src", "");
			}
		});
	});
	
	function isImageFile(file) {

		//파일명에서 확장자를 가져온다.
		var ext = file.name.split(".").pop().toLowerCase();
		
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	
	function form_chk() {

		var file_val = $("#homepic").val();
		
		if(file_val) {

			//db에 파일 첨부 처리
			alert("이미지가 첨부되었습니다.");
		}else {

			alert("첨부된 이미지가 없습니다.");
		}
	}
</script>
<td>
	<form method="post" action="uploadok.jsp?id=<%= homeID %>" enctype="multipart/form-data">
		<table border="0" style="width:100%">
			<tr>
				<td align="center">
					<table id="pic" border="1" >
						<tr>
							<td align="center">
								<img id="uimage" name="uimage" style="width:100xp; height:100px; padding:20px;">
							</td>
						</tr>
						<tr>
							<td align="center">
								사진 등록 <br>
								<input type="file" id="homepic" name="homepic">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<br>
					<div id="save_div">
						<input id="save" type="submit" value="저장">
					</div>
				</td>
			</tr>
		</table>
	</form>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->	
<%@ include file="./include/tail.jsp" %>