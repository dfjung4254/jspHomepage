<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			int max_page = 2; //dao.getMaxPage(); ----��ü ������ ���� �ҷ���.
			int latestNo = 12; //dato.getLatestPage(board_page); ---board_page ���� 10���� ���� �� �ֱ��� ���������� �Խ��ؾ���.�� �ֱ��� ��ȣ�� DB���� �ҷ��;���.
			if(board_page == 1){
				latestNo = 12;
			}else if(board_page == 2){
				latestNo -= 10;
			}
			//Board_contents bcList[] = dao.getList10(latestNo); ----�����ؾ���.
			for(int i = latestNo; i > latestNo-10 && i > 0; i--){
				%>
				
				<div style="display:table-row;height:20px;">
					<div style="display:table-cell;border-bottom:1px dotted gold;width:40px;vertical-align:middle;">
						<%= (i) %>
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;width:320px;vertical-align:middle;">
						�ƾƾƾƾƾ������̴�<%= i %>
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;width:60px;vertical-align:middle;">
						����ȭ
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;vertical-align:middle;">
						18-03-10
					</div>
					<div style="display:table-cell;border-bottom:1px dotted gold;width:50px;vertical-align:middle;">
						1
					</div>
				</div>
				
				<%
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
				<input type="button" value="���۾���" style="width:50px;font-size:8pt;font-family:����;height:20px;padding:0;display:inline-block;">
			</div>
		</div>
	</div>

<%@ include file = "bottom.jsp" %>