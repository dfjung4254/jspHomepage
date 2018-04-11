<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO" />
<%@ include file="../top.jsp" %>
<%@ include file="../subMenu.jsp" %>
<%

request.setCharacterEncoding("EUC-KR");
//login check
if(id==null || id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("로그인을 먼저 해주세요!");
		location.href="../login.jsp";
	</script>
	<%
	return;
}
//writer info check
String writer = dao.getValue("id", id, "name");
String writer_ip = request.getRemoteAddr();
String email = dao.getValue("id", id, "email");
int list_index = Integer.parseInt(request.getParameter("index"));
int list_indexLevel = Integer.parseInt(request.getParameter("level"));

%>
	<div align="center">
		<div style="font-size:20pt;font-family:consolas;color:skyblue;letter-spacing:0.2em;">
			NEW ARTICLE
		</div>
		<form name="board_insert" method="post" action="board_insertCheck.jsp">
			<div style="display:table; width:90%;margin-top:15px;">
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;border-top:2px solid white;font-family:consolas;font-size:9pt;">
						WRITER
					</div>
					<div style="display:table-cell;padding:3px;border-top:2px solid white;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="writer" value="<%= writer %>" readonly type="text" style="height:100%;width:40%;color:lightgray;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;">
						&nbsp;
						 IP 
						&nbsp;&nbsp;
						<input name="writer_ip" value="<%= writer_ip %>" readonly type="text" style="height:100%;color:lightgray;width:35%;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div> 
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						EMAIL
					</div>
					<div style="display:table-cell;padding:3px;text-align:left;">
						<input name="email" value="<%= email %>" type="text" style="height:100%;width:90%;color:white;background-color:black;border:1px dotted lightgray;font-size:9pt;">
					</div>
				</div>
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						TITLE
					</div>
					<div style="display:table-cell;padding:3px;text-align:left;">
						<input name="title" type="text" style="height:100%;width:90%;color:white;background-color:black;border:1px dotted lightgray;font-size:9pt;">
					</div>
				</div>
				<div style="display:table-row">
					<div style="border-bottom:2px solid white;display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						CONTENTS
					</div>
					<div style="border-bottom:2px solid white;display:table-cell;padding:3px;text-align:left;">
						<input name="writer_id" value="<%= id %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="list_index" value="<%= list_index %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="list_indexLevel" value="<%= list_indexLevel %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
					</div>
				</div>
			</div>
			<div style="display:table;width:90%;margin-top:10px">
				<div style="display:table-row">
					<div style="display:table-cell;">
						<textarea name="contents" style="width:95%;height:200px;color:white;background-color:black;border:1px dotted lightgray;"></textarea>
					</div>
				</div>		
			</div>
			<div style="display:table;width:90%;margin-top:10px">
				<div style="display:table-row">
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:right;padding-right:20px;">
						<input type="submit" value="완료" style="background-color:black;border:1px solid white;color:white;">
					</div>
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:left;padding-left:20px;">
						<input type="button" value="취소" style="background-color:black;border:1px solid white;color:white;" onclick="history.back()">
					</div>
				</div>		
			</div>
		</form>
	</div>
<%@ include file="../bottom.jsp" %>