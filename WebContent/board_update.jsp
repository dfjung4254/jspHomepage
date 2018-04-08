<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="home.board.BoardDTO" %>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<%@ include file="top.jsp" %>
<%@ include file="subMenu.jsp" %>
<%

request.setCharacterEncoding("EUC-KR");

String board_no = request.getParameter("no");
String login_id = (String)session.getAttribute("id");
String writer_id = dao.getValue("no", board_no, "writer_id");

//login여부 확인
if(login_id == null || login_id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("로그인을 먼저 해주세요");
		location.href = "board.jsp?page=1";
	</script>
	<%
	return;
}

//sessionId == writer_id 확인
if(!(login_id.equals(writer_id))){
	%>
	<script type="text/javascript">
		alert("작성자만 수정할 수 있습니다");
		location.href = "board.jsp?page=1";
	</script>
	<%
	return;
}

//Update 내용 가져오기
BoardDTO dto = dao.getContents(Integer.parseInt(board_no));

%>

	<div align="center" style = "margin-top:15px;width:100%; height:450;">
	<div style="font-size:20pt;font-family:consolas;color:skyblue;">NEW ARTICLE</div>
		<div style="padding-top:10px;margin-top:15px;width:550px;height:380px;border-top:1px solid gold;border-bottom:1px solid gold;">
			<form name="board_update" method="post" action="board_updateCheck.jsp">
			<div style="display:table;width:550px;font-size:10pt;font-family:돋움;margin-top:5px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					작성자
					</div>
					<div style="display:table-cell">
						<input type="text" name="name" value="<%=dto.getWriter() %>" disabled style="color:white;font-size:10pt;text-align:center;width:300px;background-color:black;border:0px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:돋움;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					제목
					</div>
					<div style="display:table-cell">
						<input type="text" name="title"  value="<%=dto.getTitle() %>" style="color:white;font-size:10pt;padding-left:5px;width:300px;background-color:black;border:1px solid white;text-align:center;">
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:돋움;margin-top:10px;">
				<div style="display:table-row;padding-bottom:5px;">
					<div style="display:table-cell;border-bottom:1px solid gray;width:120px;">
					내용
					</div>
					<div style="display:table-cell;border-bottom:1px solid gray;">
						<input type="text" disabled  style="font-size:10pt;text-align:center;width:300px;background-color:black;border:0px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:돋움;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;padding-bottom:10px;border-bottom:1px solid gray;">
						<textarea name="contents" style="overflow:auto;
						scrollbar-face-color:black;scrollbar-highlight-color:white;
						scrollbar-track-color:black;width:500px;height:180px;
						background-color:black;color:white;border:1px solid white;padding:8px;font-size:10pt;
						font-family:돋움;" >
						<%=dto.getContents() %>
						</textarea>
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:돋움;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					이메일
					</div>
					<div style="display:table-cell">
						<input type="text" name="email" value="<%=dto.getEmail() %>" style="color:white;font-size:10pt;padding-left:5px;width:300px;background-color:black;border:1px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:250px;font-size:10pt;font-family:돋움;margin-top:20px;">
				<div style="display:table-row">
					<div style="display:table-cell">
						<input type="button" value="수정" style="color:white;background-color:black;border:1px solid gold" onclick="updateCheck()">
					</div>
					<div style="display:table-cell">
						<input type="button" value="뒤로" style="color:white;background-color:black;border:1px solid gold" onclick="history.back()">
					</div>
				</div>
			</div>
			<input type="hidden" value="<%= dto.getNo() %>" name="no">
			<input type="hidden" value="<%= dto.getWriter_id() %>" name="writer_id">
			</form>
		</div>
	</div>
<%@ include file="bottom.jsp" %>