<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dao" class="home.board.ReplyDAO" />
<jsp:useBean id="dto" class="home.board.ReplyDTO" />
<jsp:setProperty name="dto" property="*" />
<%

int ret = dao.insultReply(dto);

if(ret > 0){
	%>
	<script type="text/javascript">
		alert("´ñ±Ûµî·Ï!");
		location.href="board_view.jsp?no=<%= dto.getBoard_no() %>";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("´ñ±Ûµî·Ï½ÇÆÐ!");
		location.href="board_view.jsp?no=<%= dto.getBoard_no() %>";
	</script>
	<%
}

%>