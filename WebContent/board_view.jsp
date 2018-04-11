<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="home.board.BoardDTO" %>
<jsp:useBean id="dao" class="home.member.MemberDAO" />
<jsp:useBean id="b_dao" class="home.board.BoardDAO" />
<%@ include file="top.jsp" %>
<%@ include file="subMenu.jsp" %>
<%

	request.setCharacterEncoding("EUC-KR");
	String ip = request.getLocalAddr();
	

	String member_name = "";
	String member_email = "";
	String member_id = (String)session.getAttribute("id");
	int board_no = Integer.parseInt(request.getParameter("no"));
	System.out.println(ip+" 에서 "+board_no+"번 글 읽음.");
	BoardDTO dto = b_dao.getContents(board_no);
	if(member_id == null || member_id.trim().equals("")){
		//비로그인상태(접근제한)
		%>
		
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요");
			location.href = "login.jsp";
		</script>
		
		<%
	}else{
		//로그인상태(id이용 사용자정보 가져와야함)
		member_name = dao.getValue("id", member_id, "name");
		member_email = dao.getValue("id", member_id, "email");
		b_dao.view_update(board_no);
	}

%>
	<div align="center" style = "margin-top:15px;width:100%; height:450;">
	<div style="font-size:20pt;font-family:consolas;color:skyblue;">NEW ARTICLE</div>
		<div style="padding-top:10px;margin-top:15px;width:550px;height:380px;border-top:1px solid gold;border-bottom:1px solid gold;">
			<form name="board_insert" method="post" action="board_insertCheck.jsp">
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
						<input type="text" name="title"  value="<%=dto.getTitle() %>" disabled style="color:white;font-size:10pt;padding-left:5px;width:300px;background-color:black;border:0px solid white;text-align:center;">
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
					<div style="display:table-cell;padding-bottom:10px;border-bottom:1px solid gray;text-align:left">
					<!-- 
						<textarea name="contents" disabled style="overflow:auto;
						scrollbar-face-color:black;scrollbar-highlight-color:white;
						scrollbar-track-color:black;width:500px;height:180px;
						background-color:black;color:white;border:1px solid white;padding:8px;font-size:10pt;
						font-family:돋움;text-align:left;" >
						-->
						<%=dto.getContents() %>
						<!-- </textarea>  -->
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:돋움;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					이메일
					</div>
					<div style="display:table-cell">
						<input type="text" name="email" disabled value="<%=dto.getEmail() %>" style="color:white;font-size:10pt;padding-left:5px;width:300px;background-color:black;border:0px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:250px;font-size:10pt;font-family:돋움;margin-top:20px;">
				<div style="display:table-row">
					<div style="display:table-cell">
						<input type="button" value="수정" style="color:white;background-color:black;border:1px solid gold" onclick="location.href='board_update.jsp?no=<%= dto.getNo() %>'">
					</div>
					<div style="display:table-cell">
						<input type="button" value="삭제" style="color:white;background-color:black;border:1px solid gold" onclick="delConfirm(<%=dto.getNo() %>);">
					</div>
					<div style="display:table-cell">
						<input type="button" value="뒤로" style="color:white;background-color:black;border:1px solid gold" onclick="history.back()">
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
<%@ include file="bottom.jsp" %>