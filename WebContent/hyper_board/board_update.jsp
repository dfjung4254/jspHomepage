<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ include file="../subMenu.jsp" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="home.board.BoardDTO" />
<jsp:setProperty name="dto" property="*" />
<%
//세션 체크
dto.setWriter_ip(request.getRemoteAddr());

//login check
if(id==null || id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("로그인을 해주세요");
		location.href="../login.jsp";
	</script>
	<%
	return;
}
//login_id == writer_id CHECK
if(!(dto.getWriter_id().equals(id))){
	//불일치
	%>
	<script type="text/javascript">
		alert("작성자만 수정할 수 있습니다.");
		history.back();
	</script>
	<%
	return;
}

%>
<!-- 아웃라인 구성 -->
<div align="center">
		<div style="font-size:20pt;font-family:consolas;color:skyblue;letter-spacing:0.2em;">
			REVISE
		</div>
		<form name="board_insert" method="post" action="board_updateCheck.jsp">
			<div style="display:table; width:90%;margin-top:15px;">
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;border-top:2px solid white;font-family:consolas;font-size:9pt;">
						WRITER
					</div>
					<div style="display:table-cell;padding:3px;border-top:2px solid white;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="writer" value="<%= dto.getWriter() %>" readonly type="text" style="height:100%;width:50%;color:lightgray;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;">
						&nbsp;
						 IP 
						&nbsp;&nbsp;
						<input name="writer_ip" value="<%= dto.getWriter_ip() %>" readonly type="text" style="height:100%;color:lightgray;width:25%;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div> 
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						EMAIL
					</div>
					<div style="display:table-cell;padding:3px;text-align:left;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="email" value="<%= dto.getEmail() %>"  type="text" style="height:100%;width:50%;color:lightgray;background-color:black;text-align:center;border:1px dotted lightgray;font-size:9pt;">
						&nbsp;
						 DATE
						&nbsp;&nbsp;
						<input name="date" value="<%= dto.getDate() %>" readonly type="text" style="height:100%;color:lightgray;width:25%;text-align:center;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div>
				<div style="display:table-row">
					<div style="display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						TITLE
					</div>
					<div style="display:table-cell;padding:3px;text-align:left;text-align:left;font-family:consolas;font-size:9pt;">
						<input name="title" type="text" value="<%= dto.getTitle() %>"  style="height:100%;width:50%;color:white;text-align:center;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						&nbsp;
						 VIEWS
						&nbsp;&nbsp;
						<input name="views" value="<%= dto.getViews() %>" readonly type="text" style="height:100%;color:lightgray;width:25%;text-align:center;text-align:center;background-color:black;border:0px dotted lightgray;font-size:9pt;" >
					</div>
				</div>
				<div style="display:table-row">
					<div style="border-bottom:2px solid white;display:table-cell;padding:3px;width:20%;font-family:consolas;font-size:9pt;">
						CONTENTS
					</div>
					<div style="border-bottom:2px solid white;display:table-cell;padding:3px;text-align:left;">
						<input name="writer_id" value="<%= dto.getWriter_id() %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="list_index" value="<%= dto.getList_index() %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="list_indexLevel" value="<%= dto.getList_indexLevel() %>" type="hidden" style="height:100%;width:90%;background-color:black;border:1px dotted lightgray;font-size:9pt;">
						<input name="no" value="<%= dto.getNo() %>" type="hidden" >
					</div>
				</div>
			</div>
			<div style="display:table;width:90%;margin-top:10px">
				<div style="display:table-row">
					<div style="display:table-cell;font-size:9pt;color:white;font-family:돋움;text-align:center;">
						<textarea name="contents" style="width:95%;height:200px;color:white;background-color:black;border:1px dotted lightgray;"><%= dto.getContents() %></textarea>
					</div>
				</div>		
			</div>
			<div style="display:table;width:90%;margin-top:10px">
				<div style="display:table-row">
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:center;padding-right:20px;">
						<input type="submit" value="수정" style="background-color:black;border:1px solid white;color:white;">
					</div>
					<div style="display:table-cell;border-top:2px solid white;padding-top:5px;text-align:center;padding-left:20px;">
						<input type="button" value="취소" style="background-color:black;border:1px solid white;color:white;" onclick="location.href='board_view.jsp?no=<%= dto.getNo() %>'">
					</div>
				</div>		
			</div>
		</form>
	</div>
<%@ include file="../bottom.jsp" %>