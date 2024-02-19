<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join</title>
	<script src="../jquery-3.7.1.js"></script>	
	</head>
	<style>
	html 
	 {
			  height : 100%;
	}
	body
	 {
		  margin		:0;
		  padding		:0;
		  font-family	: sans-serif;
		  background	: linear-gradient(#465D16, #E9F1D8);
	}
	
	.login-box 
	{
		  position		: absolute;
		  top			: 50%;
		  left			: 50%;
		  width			: 500px;
		  padding		: 40px;
		  transform		: translate(-50%, -50%);
		  background	: rgba(0,0,0,.5);
		  box-sizing	: border-box;
		  box-shadow	: 0 15px 25px rgba(0,0,0,.6);
		  border-radius	: 10px;
		  height		: 820px;
	}
	
	.login-box h2 
	{
		  margin		: 0 0 30px;
		  padding		: 0;
		  color			: #fff;
		  text-align	: center;
	}
	
	.login-box .user-box 	
	{
	  	position: relative;
	}
	
	.login-box .user-box input 
	{
		  width			: 100%;
		  padding		: 10px 0;
		  font-size		: 16px;
		  color			: #fff;
		  margin-bottom	: 30px;
		  border		: none;
		  border-bottom	: 1px solid #fff;
		  outline		: none;
		  background	: transparent;
	}
	.login-box .user-box label 
	{
		  position		: absolute;
		  top			: 0;
		  left			: 0;
		  padding		: 10px 0;
		  font-size		: 16px;
		  color			: #fff;
		  pointer-events: none;
		  transition	: .5s;
	}
	
	.login-box .user-box input:focus ~ label,
	.login-box .user-box input:valid ~ label 
	{
		  top		: -20px;
		  left		: 0;
		  color		: #03e9f4;
		  font-size	: 12px;
	}
	
	.login-box form a 
	{
		  position			: relative;
		  display			: inline-block;
		  padding			: 10px 20px;
		  color				: #FFFFFF;
		  font-size			: 13px;
		  text-decoration	: none;
		  text-transform	: uppercase;
		  overflow			: hidden;
		  transition		: .5s;
		  margin-top		: 40px;
		  letter-spacing	: 4px
	}
	
	.login-box a:hover 
	{
		  background		: #465D16;
		  color				: #fff;
		  border-radius		: 5px;
		  box-shadow		: 0 0 5px #D4E4B4,
				              0 0 25px #D4E4B4,
				              0 0 50px #D4E4B4,
				              0 0 100px #D4E4B4;
	}
	
	.login-box a span 
	{
		  position			: absolute;
		  display			: block;
	}
	
	.login-box a span:nth-child(1) 
	{
		  top			: 0;
		  left			: -100%;
		  width			: 100%;
		  height		: 2px;
		  background	: linear-gradient(90deg, transparent, #C0D693);
		  animation		: btn-anim1 1s linear infinite;
	}
	
	@keyframes btn-anim1
	 {
	  0% 		{ left		: -100%;}
	  50%,100%  {  left		: 100%; }
	}
	
	.login-box a span:nth-child(2)
	 {
		  top				: -100%;
		  right				: 0;
		  width				: 2px;
		  height			: 100%;
		  background		: linear-gradient(180deg, transparent, #C0D693);
		  animation			: btn-anim2 1s linear infinite;
		  animation-delay	: .25s
	}
	
	@keyframes btn-anim2 
	{
	  0% 		{   top: -100%;	}
	  
	  50%,100%  {   top: 100%;  }
	}
	
	.login-box a span:nth-child(3) 
	{
		  bottom			: 0;
		  right				: -100%;
		  width				: 100%;
		  height			: 2px;
		  background		: linear-gradient(270deg, transparent, #C0D693);
		  animation			: btn-anim3 1s linear infinite;
		  animation-delay	: .5s
	}
	
	@keyframes btn-anim3 
	{
	  0%	   {  right: -100%; }
	  50%,100% {  right: 100%; }
	}
	
	.login-box a span:nth-child(4) 
	{
		  bottom			: -100%;
		  left				: 0;
		  width				: 2px;
		  height			: 100%;
		  background		: linear-gradient(360deg, transparent, #C0D693);
		  animation			: btn-anim4 1s linear infinite;
		  animation-delay	: .75s
	}
	
	@keyframes btn-anim4 
	{
	  0% 		{ bottom: -100%;}
	  50%,100%  { bottom: 100%; }
	}
	
	
	#join_button
	{
		width				:100px;
		height 				:40px;
	    font-size			: 17px;
	    font-weight			: 600;
	    color				: #BFBFBF;
	    cursor				: pointer;
	    margin				: 15px;
	    text-align			: center;
	    border				: none;
	    background-size		: 300% 100%;
	    border-radius		: 10px;
	    transition			: all .4s ease-in-out;
	}
	
	</style>
	<body>
		<script>
			window.onload = function() {
				
				$("#id").focus();
			}
			
			function DoJoin() {
				
				id = $("#id").val();
				
				if(id == "") {
					
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return;
				}
				
				if($("#pw").val() == "") {
					
					alert("비밀번호를 입력해주세요.")
					$("#pw").focus();
					return;
				}
				
				if($("#pw").val() != $("#pwcheck").val()) {
					
					alert("비밀번호가 일치하는지 확인해주십시오.")
					$("#pw").focus();
					return;
				}
				
				if($("#name").val() == "") {
					
					alert("이름을 입력해주세요");
					$("#name").focus();
					return;
				}
				
				if($("#nick_name").val() == "") {
					
					alert("닉네임을 입력해주세요");
					$("#nick_name").focus();
					return;
				}
				
				if($("#mbti").val() == "") {
					
					alert("mbti를 입력해주세요");
					$("#mbti").focus();
					return;
				}
				
				id = $("#id").val();
				$.ajax({
					type 	 : "get",
					url  	 : "idcheck.jsp?id=" + id,
					dataType : "html",
					success : function(data) {
						data = data.trim();
						//alert(data);
						
						if( data == "002" ) {
							if(confirm("회원 가입을 진행하시겠습니까?") == 1) {
								//회원가입 진행
								$("#joinForm").submit();
								alert("회원가입이 완료되었습니다.");
								document.location = "login.jsp";
							}
						}else if( data == "003") {

							alert("중복된 아이디입니다.");
							document.location = "join.jsp";
						}else if ( date == "001") {
							
							alert("아이디를 입력하세요.");
							document.location = "join.jsp";
							return;
						}
					
						
					},
					error : function(xhr, status, error) {
						//통신 오류 발생시 이 함수를 타게 된다.ㅍㄴㄴ
						//alert("통신 오류");
					},
					complete : function(data) {
						
						//통신이 성공하거나 실패했어도 이 함수를 타게된다.
						//alert("처리가 완료됨.")
					}
				});
				return;
			}
		</script>
		<div class="login-box">
		  <h2>회원 가입</h2>
		  <form id="joinForm" method="post" action="joinok.jsp">
		  	<h4 style="color:#FFFFFF">*로그인 정보*</h4>
		    <div class="user-box">
		      <input id="id" name="id" type="text" name="id" required>
		     	 <label>아이디</label>
		    </div>
		    <div class="user-box">
		      <input id="pw" type="password" name="pw" required>
		      <label>비밀번호</label>
		    </div>
		    <div class="user-box">
		      <input id="pwcheck" type="password" name="pwcheck" required>
		      <label>비밀번호 확인</label>
		    </div>
		    
		  	<h4 style="color:#FFFFFF">*회원 정보*</h4>
		    <div class="user-box">
		      <input id="name" type="text" name="name" required>
		     	 <label>이름</label>
		    </div>
		    <div class="user-box">
		      <input id="nick_name" type="text" name="nick_name" required>
		     	 <label>닉네임</label>
		    </div>
		    <div class="user-box">
		      <input id="mbti" type="text" name="mbti" required>
		     	 <label>MBTI</label>
		    </div>
		     <div class="user-box">
		    <span style="color:white;">성별</span>
		      <select id="gender" name="gender">
		      	<option value="M">남자</option>
		      	<option value="F">여자</option>
		      </select>
		    </div>
		    
		    
		      <span></span>
		      <span></span>
		      <span></span>
		      <span></span>
		     <input id="join_button" type="button" value="Join"
			     style="
			     	 position		: fixed;
		    		 top			: 730px;
				 	 left			: 71%;
				 	 
			     "
			     onclick="DoJoin();"
		     >
		     <a href="main.jsp" style="
		    	 position		: fixed;
		    	 top			: 720px;
				 left			: 5%;
		     ">메인으로 돌아가기</a>
		     
		    
		    
		  </form>
		</div>
	</body>
</html>