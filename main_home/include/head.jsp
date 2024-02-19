<%@page import="innssa.vo.*"%>
<%@page import="innssa.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserVO loginVO = (UserVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>INNSSA_</title>
	</head>
	<script src="../jquery-3.7.1.js"></script>
	<body>
	<style>
		/* 메인 사진 3개----------------------------------------------------- */
	
	#poto1:hover img 
	{
	    -webkit-filter		: blur(3px);
	    filter				: blur(3px);
	}

	
		#poto2:hover img 
		{
		    -webkit-filter		: blur(3px);
		    filter				: blur(3px);
		}
		
		
		#poto3:hover img 
		{
		    -webkit-filter		: blur(3px);
		    filter				: blur(3px);
		}
		

		
		/* ranking table----------------------------------------------------- */
	/* 	#ranking_table
		{
		    width		: 500px;
		    position	: absolute;
		    top			: 1800PX;
		    right		: 8%;
		} */
		
		/* views table----------------------------------------------------- */
		/* #views_table
		{
			width		: 500px;
		    position	: absolute;
		    top			: 1800px;
		    right		: 50%;
		} */
		
		/* profile----------------------------------------------------- */
		#profile_div
		{
			width			: 250px;
			height			: 457px;
		    position		: fixed;
		    background-color: #FFFFFF;
	        top				: 40%;
	        right			: 6px;
	        transition		: top 0.5s;
	        border			: 1px;
	        border-radius	: 2em;
	        border			: 5px;
	        padding			: 10px;
		    
		}
		#profile_table
		{
			width		: 240px;
		    position	: absolute;
		    top			: 20px;
			margin: 0 auto;
		}
		
		/*프로필 사진 크기----------------------------------------------------- ------*/
			#profile_img
			 {
			    
			    border-radius	: 15%;
			    overflow		: hidden;
			    top				: 41%;
			    
			    
			}
			.profile 
			{
			    width		: 100%;
			    height		: 100%;
			    object-fit	: cover;
			    
			}			
		
		/* 미니홈피로 가는 버튼 -------------------------------------------------------- */
		#my_home_button 
		{
		    width				: 220px;
		    font-size			: 17px;
		    font-weight			: 600;
		    color				: #fff;
		    cursor				: pointer;
		    margin				: 15px;
		    height				: 60px;
		    text-align			: center;
		    border				: none;
		    background-size		: 300% 100%;
		    border-radius		: 20px;
		    transition			: all .4s ease-in-out;
		    
		}
		
		
		#my_home_button:focus 
		{
		    outline	: none;
		}
		
		#my_home_button
		{
    		background-image: linear-gradient(to right, #085820, #C8EFD4, #085820,#085820);
		}
		
	
		/*----------------------------------------------------- ------*/
		
		/* 검색창 ----------------------------------------------------- */
		@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
		
		.button:hover
		{
			position		: relative;
		    border			: none;
		    display			: inline-block;
	   		padding			: 15px 30px;
		    border-radius	: 20px;
		    font-family		: "paybooc-Light", sans-serif;
		    box-shadow		: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration	: none;
		    font-weight		: 600;
		    background-color: #FFFFFF;
		    color			: #6D12FF;
		}
		
		.button
		{
			position		: relative;
		    border			: none;
		    display			: inline-block;
		    padding			: 15px 30px;
		    border-radius	: 25px;
		    font-family		: "paybooc-Light", sans-serif;
	    box-shadow			: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration	: none;
		    font-weight		: 600;
		    background-color: #FFFFFF;
		    color			: #000000;
		}
		
		#search
		 {
			  width				: 500px;
			  height			: 32px;
			  font-size			: 15px;
			  border			: 0;
			  border-radius		: 15px;
			  outline			: none;
			  padding-left		: 10px;
			  background-color	: #FFFFFF;
		 }
		 
		/* 로고 영역  -------------------------------------------------- */
		 	 h1 
			{
			  height				: 100px;
			  width					: 100%;  
			  -webkit-font-smoothing: antialiased;
			  display				: flex;
			  justify-content		: center;
			  align-items			: center;
			}

			h1 span
			 {
			  position		: relative;
			  top			: 20px;
		 	  display		: inline-block;
			  animation		: bounce .3s ease infinite alternate;
			  font-family	: 'Titan One', cursive;
			  font-size		: 50px;
			  color			: #FFFFFF;
		 	 text-shadow	:  0 1px 0 #CCC,
				               0 2px 0 #CCC,
				               0 3px 0 #CCC,
				               0 4px 0 #CCC,
				               0 5px 0 #CCC,
				               0 6px 0 transparent,
				               0 7px 0 transparent,
				               0 8px 0 transparent,
				               0 9px 0 transparent,
				               0 10px 10px rgba(0, 0, 0, .4);
			}
			
			h1 span:nth-child(2) { animation-delay: .1s; }
			h1 span:nth-child(3) { animation-delay: .2s; }
			h1 span:nth-child(4) { animation-delay: .3s; }
			h1 span:nth-child(5) { animation-delay: .4s; }
			h1 span:nth-child(6) { animation-delay: .5s; }
			h1 span:nth-child(7) { animation-delay: .6s; }
			h1 span:nth-child(8) { animation-delay: .7s; }
			
			@keyframes bounce 
			{
			  100% 
			  {
			    top: -20px;
			    text-shadow: 0 1px 0 #CCC,
			                 0 2px 0 #CCC,
			                 0 3px 0 #CCC,
			                 0 4px 0 #CCC,
			                 0 5px 0 #CCC,
			                 0 6px 0 #CCC,
			                 0 7px 0 #CCC,
			                 0 8px 0 #CCC,
			                 0 9px 0 #CCC,
			                 0 50px 25px rgba(0, 0, 0, .2);
			  }
			}
			
			
				
	/* --------------------------------------------------------------------------------------------------------------*/		
				
		@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap');
	
		#Neon button1, #Neon button2, #Neon button3, #Neon button4, #Neon button5
		{
			display				: flex;
		    justify-content		: center;
		    align-items			: center;
		    height				: 50vh;
		    background			: #FFFFFF;
		    font-family			: 'Raleway', sans-serif;
		    font-weight			: bold;	
		    align				:center;
		    position			: relative;
		}	 
	    		
	    	
	    	#button_menu
	    	{
			    position		: relative;
			    display			: inline-block;
			    padding			: 25px 30px;
			    margin			: 40px 0;
			    color			: #FFFFFF;
			    text-decoration	: none;
			    text-transform	: uppercase;
			    transition		: 0.5s;
			    letter-spacing	: 4px;
			    overflow		: hidden;
			    margin-right	:50px;
			    border-radius	: 2em;
			    width			: 100%; /* 100%로 설정하여 부모의 너비에 맞춤 */
   				box-sizing		: border-box; 
			   
			}
			#button_menu:nth-child(1)
			{
			    filter: hue-rotate(270deg);
			}
			#button_menu:nth-child(2)
			{
			    filter: hue-rotate(110deg);
			}
			a span
			{
			    position	: absolute;
			    display		: block;
			}	
				    @keyframes animate3
				    {
			    0%
			    {
			        right: -100%;
			    }
			    50%,100%
			    {
			        right: 100%;
			    }
			}



		a span:nth-child(1)	/* 메뉴 테두리 */
		{
		    top			: 0;
		    left		: 0;
		    width		: 100%;
		    height		: 2px;
		    background	: #FFFFFF;
		    animation	: animate1 1s linear infinite;
		}
		@keyframes animate1
		{
		    0%{
		        left: -100%;
		    }
		    50%,100%{
		        left: 100%;
		    }
		}
		a span:nth-child(2)  /* 메뉴 테두리 */
		{
		    top				: -100%;
		    right			: 0;
		    width			: 2px;
		    height			: 100%;
		    background		: #FFFFFF;
		    animation		: animate2 1s linear infinite;
		    animation-delay	: 0.25s;
		}
		@keyframes animate2	
		{
		    0%{
		        top: -100%;
		    }
		    50%,100%{
		        top: 100%;
		    }
		}
		a span:nth-child(3)	/* 메뉴 테두리 */
		{
		    bottom			: 0;
		    right			: 0;
		    width			: 100%;
		    height			: 2px;
		    background		: #FFFFFF;
		    animation		: animate3 1s linear infinite;
		    animation-delay	: 0.50s;
		}
		a span:nth-child(4) 	/* 메뉴 테두리 */
		{
		    bottom			: -100%;
		    left			: 0;
		    width			: 2px;
		    height			: 100%;
		    background		: #FFFFFF;
		    animation		: animate4 1s linear infinite;
		    animation-delay	: 0.75s;
		}
		@keyframes animate4
		{
		    0%
		    {
		        bottom: -100%;
		    }
		    50%,100%
		    {
		        bottom: 100%;
		    }
		}		
		
		
		/*  게시물 ... 처리 ---------------------------------------------- */
		#board_text    	
		{
			  width: 200px;
			  overflow      :hidden;	/* overflow:hidden : 넓이가 200px를 넒어서는 내용에 대해서는 보이지 않게 처리함 */
		      text-overflow :ellipsis;	/* text-overflow:ellipsis : 글자가 넓이 70px를 넘을 경우 생략부호를 표시함 */
		      white-space   :nowrap;	/* white-space:nowrap : 공백문자가 있는 경우 줄바꿈하지 않고 한줄로 나오게 처리함 (\A로 줄바꿈가능) */
		}
		
		/*  a 태그 밑줄 없애기 ---------------------------------------------- */
		a {  text-decoration: none; }
		
		/* a 태그 색깔 변경 ------------------------------------------------*/
		#user_name > a { color: #000000;}
		
		/*  닉네임 효과 ---------------------------------------------- */
		@import url(https://fonts.googleapis.com/css?family=Lato:400,300,700,900);
		
		
		#user_name{font-family: Lato !important;}
		#user_name a 
		{
			  color: #000000;
			  font-family: Lato;
			  font-size: 17pt;
			  font-weight: 400;
			  padding: 15px 25px;
			  /**/
			  position: relative;
			  display: block;
			  text-decoration: none;
			  text-transform: uppercase;
		}
		#user_name a:after 
		{
			  position: absolute;
			  top: 100%;
			  left: 0;
			  width: 100px;
			  height: 1px;
			  background: #000000;
			  content: '';
			  opacity: 0;
			  -webkit-transition: height 0.3s, opacity 0.3s, -webkit-transform 0.3s;
			  -moz-transition: height 0.3s, opacity 0.3s, -moz-transform 0.3s;
			  transition: height 0.3s, opacity 0.3s, transform 0.3s;
			  -webkit-transform: translateY(-10px);
			  -moz-transform: translateY(-10px);
			  transform: translateY(-10px);
			}
			
			#user_name a:hover:after, #user_name a:focus:after {
			  height: 5px;
			  opacity: 1;
			  -webkit-transform: translateY(0px);
			  -moz-transform: translateY(0px);
			  transform: translateY(0px);
			}
			
			#board_title > a { color: #000000;}
			
			
			/* ------------------------------------------------- */
			#ranking_table_div
			{
				width           : 550px;
				height          : 881px;
				background-color: #085820;
				border-radius	: 2em;
			}
			#ranking_table
			{
			    background-color: #FFFFFF;
			    border-radius	: 2em;
			    width 			: 530px;
			    height			: 881px; 
			}
			/* ------------------------------------------------- */
			#view_table_div
			{
				width           : 550px;
				height          : 881px;
				background-color: #085820;
				border-radius	: 2em;
			}
			#view_table
			{
			    width 		: 530px;
			    background-color: #FFFFFF;
			    border-radius	: 2em;
			}
			
			#high_five
			{
			    top			: 1670px;
			    lift		: 100%;
			    right		: 10px;
			    width 		: 180px;
			    
			}
			
			#end_div
			{
				position		 : relative;
			    top				 : 2800px;
			    left			 : 27%;
			    width 			 : 1000px;
			    background-color : #C0D693;
			    text-align 		 : center;
			}
			
			/* ------------------------------------------------------- */
			
		/* 	#main_home
			{
				position		 : relative;
			    top				 : 1000px;
			    left			 : 100%;
			    width			 : 100px;
			} */
			
			#reply_div
		{
				width			: 1000px;
				position		: relative;
			    top				: 125px;
			    left			: 110px;
		}
		
		#login_div
		{
			width			: 250px;
			height			: 407px;
		    position		: fixed;
		    background-color: #FFFFFF;
	        top				: 40%;
	        right			: 6px;
	        transition		: top 0.5s;
	        border			: 1px;
	        border-radius	: 2em;
	        border			: 5px;
	        padding			: 10px;
		}
		
		#board {
		
			border: 1px solid #085820;
		}
		
		</style>
		
