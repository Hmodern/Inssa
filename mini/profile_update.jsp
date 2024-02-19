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
	
	#updateok_div
	{
		background-color: #085820;
	 	width			: 90px;
	 	hieght			: 35px;
	}
	
	#updateok
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
</style>
<script>
	$(document).ready(function() {
		
		$('#updateok').hover(function() {
	
			$(this).css("background-color", "#085820");
			$(this).css("color", "white");
		},function() {
	
			$(this).css("background-color", "white");
			$(this).css("color", "black");
		});
		
		$("#profile_pic").on("change", function(e) {

			var file = e.target.files[0];
			if(isImageFile(file)) {

				var reader = new FileReader();
				reader.onload = function(e) {

					$("#pimage").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(file);
			}else {

				alert("이미지 파일만 첨부 가능합니다.");
				$("#profile_pic").val("");
				$("#pimage").attr("src", "");
			}
		});
	});
	
	function isImageFile(file) {

		//파일명에서 확장자를 가져온다.
		var ext = file.name.split(".").pop().toLowerCase();
		
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	
	function form_chk() {

		var file_val = $("#profile_pic").val();
		
		if(file_val) {

			//db에 파일 첨부 처리
			alert("이미지가 첨부되었습니다.");
		}else {

			alert("첨부된 이미지가 없습니다.");
		}
	}
</script>
<td valign="top">
	<form method="post" action="profile_updateok.jsp?id=<%= homeID %>" enctype="multipart/form-data">
		<table style="width: 600px;" align="center">
			<tr>
				<td rowspan="2" style="width: 20%">
					<img src="../profile_pic/<%= loginVO.getProfile_phy() %>" 
					id="pimage" name="pimage" style="width: 200px; height: 250px" value="프로필사진">
				</td>
				<td valign="top">
					<b>
						이름 :
					</b>
				</td>
				<td valign="top">
					<input type="text" id="name" name="name" size="8"
					 value="<%= loginVO.getName() %>">
				</td>
				<td valign="top">
					<b>
						별명 :
					</b>
				</td>
				<td valign="top"><input type="text" id="nick_name" name="nick_name" size="8" 
				 value="<%= loginVO.getNick_name() %>">
				</td>
			</tr>
			<tr>
				<td valign="top">
					<b>
						성별 :
					</b>
				</td>
				<td valign="top"><select id="gender" name="gender">
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select></td>
				<td valign="top">
					<b>
						MBTI :
					</b>
				</td>
				<td valign="top">
					<input type="text" id="mbti" name="mbti" size="8"
					value="<%= loginVO.getMbti() %>">
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" id="profile_pic" name="profile_pic" value="사진 업로드">
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<b>
						한줄소개 : 
					</b>
				</td>
			</tr>
			<tr>
				<td colspan="5"><textarea id="one_line" name="one_line" rows="6" cols="90"><%= loginVO.getOne_line() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<div id="updateok_div">
						<input type="submit" id="updateok" value="수정하기">
					</div>
				</td>
			</tr>
		</table>
	</form>
</td>
<!---------------------------- 컨텐츠 출력되는곳 ----------------------------->
<%@ include file="./include/tail.jsp" %>