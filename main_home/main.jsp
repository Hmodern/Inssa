<%@page import="innssa.dto.ListDTO"%>
<%@page import="innssa.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="innssa.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<%
String kind = request.getParameter("kind");
if (kind == null) kind = "A";
%>
<!-------------------------------------------------------- 컨텐츠 출력되는곳 --------------------------------------------------------------->
<script>

</script>
<table width="1200px" align="center">
	<tr>
		<td align="center">
			<div width="1200px" text-align="center" style="background-color:#FFFFFF; border-radius:1em;
			 border:1px solid #085820;">
				<table align="center" id="board_table" width="1000px">
					<tr>	
						<td colspan="5" height="40px"><h3>HOT TOPIC</h3></td>
					</tr>
					<%
					ListDTO dto = new ListDTO();
					ArrayList<BoardVO> list = dto.GetMainList(kind);
					BoardDTO bdto = new BoardDTO();
					for ( BoardVO vo : list ) {
						String id = vo.getId();
						String no = vo.getNo();
						String nick = vo.getNick_name();
						String title = vo.getTitle();
						String contents = vo.getContents();
						String wdate = vo.getWdate();
						String hit = vo.getHit();
						String rcount = vo.getRcount();
						vo = bdto.Read(no, false);
						String type = vo.getType();
						String likey = vo.getLikey();
						String pic_phyname = vo.getPic_phyname();
						
					%>
					<tr>
						<td>
							<table id="board">
								<tr>
									<th rowspan="3" width="100px"> <%= no %></th>
									<th>작성자 : </th>
									<td id="user_name" width="550px" height="40px">
										<a href="../mini/home.jsp?id=<%= id %>"
										onclick="window.open(this.href, '<%= nick %>의 미니홈피', 'width=1200, height=1000'); return false;">
											<b>
												<i>#<%= nick %></i>
											</b>
										</a>
									</td>	
									<td rowspan="4">
										<a href="../mini/view.jsp?id=<%= id %>&kind=<%= type %>&no=<%= no %>" 
										onclick="window.open(this.href, '<%= nick %>의 미니홈피', 'width=1200, height=1000'); return false;">
										
											<img src="../upload/<%= pic_phyname %>" width="200px" height="200px">
										</a>
									</td>			
								</tr>
								<tr>
									<th>제목 : </th>
									<td height="40px" id="board_title">
										<a href="../mini/view.jsp?id=<%= id %>&kind=<%= type %>&no=<%= no %>" 
										onclick="window.open(this.href, '<%= nick %>의 미니홈피', 'width=1200, height=1000'); return false;">
											<h3><%= title %></h3>
										</a>
									</td>
								</tr>
								<tr>
									<td colspan="2" width="1000px" height="20px" align="right">
										조회수 : <%= hit %>&nbsp;&nbsp;&nbsp;
										<a href="../mini/view.jsp?id=<%= id %>&kind=<%= type %>&no=<%= no %>"
										onclick="window.open(this.href, '<%= nick %>의 미니홈피', 'width=1200, height=1000'); return false;">
											<img src="./img/reply.gif" width="38px" height="35px">(<%= rcount %>+)
										</a>&nbsp;&nbsp;&nbsp;
											<input type="image" src="./img/love.gif" width="28px" height="28px">(<%= likey %>)&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</table>
							<br>
						</td>
					</tr>
						<%
					}
						%>
				</table>
				<!--  랭킹 DIV/TABLE-------------------------------------------------------------------- -->
				<!--  랭킹 DIV/TABLE-------------------------------------------------------------------- -->
				<table width="1200px" align="center">
					<tr>
						<td colspan="2">
							<img id="high_five" src="./img/high_five.gif" width="100px" height="100px" align="center">
						</td>
					</tr>
					<tr>
						<td width="600px" align="center">
							<div id="ranking_table_div">
								<table id="ranking_table" style="text-align:center;">
									<tr>
										<td colspan="3"><h2>미니홈피 랭킹</h2></td>
									</tr>
									<tr height="60px">
										<td height="60px" align="center">순위</td>
										<td align="center">닉네임</td>
										<td align="center">팔로워수</td>
									</tr>				
									 <tr>
										<td height="50px"><img src="./img/crown.gif" width="40px" height="40px"></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>45215</td>
									</tr>
									<tr>
										<td colspan="3"><hr width="500px"></hr></td>
									</tr> 
									<tr>
										<td height="50px">2</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">3</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">4</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">5</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">6</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">7</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">8</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">9</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
									<tr height="1px">
										<td colspan="3"><hr width="500px"></hr></td>
									</tr>				
									<tr>
										<td height="50px">10</td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>32151</td>
									</tr>
								</table>
							</div>
						</td>
						<!--  조회수 DIV/TABLE--------------------------------------------------------------------
						 조회수 DIV/TABLE--------------------------------------------------------------------	 -->
					 	<td width="600px" align="center">
							<div id="view_table_div">
								<table id="view_table" border="0" style="text-align:center;">
									<tr>
										<td colspan="4"><h2>조회수 랭킹</h2></td>
									</tr>
									<tr> 
										<td height="60px" align="center">순위</td>
										<td align="center">제목</td>
										<td align="center">닉네임</td>
										<td>조회수</td>
									</tr>
									<tr>
										<td height="50px"><img src="./img/crown.gif" width="40px" height="40px"></td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>999</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">2</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>899</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">3</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>799</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">4</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>699</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">5</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>599</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">6</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>499</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">7</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>399</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">8</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>299</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">9</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>199</td>
									</tr>
									<tr>
										<td colspan="4"><hr width="500px"></hr></td>
									</tr>
									<tr>
										<td height="50px">10</td>
										<td><a href="view.jsp" style="color:#000000">제목</a></td>
										<td><a onclick="miniHome()" style="color:#000000">닉네임</a></td>
										<td>99</td>
									</tr>
								</table>
							</div>  <!-- ranking_div -->
						</td>
					</tr>
				</table>	
			</div>  <!-- board_div -->
		</td>
	</tr>
</table>

<!-------------------------------------------------------- 컨텐츠 출력되는곳 --------------------------------------------------------------->

<%@ include file="./include/tail.jsp" %>	