<!--    ===========================================================================================================
		===========================================================================================================
		===========================================================================================================
		=========================================================================================================== -->
		
	<body style="background-color: #C0D693;">
	<script>
		function myHome() {
			<%
			if(loginVO != null)
			{
				%>
				window.open("../mini/home.jsp?id=<%= loginVO.getId() %>", "<%= loginVO.getNick_name() %>의 미니홈피","width=1200, height=1000");
				<%
			}else
			{
				%>alert("로그인하세요.");<%
			}
			%>
			return;
		}
		
		function DoLogin() {

			document.location = "login.jsp";
		}
		
		function DoJoin() {

			document.location = "join.jsp";
		}
	</script>
	<%
		if ( loginVO == null ) {
			%>
			<div id="login_div">
				<table align="center" height="400px">
					<tr>
						<td valign="bottom">
							<input id="my_home_button" type="button" value="로그인" onclick="DoLogin()">
						</td>
					</tr>
					<tr>
						<td valign="top">
							<input id="my_home_button" type="button" value="회원가입" onclick="DoJoin()">
						</td>
					</tr>
				</table>
			</div>
			<%
		}else {
	%>
	<form method="get" action="main.jsp" onsubmit="return myHome();">
		<div id="profile_div">
			<table id="profile_table">
				<tr>
					<td height="220px" colspan="2" align="center">
						<div class="box" style="background: white;" >
						   	<img src="../profile_pic/<%= loginVO.getProfile_phy() %>" id="profile_img" style="width: 240px; height: 220px;" >
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						[<%= loginVO.getNick_name() %>님 환영합니다!]
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="logout.jsp?kind=A">로그아웃</a>
					</td>
				</tr>
				<tr>
					<td align="left" width="80px" style="text-align:center" height="22px"><i>Follower</i></td>
					<td><%= loginVO.getFollower() %>+</td>
				</tr>
				<tr>
					<td align="left" style="text-align:center" height="22px"><i>post</i><br></td>
					<td><%= loginVO.getBcount() %>+</td>
				</tr>
				<tr>
					<td height="60px" colspan="2">
						<input id="my_home_button" type="submit" value="mY HoME">
					</td>
				</tr>
			</table>
		</div>
	</form>
		<%
		}
		%>
		
			<table width="1200px" height="200px" align="center">
				<tr>
					<td width="10%"></td>	
					<td>
						<h1 onClick="location.href='/innssa04/main_home/main.jsp?kind=A'">
							<span>I</span>
							<span>N</span>
							<span>N</span>
							<span>S</span>
							<span>S</span>
							<span>A</span>
							<span>A</span>
							<span>!</span>
							<span>!</span>
						</h1>
					</td>
					<tr>
						<td>
						</td>
						<td width="1200px" align="center"><input id="search" type="text" value="">
							<a href="search.jsp">
								<button class="button" type="button">
							        search
							    </button>
						    </a>
						</td>
					</tr>	
			</table>
			<br>
			<table width="1200px" align="center">
				<tr>	
					<td id="Neon button1" align="center">
						<a id="button_menu" href="main.jsp?kind=A">
					        <span></span>
					        <span></span>
					        <span></span>
					        <span></span>
					    &nbsp;전체
					    </a></td>
					<td id="Neon button2" align="center">
						<a id="button_menu" href="main.jsp?kind=B">
					        <span></span>
					        <span></span>
					        <span></span>
					        <span></span>
					    &nbsp;방송
					    </a>
					</td>
					<td id="Neon button3" align="center">
						<a  id="button_menu" href="main.jsp?kind=R">
					        <span></span>
					        <span></span>
					        <span></span>
					        <span></span>
					    &nbsp;맛집
					    </a>
					</td>
					<td id="Neon button4" align="center">
						<a id="button_menu" href="main.jsp?kind=L">
					        <span></span>
					        <span></span>
					        <span></span>
					        <span></span>
					    &nbsp;어학
					    </a>
					</td>
					<td id="Neon button5" align="center">
						<a id="button_menu" href="main.jsp?kind=T">
					        <span></span>
					        <span></span>
					        <span></span>
					        <span></span>
					    &nbsp;여행
					    </a>				
					</td>
				</tr>	
			</table>
			
		<!-- 컨텐츠 출력 라인  --------------------------------------------------------------------------------------------- -->