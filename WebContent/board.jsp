<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.board.BoardDTO" %>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dao" class="home.board.BoardDAO"/>
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>
	<div align = "center">
		<div style="text-align:center;font-size:20pt;font-family:consolas;letter-spacing:0.2em;color:skyblue;">
			BOARD
		</div>
		<div style="margin-top:20px;display:table;width:550;font-size:9pt;font-family:����;">
			<div style="display:table-row;height:25px;">
				<div style="display:table-cell;border-bottom:1px solid gold;border-top:1px solid gold;width:40px;vertical-align:middle;">
					NO
				</div>
				<div style="display:table-cell;border-bottom:1px solid gold;border-top:1px solid gold;width:320px;vertical-align:middle;">
					TITLE
				</div>
				<div style="display:table-cell;border-bottom:1px solid gold;border-top:1px solid gold;width:60px;vertical-align:middle;">
					WRITER
				</div>
				<div style="display:table-cell;border-bottom:1px solid gold;border-top:1px solid gold;vertical-align:middle;">
					DATE
				</div>
				<div style="display:table-cell;border-bottom:1px solid gold;border-top:1px solid gold;width:50px;vertical-align:middle;">
					VIEWS
				</div>
			</div>
			<%
			int board_page = Integer.parseInt(request.getParameter("page"));//��������ȣ�� ���� �ٸ� �Խù� ���.default=1
			int max_row = dao.getMaxRow(); //dao.getMaxRow(); ----��ü ������ ���� �ҷ���.
			int max_page = (max_row%10 == 0)? (max_row / 10):(max_row / 10) + 1; // ����Ʈ�� ������ ���� ���
			
			if(max_row == 0){
				%>
				<div style="display:table-row;height:20px;">
					<div style="display:table-cell;border-bottom:1px dotted gold;width:40px;vertical-align:middle;">
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;width:320px;vertical-align:middle;">
						�Խù��� �����ϴ�
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;width:60px;vertical-align:middle;">
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;vertical-align:middle;">
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;width:50px;vertical-align:middle;">
					</div>
				</div>
				
				<%
			}else{
				ArrayList <BoardDTO> list = dao.getList(board_page, max_row);
				//Board_contents bcList[] = dao.getList10(latestNo); ----�����ؾ���.
				
				for(int i = list.size()-1 ; i >= 0; i--){
					%>
					
					<div style="display:table-row;height:20px;">
						<div style="display:table-cell;border-bottom:1px dotted gold;width:40px;vertical-align:middle;">
							<%= list.get(i).getNo() %>
						</div>
						<div style="display:table-cell;border-bottom:1px dotted gold;width:320px;vertical-align:middle;">
							<div style = "cursor:default;" onMouseOver="this.style.backgroundColor='skyblue'" onMouseOut="this.style.backgroundColor='black'" onclick="location.href='board_view.jsp?no=<%= list.get(i).getNo() %>'"><%= list.get(i).getTitle() %></div>
						</div>
						<div style="display:table-cell;border-bottom:1px dotted gold;width:60px;vertical-align:middle;">
							<%= list.get(i).getWriter() %>
						</div>
						<div style="display:table-cell;border-bottom:1px dotted gold;vertical-align:middle;">
							<%= list.get(i).getDate() %>
						</div>
						<div style="display:table-cell;border-bottom:1px dotted gold;width:50px;vertical-align:middle;">
							<%= list.get(i).getViews() %>
						</div>
					</div>
					
					<%
				}
			}
			%>
		</div>	
		<!-- �Խ��� �� �κ� ���� -->
		<div style="display:table;margin-top:10px;width:550px;">
			<div style="display:table-cell;width:33%;"></div>
			<div style="display:table-cell;font-size:9pt;">
				<%
				
				for(int i = 1; i <= max_page; i++){
					if(i != board_page){
						%>
						<a href="board.jsp?page=<%=i %>"><%=i %></a>
						<%
					}else{
						%>
						<%=i %>
						<%
					}
					if(i != max_page){
						%>
						|
						<%
					}
				}
				
				%>
			</div>
			<div style="display:table-cell;width:33%;text-align:right;">
				<input type="button" value="���۾���" style="width:50px;font-size:8pt;font-family:����;
				height:20px;padding:0;display:inline-block;background-color:black;border:1px solid gold;
				color:white;"  onclick = "location.href = 'board_insert.jsp'">
			</div>
		</div>
	</div>

<%@ include file = "bottom.jsp" %>