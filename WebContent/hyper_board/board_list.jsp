<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ include file="../subMenu.jsp" %>
	<!-- 게시판 리스트 구현! -->
<%@ page import="java.util.ArrayList, home.board.BoardDTO, java.text.SimpleDateFormat, java.util.Date" %>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
	<%
	request.setCharacterEncoding("EUC-KR");
	int page_no = Integer.parseInt(request.getParameter("page"));
	%>
	<div align="center" style="width:100%; height:450;overflow:auto;
	scrollbar-face-color:black;scrollbar-highlight-color:white;scrollbar-track-color:black;">
		<div style="font-size:20pt;font-family:consolas;color:skyblue;letter-spacing:0.2em;margin-top:8%;">
			BOARD
		</div>
		<div style="display:table;width:90%;margin-top:15px;">
			<div style="display:table-row;height:30px;">
				<div style="display:table-cell;width:10%;vertical-align:middle;border-top:2px solid white;border-bottom:2px solid white;font-size:10pt;font-family:consolas;color:lightgray;">
					NO
				</div>
				<div style="display:table-cell;vertical-align:middle;border-top:2px solid white;border-bottom:2px solid white;font-size:10pt;font-family:consolas;color:lightgray;">
					TITLE
				</div>
				<div style="display:table-cell;width:10%;vertical-align:middle;border-top:2px solid white;border-bottom:2px solid white;font-size:10pt;font-family:consolas;color:lightgray;">
					WRITER
				</div>
				<div style="display:table-cell;width:10%;vertical-align:middle;border-top:2px solid white;border-bottom:2px solid white;font-size:10pt;font-family:consolas;color:lightgray;">
					DATE
				</div>
				<div style="display:table-cell;width:10%;vertical-align:middle;border-top:2px solid white;border-bottom:2px solid white;font-size:10pt;font-family:consolas;color:lightgray;">
					VIEWS
				</div>
			</div>
			<%
			
			ArrayList <BoardDTO> list = dao.getList(page_no);
			int countRow = dao.getCount();
			int maxPage = (countRow%10==0)? countRow/10:countRow/10+1;
			System.out.println(maxPage);
			
			if(countRow == 0){
				%>
				<div style="display:table-row;height:25px;">
					<div style="display:table-cell;width:10%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
					</div>
					<div style="display:table-cell;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
						게시글이 없습니다. 새글을 작성해주세요.
					</div>
					<div style="display:table-cell;width:10%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
					</div>
					<div style="display:table-cell;width:10%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
					</div>
					<div style="display:table-cell;width:10%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
					</div>
				</div>
				<%
			}else{
				SimpleDateFormat origin_form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat new_form = new SimpleDateFormat("MM/dd HH:mm");
				for(int i = 0; i < list.size(); i++){
					%>
					<div style="display:table-row;height:25px;">
						<div style="display:table-cell;width:10%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
							<%= list.get(i).getNo() %>
						</div>
						<div style="display:table-cell;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
							<%
							//로그인 확인 하이퍼링크
							if(id==null || id.trim().equals("")){
								%>
								<%= list.get(i).getTitle() %>
								<%
							}else{
								%>
								<div onmouseover="this.style.color='white'" onmouseout="this.style.color='gray'"style="cursor:default" onclick="location.href='board_view.jsp?no=<%= list.get(i).getNo() %>'"><%= list.get(i).getTitle() %></div>
								<% 
							}
							%>
						</div>
						<div style="display:table-cell;width:10%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
							<%= list.get(i).getWriter() %>
						</div>
						<div style="display:table-cell;width:20%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
							<%= new_form.format(origin_form.parse(list.get(i).getDate())) %>
						</div>
						<div style="display:table-cell;width:5%;vertical-align:middle;border-top:1px solid lightgray;border-bottom:1px solid lightgray;font-size:9pt;font-family:돋움;color:gray;">
							<%= list.get(i).getViews() %>
						</div>
					</div>
					<%
				}
				
			}
			%>
		</div>
		<div style="display:table;margin-top:15px;width:90%">
			<div style="display:table-row">
				<div style="display:table-cell;width:33%">
				</div>
				<div style="display:table-cell;font-size:9pt;font-family:돋움;color:white">
					<%
					for(int i = 1; i <= maxPage; i++){
						if(i==page_no){
							%>
							<%= i %>
							<%
						}else{
							%>
							<a href="board_list.jsp?page=<%= i %>">
							<%= i %>
							</a>
							<%
						}
						if(!(i == maxPage)){
							%> | <%
						}
					}
					%>
				</div>
				<div style="display:table-cell;width:33%;text-align:right;">
					<input type="button" value="새글쓰기" onclick="location.href='board_insert.jsp?index=0&level=0'"
					style="font-size:9pt;font-family:돋움;background-color:black;border:1px solid white;color:lightgray;
					vertical-align:middle;">
				</div>
			</div>
		</div>
	</div>
<%@ include file="../bottom.jsp" %>