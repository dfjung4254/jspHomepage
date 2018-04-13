<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="home.board.BoardDTO" />
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<jsp:setProperty name="dto" property="*" />
<%

int ret = dao.updateContents(dto);

if(ret > 0){
	%>
	<script type="text/javascript">
		alert("글 수정 완료!");
		location.href="board_view.jsp?no=<%= dto.getNo() %>";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("글 수정 실패, 관리자에게 문의하세요");
		history.back();
	</script>
	<%
}

%>