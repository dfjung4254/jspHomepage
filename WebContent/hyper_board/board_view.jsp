<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ include file="../subMenu.jsp" %>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<%@ page import="home.board.BoardDTO" %>
<%

request.setCharacterEncoding("EUC-KR");

if(id==null||id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("로그인을 먼저해주세요");
		location.href="../login.jsp";
	</script>
	<%
	return;
}

int no = Integer.parseInt(request.getParameter("no"));

dao.plusViewCounts(no);
BoardDTO article = dao.getContents(no);

if(article.getTitle().contains("삭제된게시글입니다") && !(id.equals("dfjung4254"))){
	%>
	<script type="text/javascript">
		alert("삭제된게시물입니다");
		location.href="board_list.jsp?page=1";
	</script>
	<%
	return;
}


%>
	<div align="center">
		<div style="font-size:20pt;font-family:consolas;color:skyblue;letter-spacing:0.2em;">
			ARTICLE
		</div>
		<form name="board_insert" method="post" action="board_update.jsp">
			<div style="display:table; width:90%;margin-top:15px;">
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;border-top:2px solid white;font-family:consolas;font-size:9pt;">
						WRITER
					</div>
					<div style="display:table-cell;padding:3px;border-top:2px solid white;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="writer" value="<%= article.getWriter() %>" readonly type="text" style="height:100%;width:50%;color:lightgray;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;">
						&nbsp;
						 IP 
						&nbsp;&nbsp;
						<input name="writer_ip" value="<%= article.getWriter_ip() %>" readonly type="text" style="height:100%;color:lightgray;width:25%;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div> 
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						EMAIL
					</div>
					<div style="display:table-cell;padding:3px;text-align:left;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="email" value="<%= article.getEmail() %>" readonly type="text" style="height:100%;width:50%;color:lightgray;background-color:black;text-align:center;border:0px dotted lightgray;font-size:9pt;">
						&nbsp;
						 DATE
						&nbsp;&nbsp;
						<input name="date" value="<%= article.getDate() %>" readonly type="text" style="height:100%;color:lightgray;width:25%;text-align:center;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div>
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						TITLE
					</div>
					<div style="display:table-cell;padding:3px;text-align:left;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="title" type="text" value="<%= article.getTitle() %>" readonly style="height:100%;width:50%;color:white;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;">
						&nbsp;
						 VIEWS
						&nbsp;&nbsp;
						<input name="views" value="<%= article.getViews() %>" readonly type="text" style="height:100%;color:lightgray;width:25%;text-align:center;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div>
				<div style="display:table-row">
					<div style="border-bottom:2px solid white;display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						CONTENTS
					</div>
					<div style="border-bottom:2px solid white;display:table-cell;padding:3px;text-align:left;">
						<input name="writer_id" value="<%= article.getWriter_id() %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="list_index" value="<%= article.getList_index() %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="list_indexLevel" value="<%= article.getList_indexLevel() %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="no" value="<%= article.getNo() %>" type="hidden" >
						<input name="contents" value="<%= article.getContents() %>" type="hidden" >
					</div>
				</div>
			</div>
			<div style="display:table;width:90%;margin-top:10px">
				<div style="display:table-row">
					<div style="display:table-cell;font-size:9pt;color:white;font-family:돋움;text-align:center;">
						<%= article.getContents().replace("\r\n", "<br>") %> 
					</div>
				</div>		
			</div>
			<div style="display:table;width:90%;margin-top:10px">
				<div style="display:table-row">
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:center;padding-right:20px;">
						<input type="submit" value="수정" style="background-color:black;border:1px solid white;color:white;">
					</div>
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:center;padding-right:20px;">
						<input type="button" value="삭제" style="background-color:black;border:1px solid white;color:white;" onclick="javascript:delConfirm(<%= no %>)">
					</div>
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:center;padding-right:20px;">
						<input type="button" value="답글" style="background-color:black;border:1px solid white;color:white;" onclick="location.href='board_insert.jsp?index=<%= article.getList_index()+1 %>&level=<%= article.getList_indexLevel()+1 %>'">
					</div>
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:center;padding-left:20px;">
						<input type="button" value="뒤로" style="background-color:black;border:1px solid white;color:white;" onclick="history.back()">
					</div>
				</div>		
			</div>
		</form>
	</div>

<%@ include file="../bottom.jsp" %>