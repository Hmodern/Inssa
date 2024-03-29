<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
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
		  width			: 400px;
		  padding		: 40px;
		  transform		: translate(-50%, -50%);
		  background	: rgba(0,0,0,.5);
		  box-sizing	: border-box;
		  box-shadow	: 0 15px 25px rgba(0,0,0,.6);
		  border-radius	: 10px;
		  height		: 360px;
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
		  top			:0;
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
		  font-size			: 16px;
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
	
	#btn_login
	{
					width				:100px;
					height 				:40px;
				    font-size			: 17px;
				    font-weight			: 600;
				    color				: black;
				    cursor				: pointer;
				    margin				: 15px;
				    text-align			: center;
				    border				: none;
				    background-size		: 300% 100%;
				    border-radius		: 10px;
				    transition			: all .4s ease-in-out;
				    position			: fixed;
				    top					: 270px;
				    left				: 5%;
	}
	
	</style>
	<body>
	<script>
		window.onload = function() {
			$("#id").focus();
			
			$("#id").val("jimin"); 
			$("#pw").val("5010");
			
		}
		function DoLogin() {
			
			id = $("#id").val();
			pw = $("#pw").val();
		
			if( id == "" ) {
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			}
			
			if( pw == "" ) {
				alert("비밀번호를 입력해주세요");
				$("#pw").focus();
				return false;
			}
			
			
			return true;
		}
		

	</script>
		<div class="login-box">
		  <h2>Login</h2>
		  <form method="post" action="loginok.jsp?kind=A" onsubmit="return DoLogin();">
		    <div class="user-box">
		      <input type="text" id="id" name="id" required>
		     	 <label>ID</label>
		    </div>
		    <div class="user-box">
		      <input type="password" id="pw" name="pw" required>
		      <label>Password</label>
		    </div>
		      <span></span>
		      <span></span>
		      <span></span>
		      <span></span>
		      <input id="btn_login" type="submit" value="login">
		    <a href="join.jsp"  style="
			     	 position		: fixed;
		    		 top			: 245px;
				 	 left			: 70%;">join</a>
		  </form>
		</div>
	</body>
</html>